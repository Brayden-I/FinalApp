//
//  PokemonIcon.swift
//  FinalApp
//
//  Created by IMADA, BRAYDEN on 4/29/26.
//

import SwiftUI

struct PokemonIcon: View {
    let pokemon: Pokemon
    
    var body: some View {
        ZStack(alignment: .top){
            
            Text(pokemon.name)
                .foregroundColor(.red)
                .bold(true)
                .font(.title)

            Image(pokemon.sprites.front_default)
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.top, 25)
        }
        .padding(3)
        .frame(width: .Magnitude(100), height: 200)
        .background(.gray)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    PokemonIcon(pokemon: Pokemon.sample)
}
