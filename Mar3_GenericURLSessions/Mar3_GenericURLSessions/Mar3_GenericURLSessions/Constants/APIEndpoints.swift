//
//  APIEndpoints.swift
//  Mar3_GenericURLSessions
//
//  Created by Consultant on 3/3/22.
//

import Foundation

struct APIEndpoints {
    static let users = URL(string: "https://jsonplaceholder.typicode.com/users")
    static let post = URL(string: "https://jsonplaceholder.typicode.com/posts")
    static let brew = URL(string: "https://api.openbrewerydb.org/breweries")
}
