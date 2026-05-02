//
//  PokemonModel.swift
//  FinalApp
//
//  Created by IMADA, BRAYDEN on 4/27/26.
//

import Foundation

// This is a struct. It is a datatype used for holding a value type. In this case we will be holding a Pokemon reference
// Codable lets Swift automatically decode this from the JSON the API sends back
struct Pokemon: Codable {
    var sprites: PokemonSprites
    var name: String
    var height: Int // Height in decimeters (divide by 10 to get meters)
    var weight: Int // Weight in hectograms (divide by 10 to get kg)
    var types: [PokemonTypeSlot] // A Pokemon can have 1 or 2 types
    var stats: [PokemonStat] // Base stats like HP, Attack, Defense, etc.
}

// This struct holds the sprite URLs. We only use the front facing one for now
struct PokemonSprites: Codable {
    var front_default: String
}

// The API nests the type name inside a slot and then a type object, so we need both structs
struct PokemonTypeSlot: Codable {
    var type: PokemonType
}

struct PokemonType: Codable {
    var name: String
}

// Each stat has a value and a name, also nested in the API response
struct PokemonStat: Codable {
    var base_stat: Int
    var stat: StatInfo
}

struct StatInfo: Codable {
    var name: String
}

// This is the mock sample used for previews so we dont have to hit the API every time
extension Pokemon {
    static let sample = Pokemon(
        sprites: PokemonSprites(front_default: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png"),
        name: "pikachu",
        height: 4,
        weight: 60,
        types: [PokemonTypeSlot(type: PokemonType(name: "electric"))],
        stats: [
            PokemonStat(base_stat: 35, stat: StatInfo(name: "hp")),
            PokemonStat(base_stat: 55, stat: StatInfo(name: "attack")),
            PokemonStat(base_stat: 40, stat: StatInfo(name: "defense")),
            PokemonStat(base_stat: 90, stat: StatInfo(name: "speed")),
        ]
    )
}