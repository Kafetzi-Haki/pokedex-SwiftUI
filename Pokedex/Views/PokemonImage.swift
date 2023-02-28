//
//  PokemonImage.swift
//  Pokedex
//
//  Created by Haki Kafetzi on 22.12.22.
//

import SwiftUI

struct PokemonImage: View {
    var id: Int
    
    var body: some View {
        ZStack{
            AsyncImage(
                url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"),
                content: {image in
                    image
                        .resizable()
                        .scaledToFit()
                },
                placeholder: {ProgressView()})
        }
        .frame(width: 70, height: 70)
    }
}

struct PokemonImage_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImage(id: 357)
    }
}
