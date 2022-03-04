//
//  Extension+URLSessioNError.swift
//  Mar3_GenericURLSessions
//
//  Created by Consultant on 3/3/22.
//

import Foundation

// creates custom errors to work with our completion
// that passes into the networking function
extension URLSession {
    enum RequestErrors:Error {
        case badURL
        case badData
    }
}
