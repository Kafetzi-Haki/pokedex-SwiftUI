//
//  Pokemon.swift
//  Pokedex
//
//  Created by Haki Kafetzi on 23.12.22.
//

import Foundation
import SwiftUI

struct PokemonLink: Codable, Hashable {
    var name: String
    var url: String
}

struct DetailPokemon: Codable, Identifiable, Hashable {
    var id: Int
    var name: String
    var height: Int
    var weight: Int
    var types: [Types]
}

struct Types: Codable, Hashable {
    var slot: Int
    var type: Type
}

struct Type: Codable, Hashable {
    var name: String
}
