//
//  DogViewModel.swift
//  DogApi
//
//  Created by IMADA, BRAYDEN on 4/22/26.
//
import Combine
import SwiftUI

class PokemonViewModel: ObservableObject {
    @Published var pokemon: Pokemon?
    
    func fetchPokemon(id: Int) async throws -> Pokemon {
        // Use \(id) instead of \(name)
        let urlString = "https://pokeapi.co/api/v2/pokemon/\(id)"
        
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
        return pokemon
    }
}
