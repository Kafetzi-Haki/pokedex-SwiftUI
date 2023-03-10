//
//  PokemonList.swift
//  Pokedex
//
//  Created by Haki Kafetzi on 22.12.22.
//

import SwiftUI

struct PokemonList: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    @StateObject var viewModel = PokemonManager()
    @State private var pokemonData: [DetailPokemon] = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(pokemonData){pokemon in
                        NavigationLink {
                            PokemonInfo(pokemon: pokemon,
                                        typeColor: getPokemonTypeColor(type: pokemon.types[0].type.name))
                        } label: {
                            PokemonCell(pokemon: pokemon,
                                        typeColor: getPokemonTypeColor(type: pokemon.types[0].type.name))
                        }
                    }
                }
            }
            .navigationTitle("Pokedex")
            .onAppear {
                for pokemon in self.viewModel.Pokemons {
                    fetchData(url: pokemon.url){(pokemon: DetailPokemon) in
                        self.pokemonData.append(pokemon)
                    }
                }
            }
        }
    }
    
    func getPokemonTypeColor(type: String) -> Color {
        switch type {
            case "grass":
            return Color.green
            case "electric":
            return Color.yellow
            case "ground", "bug", "rock":
            return Color.brown
            case "water", "ice":
            return Color.blue
            case "normal":
            return Color.gray
            case "poison", "pychic", "fairy":
            return Color.purple
            case "fire":
            return Color.red
            default:
            return Color.orange
        }
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    }
}
