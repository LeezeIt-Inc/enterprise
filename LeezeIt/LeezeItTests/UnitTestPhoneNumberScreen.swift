//
//  UnitTestPhoneNumberScreen.swift
//  LeezeItTests
//
//  Created by Riffat Khan on 9/11/22.
//

import XCTest
@testable import LeezeIt

class UnitTestPhoneNumberScreen: XCTestCase {
    
    var viewController =  PhoneNumberViewController()
    var phoneNumber = "16308273932"
    lazy var rejex = self.viewController.format(with: "+X (XXX) XXX-XXXX", phone: phoneNumber)
    
    func testNumberOfDigitsInTextField() {

        XCTAssert(phoneNumber.count == 11 && phoneNumber.count < 12 && phoneNumber.count != 12)
    }
    
    func testRestrictUserToEntrAlphabetInPhoneNumberTextField() {
       
        XCTAssert(rejex != "A")
        XCTAssert(rejex != "")
    }
    
    func testFormatOfPhoneNumber() {
       
        XCTAssert(rejex == "+1 (630) 827-3932" && rejex != "1 (630) 827-3932")
    }
}
