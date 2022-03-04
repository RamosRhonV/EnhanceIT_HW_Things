//
//  PokemonAttributes.swift
//  Mar4_PokeDex
//
//  Created by Consultant on 3/4/22.
//

import Foundation

struct PokemonAttributes: Codable {
    var abilities:[PokemonAbilities]
    var base_experience:Int
    var forms:[PokemonForms]
    var game_indices:[PokemonGameIndices]
    var height:Int
    var held_items:[PokemonHeldItems]
    var id:Int
    var is_default:Bool
    var location_area_encounters:String?
    var moves:[PokemonMoves]
    var name:String
    var order:Int
    var past_types:[PokemonPastTypes]
    var species:[PokemonSpecies]
    var sprites:[PokemonSprites]
    var stats:[PokemonStats]
    var types:[PokemonTypes]
}
