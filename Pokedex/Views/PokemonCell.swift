//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Haki Kafetzi on 22.12.22.
//

import SwiftUI

struct PokemonCell: View {
    var pokemon: DetailPokemon
    var typeColor: Color
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading){
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 10)
                    .padding([.leading, .trailing])
                
                HStack{
                    Text(pokemon.types[0].type.name.capitalized)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 100, height: 24)
                    
                    PokemonImage(id: pokemon.id)
                        .padding([.bottom, .trailing], 4)
                }
                .frame(alignment: .bottomTrailing)
            }
        }
        .background(typeColor)
        .cornerRadius(12)
        .shadow(color: typeColor, radius: 6)
        
        
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(pokemon: DetailPokemon(id: 1, name: "test", height: 4, weight: 6, types: [Types(slot: 1, type: Type(name: "electric"))]), typeColor: .yellow)
    }
}
