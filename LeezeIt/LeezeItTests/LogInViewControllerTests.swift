//
//  PhoneNumberViewControllerTests.swift
//  LeezeItTests
//
//  Created by Riffat Khan on 9/11/22.
//

import XCTest
@testable import LeezeIt

class LogInViewControllerTests: XCTestCase {
    
    var viewController =  LogInViewController()
    var phoneNumber = "16308273932"
    lazy var rejex = self.viewController.format(with: "+X (XXX) XXX-XXXX", phone: phoneNumber)
    
    func testNumberOfDigitsInTextField() {

        XCTAssertEqual(phoneNumber.count, 11)
        XCTAssertNotEqual(phoneNumber.count, 12)
    }
    
    func testRestrictUserToEntrAlphabetInPhoneNumberTextField() {
       
        XCTAssert(rejex != "A")
        XCTAssert(rejex != "")
    }
    
    func testFormatOfPhoneNumber() {
       
        XCTAssertEqual(rejex, "+1 (630) 827-3932")
        XCTAssertNotEqual(rejex, "1(630)827-3932")
    }
}
