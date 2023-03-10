//
//  PokemonInfo.swift
//  Pokedex
//
//  Created by Haki Kafetzi on 24.12.22.
//

import SwiftUI

struct PokemonInfo: View {
    let pokemon: DetailPokemon
    let typeColor: Color
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 200)
            VStack {
                CircleImage(id: pokemon.id)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                Text(pokemon.name.capitalized)
                    .font(.title)
                Divider()
                VStack(alignment: .leading){
                    Text("Details:")
                        .font(.title2)
                    Text("No. \(pokemon.id)")
                    HStack{
                        Text("Type(s): ")
                        VStack{
                            ForEach(pokemon.types, id: \.self){ t in
                                Text(t.type.name.capitalized)
                            }
                        }
                    }
                    Text("Height: \(pokemon.height)")
                    Text("Weight: \(pokemon.weight)")
                }
                Spacer()
            }
            .padding()
            .background(.white)
        }
        .background(typeColor)
    }
}

struct PokemonInfo_Previews: PreviewProvider {
    static var previews: some View {
        PokemonInfo(pokemon: DetailPokemon(id: 33, name: "test", height: 4, weight: 6, types: [Types(slot: 1, type: Type(name: "electric"))]), typeColor: .green)
    }
}
