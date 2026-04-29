//
//  PokemonModel.swift
//  FinalApp
//
//  Created by IMADA, BRAYDEN on 4/27/26.
//

import Foundation

// This struct holds the full details for a single Pokemon fetched from the detail endpoint
struct Pokemon: Codable {
    var id: Int
    var sprites: PokemonSprites
    var name: String
    var height: Int // In decimeters, divide by 10 for meters
    var weight: Int // In hectograms, divide by 10 for kg
    var types: [PokemonTypeSlot]
    var stats: [PokemonStat]
}

// Holds the sprite URLs. We only use the front facing one for now
struct PokemonSprites: Codable {
    var front_default: String
}

// The API nests type name inside a slot object and then a type object
struct PokemonTypeSlot: Codable {
    var type: PokemonType
}

struct PokemonType: Codable {
    var name: String
}

// Each stat has a value and a name
struct PokemonStat: Codable {
    var base_stat: Int
    var stat: StatInfo
}

struct StatInfo: Codable {
    var name: String
}

// This struct is what the list endpoint returns — just a name and a URL to fetch the full details
struct PokemonListEntry: Codable, Identifiable {
    var name: String
    var url: String

    // Identifiable requires an id. We pull it out of the URL since the API doesnt give us one directly
    var id: String { name }
}

// This struct wraps the list endpoint response which puts the results inside a "results" key
struct PokemonListResponse: Codable {
    var results: [PokemonListEntry]
}

// Sample data used for previews so we dont have to hit the API every time
extension Pokemon {
    static let sample = Pokemon(
        id: 25,
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