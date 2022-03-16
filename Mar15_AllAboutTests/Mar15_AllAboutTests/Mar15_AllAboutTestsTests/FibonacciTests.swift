//
//  FibonacciTests.swift
//  Mar15_AllAboutTestsTests
//
//  Created by Consultant on 3/15/22.
//

import XCTest

@testable import Mar15_AllAboutTests
class FibonacciTests: XCTestCase {
    
    var validation: ValidationService!
    
    override func setUp() {
        super.setUp()
        validation = ValidationService()
    }
    
    func test_fibonacci() {
        let expectedReturn = [0, 1, 1, 2, 3]
        var fibonacci = [0, 1]
        
        for i in 2...4 {
            fibonacci.append(i)
            fibonacci[i] = fibonacci[i - 1] + fibonacci[i - 2]
        }
        
        XCTAssertEqual(expectedReturn, fibonacci)
    }
    
    func fib_too_short() throws {
        let expectedError = ValidationError.fibTooShort
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateFibonacci(0)) {
            thrownError in error  = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
    }
    
    func fib_too_long() throws {
        let expectedError = ValidationError.fibTooLong
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateFibonacci(99999)) {
            thrownError in error  = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
    }
}
