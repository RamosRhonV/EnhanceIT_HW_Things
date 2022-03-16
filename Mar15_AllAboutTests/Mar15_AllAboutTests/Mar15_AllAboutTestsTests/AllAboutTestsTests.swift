//
//  AllAboutTestsTests.swift
//  Mar15_AllAboutTestsTests
//
//  Created by Consultant on 3/15/22.
//

import XCTest

@testable import Mar15_AllAboutTests
class AllAboutTestsTests: XCTestCase {
    var validation: ValidationService!
    
    override func setUp() {
        super.setUp()
        validation = ValidationService()
    }
    
    override func tearDown() {
        super.tearDown()
        validation = nil
    }
    
    func test_username_is_nil() throws {
        let expectedError = ValidationError.invalidEntry
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateUsername(nil)) {
            thrownError in error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
    }
    
    func is_valid_username() throws {
        XCTAssertNoThrow(try validation.validateUsername("Admin"))
    }
    
    func is_short_username() throws {
        let expectedError = ValidationError.usernameTooShort
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateUsername("xf")) {
            thrownError in error  = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
    }
    
    func is_large_username() throws {
        let expectedError = ValidationError.usernameTooLarge
        var error: ValidationError?
        let username = "superduperduperduperduperduperlongusernamelmaoyousuckgogetalifeidiotfailure"
        
        XCTAssertThrowsError(try validation.validateUsername(username)) {
            thrownError in error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
    }
}
