//
//  PokemonTypes.swift
//  Mar4_PokeDex
//
//  Created by Consultant on 3/4/22.
//

import Foundation

struct PokemonTypes: Codable {
    var slot:Int
    var types:[Types]
}

struct Types: Codable {
    var name:String
    var url:String?
}
