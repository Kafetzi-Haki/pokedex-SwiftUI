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
                            PokemonInfo()
                        } label: {
                            PokemonCell(pokemon: pokemon)
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
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    }
}
