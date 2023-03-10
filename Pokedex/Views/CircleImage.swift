//
//  CircleImage.swift
//  Pokedex
//
//  Created by Haki Kafetzi on 10.03.23.
//

import SwiftUI

struct CircleImage: View {
    var id:Int
    
    var body: some View {
        AsyncImage(
            url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"),
            content: {image in
                image
                    .resizable()
                    .frame(width: 200, height: 200)
            },
            placeholder: {ProgressView()})
        .background(Color.gray.brightness(0.3))
        .clipShape(Circle())
        .overlay {
            Circle().stroke(.white, lineWidth: 4)
        }
        .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(id:1)
    }
}
