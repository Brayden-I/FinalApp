//
//  PokemonViewModel.swift
//  FinalApp
//
//  Created by IMADA, BRAYDEN on 4/27/26.
//

import SwiftUI

// This is the ViewModel. It sits between the views and the API and manages all the data fetching
// @Observable replaces ObservableObject in iOS 17+ and handles updates automatically
@Observable
class PokemonViewModel {
    var pokemonList: [PokemonListEntry] = []
    var isLoading = false
    var errorMessage: String?
    var currentPage = 0
    var totalCount = 0

    // How many Pokemon to show per page
    let pageSize = 20

    // Whether there is a previous page to go back to
    var hasPrevious: Bool { currentPage > 0 }

    // Whether there is a next page to go forward to
    var hasNext: Bool { (currentPage + 1) * pageSize < totalCount }

    // Loads the current page from the API using offset based pagination
    func loadCurrentPage() async {
        isLoading = true
        errorMessage = nil

        let offset = currentPage * pageSize
        let urlString = "https://pokeapi.co/api/v2/pokemon?limit=\(pageSize)&offset=\(offset)"

        do {
            guard let url = URL(string: urlString) else { throw URLError(.badURL) }
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(PokemonListResponse.self, from: data)
            pokemonList = response.results
            totalCount = response.count
        } catch {
            errorMessage = "Failed to load Pokémon. Check your connection and try again."
        }

        isLoading = false
    }

    // Go to the next page and reload
    func nextPage() async {
        guard hasNext else { return }
        currentPage += 1
        await loadCurrentPage()
    }

    // Go to the previous page and reload
    func previousPage() async {
        guard hasPrevious else { return }
        currentPage -= 1
        await loadCurrentPage()
    }

    // Fetches the full details for one Pokemon by name when the user taps it
    func fetchDetail(name: String) async throws -> Pokemon {
        let urlString = "https://pokeapi.co/api/v2/pokemon/\(name)"
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(Pokemon.self, from: data)
    }
}
