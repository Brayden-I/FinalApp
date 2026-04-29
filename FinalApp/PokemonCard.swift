//
//  PokemonCard.swift
//  FinalApp
//
//  Created by IMADA, BRAYDEN on 4/27/26.
//

import SwiftUI

struct PokemonCard: View {
    @Environment(\.dismiss) var dismiss
    let pokemon: Pokemon
    
    var body: some View {
        Text(pokemon.name)
            .font(.title3)
            
        // TODO: Add pokemon card logic
        
        Image(pokemon.sprites.front_default)
        
        Divider()
        Text("About:")
            .font(.headline)
        
        Text("Height:")
            .font(.subheadline)
        Text(pokemon.height.description)
            .font(.subheadline)
        Text("Weight:")
            .font(.subheadline)
        Text(pokemon.weight.description)
            .font(.subheadline)
        
        Button(action: {dismiss()}) {
            Text("Done")
                .font(.largeTitle)
                .foregroundStyle(Color.gray)
                .padding()
                .background(Color.red)
                .cornerRadius(20)        }
    }
}

#Preview{
    PokemonCard(pokemon: Pokemon.sample) // We use sample so that it does not have to GET from an API every preview
}
