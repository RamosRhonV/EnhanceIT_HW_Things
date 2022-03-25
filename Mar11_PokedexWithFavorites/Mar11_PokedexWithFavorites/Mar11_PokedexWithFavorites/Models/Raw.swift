//
//  Raw.swift
//  Mar4_PokeDex
//
//  Created by Consultant on 3/4/22.
//

import Foundation

// models folder holds the structs that model the individual parts
// of the returned JSON
struct Raw: Codable {
    var count:Int
    var next:String?
    var previous:String?
    var results:[Pokemon]
}
