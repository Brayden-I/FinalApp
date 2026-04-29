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
    var base_experience: Int
    var abilities: [PokemonAbility]
    var moves: [PokemonMove]
    var stats: [PokemonStats]
    var height: Int
    var weight: Int
}

// This is also a struct that will be used to hold the sprites from the API. As of now we will only use 1 sprite
struct PokemonSprites: Codable {
    var front_default: String
}

struct PokemonAbility: Codable {
    var ability: String
}

struct PokemonMove: Codable {
    var move: String
}

struct PokemonStats: Codable {
    var stat: String
    var base_stat: Int
}

struct PokemonType: Codable {
    var slot: Int
    var type: String
}

// This is the mock sample I will use for testing
extension Pokemon {
    // TODO: Create sample
}
