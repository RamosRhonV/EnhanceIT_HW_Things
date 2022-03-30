//
//  APIEndpoints.swift
//  NEXGAM
//
//  Created by Consultant on 3/30/22.
//

import Foundation

// api requires API key to fetch urls
let rawgKey = "key=8b873156b26749f2bc59f321200181f4"

struct APIEndpoints {
    
    // api url to fetch a list of all games
    static let gamesEndpoint = URL(string: "https://api.rawg.io/api/games?" + rawgKey)
}
