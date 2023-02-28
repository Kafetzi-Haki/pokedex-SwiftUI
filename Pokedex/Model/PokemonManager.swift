//
//  PokemonManager.swift
//  Pokedex
//
//  Created by Haki Kafetzi on 23.12.22.
//

import Foundation

final class PokemonManager: ObservableObject {
    @Published var Pokemons: [PokemonLink] = loadFromJson("Pokemons.json")
}

func loadFromJson<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

func fetchData(url: String, completion: @escaping (DetailPokemon) -> Void) {
    guard let url = URL(string: url) else {
        fatalError("Couldn't find in main bundle.")
    }
    
    URLSession.shared.dataTask(with: url){ (json, responde, error) in
        guard let json = json else {return}
        guard let pokemon = try? JSONDecoder().decode(DetailPokemon.self, from: json) else {return}
        
        completion(pokemon)
    }.resume()
}

