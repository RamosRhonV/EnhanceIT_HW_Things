//
//  Brewery.swift
//  Mar1_BreweryAPI
//
//  Created by Consultant on 3/1/22.
//

import Foundation

class Brewery {
    var name: String
    var type: String
    var city: String
    var state: String
    
    init(name:String, type:String, city:String, state:String) {
        self.name = name
        self.type = type
        self.city = city
        self.state = state
    }
}
