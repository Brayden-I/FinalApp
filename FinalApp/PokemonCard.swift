//
//  PokemonCard.swift
//  FinalApp
//
//  Created by IMADA, BRAYDEN on 4/27/26.
//

import SwiftUI

struct PokemonCard: View {
    @Environment(\.dismiss) var dismiss
    let pokemon: Character
    
    var body: some View {
        Text("Pokemon")
            .font(.title3)
            
        // TODO: Add pokemon card logic
        
        Divider()
        Text("About:")
            .font(.headline)
        
        Button(action: {dismiss()}) {
            Text("Done")
                .font(.largeTitle)
                .foregroundStyle(Color.pink)
                .padding()
                .background(Color.yellow)
                .cornerRadius(20)        }
    }
}

#Preview{
    
}
