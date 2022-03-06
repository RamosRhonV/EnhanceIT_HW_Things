//
//  PokemonGameIndicies.swift
//  Mar4_PokeDex
//
//  Created by Consultant on 3/4/22.
//

import Foundation

struct PokemonGameIndices: Codable {
    var game_index:Int
    var version:GVersion
}

struct GVersion: Codable {
    var name:String
    var url:String?
}
