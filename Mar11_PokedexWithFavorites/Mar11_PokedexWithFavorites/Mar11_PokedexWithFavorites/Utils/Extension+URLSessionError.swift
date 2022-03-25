//
//  Extension+URLSessionError.swift
//  Mar4_PokeDex
//
//  Created by Consultant on 3/4/22.
//

import Foundation

extension URLSession {
    enum RequestErrors:Error {
        case badURL
        case badData
    }
}
