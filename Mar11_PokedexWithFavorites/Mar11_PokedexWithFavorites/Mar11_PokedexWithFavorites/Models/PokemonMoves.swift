//
//  PokemonMoves.swift
//  Mar4_PokeDex
//
//  Created by Consultant on 3/4/22.
//

import Foundation

struct PokemonMoves: Codable {
    var move:Moves
}

struct Moves: Codable {
    var name:String
    var url:String?
}
