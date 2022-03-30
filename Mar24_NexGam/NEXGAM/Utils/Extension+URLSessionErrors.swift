//
//  Extension+URLSessionErrors.swift
//  NEXGAM
//
//  Created by Consultant on 3/30/22.
//

import Foundation

extension URLSession {
    enum RequestErrors: Error {
        case badURL
        case badData
    }
}
