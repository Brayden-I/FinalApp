//
//  BrowseView.swift
//  FinalApp
//
//  Created by IMADA, BRAYDEN on 5/4/26.
//

import SwiftUI

// This is the browse tab. Shows a paged grid of Pokemon the user can tap to see details
struct BrowseView: View {
    @State var viewModel = PokemonViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if viewModel.errorMessage != nil {
                    Text("Failed to load Pokémon")
                } else {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                            ForEach(viewModel.pokemonList) { entry in
                                NavigationLink(destination: DetailView(pokemonName: entry.name, viewModel: viewModel)) {
                                    VStack {
                                        AsyncImage(url: spriteURL(for: entry)) { phase in
                                            if case .success(let image) = phase {
                                                image.resizable().scaledToFit()
                                            } else {
                                                Color.gray.opacity(0.2)
                                            }
                                        }
                                        .frame(width: 80, height: 80)
                                        Text(entry.name.capitalized)
                                    }
                                }
                            }
                        }
                    }
                }

                HStack {
                    Button("Previous") { Task { await viewModel.previousPage() } }
                        .disabled(!viewModel.hasPrevious)
                    Spacer()
                    Text("Page \(viewModel.currentPage + 1)")
                    Spacer()
                    Button("Next") { Task { await viewModel.nextPage() } }
                        .disabled(!viewModel.hasNext)
                }
                .padding()
            }
            .navigationTitle("Pokédex")
            .task { await viewModel.loadCurrentPage() }
        }
    }

    // Pulls the ID from the entry url to build the sprite link
    func spriteURL(for entry: PokemonListEntry) -> URL? {
        let trimmed = entry.url.trimmingCharacters(in: CharacterSet(charactersIn: "/"))
        let id = trimmed.components(separatedBy: "/").last ?? ""
        return URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")
    }
}

#Preview {
    BrowseView()
}
