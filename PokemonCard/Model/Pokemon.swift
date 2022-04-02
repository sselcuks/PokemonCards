//
//  Pokemon.swift
//  PokemonCard
//
//  Created by Selcuk on 31.03.2022.
//

import Foundation

struct Pokemon: Codable{
    
    var results: [Result]
}

struct Result: Codable {
    var name: String
    var url: String?
}


struct PokemonSkills:Codable{
    var stats: [Stat]
    var name: String
    var sprites: Sprites
}

struct Stat: Codable {
    var baseStat, effort: Int
    var stat: Species

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

struct Species:Codable{
    var name: String
}

struct Sprites:Codable{
    var front: String
    enum CodingKeys: String,CodingKey{
        case front = "front_default"
    }
}
