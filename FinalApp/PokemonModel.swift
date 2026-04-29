//
//  Pokemon.swift
//  FinalApp
//
//  Created by IMADA, BRAYDEN on 4/27/26.
//



import Foundation // Has all the dependencies for the API

// This is a struct. It is a datatype used for holding a value type. In this case we will be holding a pokemon reference
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

// This is the mock sample I will use for testing
extension Pokemon {
    static let sample = Pokemon(
        sprites: PokemonSprites(front_default: "https://github.com/PokeAPI/sprites/blob/253846168bbf04ee951a79cd28aed742df48053d/sprites/pokemon/25.png?raw=true"),
        name: "pikachu",
        height: 4,
        weight: 60,
    )
}
