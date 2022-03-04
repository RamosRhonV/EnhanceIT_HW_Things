//
//  Raw.swift
//  Mar4_PokeDex
//
//  Created by Consultant on 3/4/22.
//

import Foundation

struct Raw: Codable {
    var count:Int
    var next:String?
    var previous:String?
    var results:[Pokemon]
}
