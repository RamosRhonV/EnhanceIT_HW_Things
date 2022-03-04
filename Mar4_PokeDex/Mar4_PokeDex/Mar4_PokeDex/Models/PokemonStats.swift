//
//  PokemonStats.swift
//  Mar4_PokeDex
//
//  Created by Consultant on 3/4/22.
//

import Foundation

struct PokemonStats: Codable {
    var base_stat:Int
    var effort:Int
    var stat:[Stats]
}

struct Stats: Codable {
    var name:String
    var url:String?
}
