//
//  Hero.swift
//  Mar3_TableViewWithCodable
//
//  Created by Consultant on 3/2/22.
//

import Foundation

struct Hero:Codable {
    let name:String
    let primaryAttribute:String
    let attackType:String
    let legs:Int
    let image:String
    
    enum CodingKeys: String, CodingKey {
        case name = "localized_name"
        case primaryAttribute = "primary_attr"
        case attackType = "attack_type"
        case legs = "legs"
        case image = "img"
    }
}



