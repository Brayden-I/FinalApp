//
//  BrowseView.swift
//  FinalApp
//
//  Created by IMADA, BRAYDEN on 5/4/26.
//

import SwiftUI

// This is the browse tab view. It will show pages of pokemon icons and allow the user to click to view it's details.
struct BrowseView: View {
    @StateObject var viewModel: PokemonViewModel = .init()
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                //Main logic - will say loading until page of pokemon has been fetched - if there is an issue getting the pokemon it will say there is an error
                ZStack {
                    if viewModel.isLoading {
                        ProgressView("Loading pokemon")
                    } else if viewModel.errorMessage != nil {
                        Spacer()
                        VStack {
                            Image("exclamationmark.triangle.fill")
                            Text("There was an issue fetching pokemon page")
                        }
                    }
                    else { // Use a for loop to display all pokemon icons on the page
                        ScrollView { // Use ScrollView for Grids
                            let columns = [GridItem(.flexible()), GridItem(.flexible())]

                            LazyVGrid(columns: columns) {
                                ForEach(viewModel.pokemonList) { pokemon in
                                    NavigationLink(destination: PokemonDetailView(pokemonName: pokemon.name, viewModel: self.viewModel)) {
                                        AsyncImage(url: self.spriteURL(for: pokemon.name))
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    // Helpers
    func spriteURL(for name: String) -> URL {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(name).png")!
    }
}

#Preview {
    BrowseView()
}
