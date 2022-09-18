//
//  CreateAccountViewControllerTests.swift
//  LeezeItTests
//
//  Created by harris ali on 9/13/22.
//

import XCTest
@testable import LeezeIt

 class SignUpViewControllerTests: XCTestCase {
     
 var viewController = SignUpViewController()
     
     func testEmailProperFormat() {
         XCTAssert(viewController.checkEmailFormat(email: "Ali123@gmail.com"))
     }
     
     func testEmailImproperFormat() {
         XCTAssertFalse(viewController.checkEmailFormat(email: ""))
         XCTAssertFalse(viewController.checkEmailFormat(email: "ali123.com"))
         XCTAssertFalse(viewController.checkEmailFormat(email: "ali"))
     }
     
     func testTextFieldAcceptsAlphabetsOnly() {
         XCTAssert(viewController.checkTextField(string: "abc"))
         XCTAssertTrue(viewController.checkTextField(string: "ABC"))
     }
     
     func testTextFieldDoesntAcceptsDigits() {
         XCTAssertFalse(viewController.checkTextField(string: "123"))
     }
     
     func testTextFieldDoesntAcceptSymbols() {
         XCTAssertFalse(viewController.checkTextField(string: "#"))
     }
}
