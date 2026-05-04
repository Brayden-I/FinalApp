//
//  PokemonCard.swift
//  FinalApp
//
//  Created by IMADA, BRAYDEN on 4/27/26.
//

import SwiftUI

struct PokemonDetailView: View {
    @Environment(\.dismiss) var dismiss
    let pokemonName: String
    var viewModel: PokemonViewModel
    
    // Local variables
    @State var pokemon: Pokemon? = nil
    @State var isLoading: Bool = true
    @State var errorMessage: String? = nil
    
    var body: some View {
            
        // TODO: Add pokemon card logic
        
        VStack{
            Text("About this Pokemon")
                .font(.largeTitle)
                
            ScrollView(.vertical, showsIndicators: false){
                if isLoading {
                    ProgressView("Loading pokemon")
                } else if errorMessage != nil {
                    Text("Error loading pokemon")
                } else {
                    let pokemon = self.pokemon!
                    VStack(alignment: .leading, spacing: 10){
                        Text("Name: \(pokemon.name)")
                        Spacer()
                        
                        AsyncImage(url: self.spriteURL(for: pokemon.sprites.front_default))
                        
                        Spacer()
                        HStack{ // Pokemon type
                            ForEach(pokemon.types, id: \.self){ type in
                                Text(type.type.name)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                        HStack{ // Pokemon stats
                            ForEach(pokemon.stats.enumerated(), id: \.offset){ index, stat in
                                Text("\(stat.stat.name.capitalized): \(stat.base_stat)")
                            }
                        }
                        Spacer()
                        Text("Height: \(pokemon.height)")
                        Text("Weight: \(pokemon.weight)")
                    }
                }
            }
        }
    
        .task {
            do {
                self.pokemon = try await self.viewModel.fetchDetail(name: self.pokemonName)
            } catch {
                errorMessage = "Failed to fetch pokemon"
            }
            isLoading = false
        }
    }
    // Helpers
    func spriteURL(for name: String) -> URL {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(name).png")!
    }
}

#Preview{
    PokemonDetailView(pokemonName: "pikachu", viewModel: PokemonViewModel())
}
