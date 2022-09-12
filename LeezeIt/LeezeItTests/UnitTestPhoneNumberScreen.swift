//
//  UnitTestPhoneNumberScreen.swift
//  LeezeItTests
//
//  Created by Riffat Khan on 9/11/22.
//

import XCTest
@testable import LeezeIt

class UnitTestPhoneNumberScreen: XCTestCase {
    
    var sut =  PhoneNumberViewController()
    
    func test_Number_Of_Digits_in_Fields() {
        let phoneNumber = "16308273932"
        let rejex = sut.format(with: "+X (XXX) XXX-XXXX", phone: phoneNumber)
        
        XCTAssert(rejex == "+1 (630) 827-3932" && rejex != "1 (630) 827-3932")
        XCTAssert(rejex != "A")
        XCTAssert(rejex != "")
        XCTAssert(phoneNumber.count == 11 && phoneNumber.count < 12 && phoneNumber.count != 12)
    }
}
