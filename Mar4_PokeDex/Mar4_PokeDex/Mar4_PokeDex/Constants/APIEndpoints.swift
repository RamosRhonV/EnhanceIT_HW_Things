//
//  APIEndpoints.swift
//  Mar4_PokeDex
//
//  Created by Consultant on 3/4/22.
//

import Foundation

struct APIEndpoints {
    static let pokemons = URL(string:"https://pokeapi.co/api/v2/pokemon/")
    static let pokemonsFirstThirty = URL(string:"https://pokeapi.co/api/v2/pokemon?offset=0&limit=30")
}
