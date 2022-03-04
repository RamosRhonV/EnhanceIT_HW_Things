//
//  Extension+URLSessionError.swift
//  Mar3_MoviesTable
//
//  Created by Consultant on 3/3/22.
//

import Foundation

extension URLSession {
    enum RequestErrors:Error {
        case badURL
        case badData
    }
}
