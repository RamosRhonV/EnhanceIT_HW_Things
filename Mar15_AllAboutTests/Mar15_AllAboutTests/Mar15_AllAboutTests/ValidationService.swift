//
//  ValidationService.swift
//  Mar15_AllAboutTests
//
//  Created by Consultant on 3/15/22.
//

import Foundation
import UIKit

struct User {
    let username:String
    let password:String
}

struct ValidationService {
    func validateUsername(_ username:String?) throws -> String {
        
        guard let username = username else {
            throw ValidationError.invalidEntry
        }
        guard username.count > 3 else  {
            throw ValidationError.usernameTooShort
        }
        guard username.count < 10 else {
            throw ValidationError.usernameTooLarge
        }
        return username
    }
    
    func validatePassword(_ password:String?) throws -> String {
        guard let password = password else {
            throw ValidationError.invalidEntry
        }
        guard password.count > 5 else {
            throw ValidationError.passwordTooShort
        }
        guard password.count <= 50 else {
            throw ValidationError.passwordTooLarge
        }
        
        return password
    }
    
    func validateFibonacci(_ fibonacci:Int?) throws -> Int {
        guard let fibonacci = fibonacci else {
            throw ValidationError.invalidEntry
        }
        guard fibonacci > 0 else {
            throw ValidationError.fibTooShort
        }
        guard fibonacci <= 20 else {
            throw ValidationError.fibTooLong
        }
        return fibonacci
    }
}

enum ValidationError: LocalizedError {
    
    // field is an invalid entry a la nil
    case invalidEntry
    
    // username is too short or too long
    case usernameTooShort
    case usernameTooLarge
    
    // password is too short or too long
    case passwordTooShort
    case passwordTooLarge
    
    // fibonacci num is too short or too long
    case fibTooShort
    case fibTooLong
}
