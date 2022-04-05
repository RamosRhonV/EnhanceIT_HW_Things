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
    
    // api url to fetch details of a game
    static let gamesDetailsEndpoint =  "https://api.rawg.io/api/games/"
    
    // api url to fetch all games upcoming between years 2020
    // and 20201
    static let gamesUpcomingEndpoint = URL(string: "https://api.rawg.io/api/games?key=8b873156b26749f2bc59f321200181f4&dates=2020-10-10,2021-10-10&ordering=-added?key=8b873156b26749f2bc59f321200181f4")
}
