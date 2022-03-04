//
//  PokemonAbilities.swift
//  Mar4_PokeDex
//
//  Created by Consultant on 3/4/22.
//

import Foundation

struct PokemonAbilities: Codable {
    var ability:[Abilities]
}

struct Abilities: Codable {
    var name:String
    var url:String?
}
