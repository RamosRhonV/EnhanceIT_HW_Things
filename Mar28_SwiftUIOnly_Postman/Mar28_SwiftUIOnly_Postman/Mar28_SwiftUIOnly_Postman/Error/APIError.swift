//
//  APIError.swift
//  Mar28_SwiftUIOnly_Postman
//
//  Created by Consultant on 3/28/22.
//

import Foundation
import SwiftUI

enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decodingError:
            return ErrorConstants.decodingError
        case .errorCode(let code):
            return "\(code) \(ErrorConstants.errorCode)"
        case . unknown:
            return ErrorConstants.unknown
        }
    }
}
