//
//  Pokemon.swift
//  FinalApp
//
//  Created by IMADA, BRAYDEN on 4/27/26.
//

// This is a struct. It is a datatype used for holding a value type. In this case we will be holding a pokemon reference

import Foundation // Has all the dependencies for the API

struct Pokemon: Codable {
    var sprites: PokemonSprites
    var name: String
    var height: Int
    var weight: Int
}

// This is also a struct that will be used to hold the sprites from the API. As of now we will only use 1 sprite
struct PokemonSprites: Codable {
    var front_default: String
}

// API




// This is the mock sample I will use for testing
extension Pokemon {
    static let sample = Pokemon(
        sprites: PokemonSprites(front_default: "https://githubusercontent.com"),
        name: "pikachu",
        height: 4,
        weight: 60,
    )
}
