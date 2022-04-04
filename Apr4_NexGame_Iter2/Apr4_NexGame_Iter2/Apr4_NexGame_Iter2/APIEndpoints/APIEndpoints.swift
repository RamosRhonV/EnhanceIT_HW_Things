//
//  APIEndpoints.swift
//
//  Created by Consultant on 3/30/22.
//

import Foundation

struct APIEndpoints {
    
    // api requires API key to fetch urls
    static let rawgKey = "key=8b873156b26749f2bc59f321200181f4"
    
    // api url to fetch a list of all games
    static let gamesEndpoint = URL(string: "https://api.rawg.io/api/games?" + rawgKey)
    
    static let gamesDetailsEndpoint =  "https://api.rawg.io/api/games/"
}
