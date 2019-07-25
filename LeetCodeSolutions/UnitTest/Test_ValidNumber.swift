//
//  Test_ValidNumber.swift
//  UnitTest
//
//  Created by Gene Dahilig on 7/19/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import XCTest

class Test_ValidNumber: XCTestCase {
    
    func test() {
        let algorithm = ValidNumber()
        
        XCTAssertTrue (algorithm.isNumber_v2("1"))
        XCTAssertFalse(algorithm.isNumber_v2(" +"))
        XCTAssertFalse(algorithm.isNumber_v2(" -"))
        XCTAssertTrue (algorithm.isNumber_v2("3."))
        XCTAssertTrue (algorithm.isNumber_v2("3. "))
        XCTAssertTrue (algorithm.isNumber_v2("+.8"))
        XCTAssertTrue (algorithm.isNumber_v2("46.e3"))
        XCTAssertFalse(algorithm.isNumber_v2("92e1740e91"))
        XCTAssertTrue (algorithm.isNumber_v2(" 005047e+6"))
        XCTAssertFalse(algorithm.isNumber_v2("."  ))
        XCTAssertFalse(algorithm.isNumber_v2(" ." ))
        XCTAssertTrue (algorithm.isNumber_v2(" .5"))
        XCTAssertFalse(algorithm.isNumber_v2(". " ))
        XCTAssertFalse(algorithm.isNumber_v2(" . "))
        XCTAssertFalse(algorithm.isNumber_v2(".." ))
        XCTAssertFalse(algorithm.isNumber_v2(".1."))
        XCTAssertTrue (algorithm.isNumber_v2(" .9"))
        XCTAssertTrue (algorithm.isNumber_v2("0"))
        XCTAssertTrue (algorithm.isNumber_v2(" 0.1 "))
        XCTAssertTrue (algorithm.isNumber_v2(".1"))
        XCTAssertFalse(algorithm.isNumber_v2("abc"))
        XCTAssertFalse(algorithm.isNumber_v2("1 a"))
        XCTAssertTrue (algorithm.isNumber_v2("2e10"))
        XCTAssertTrue (algorithm.isNumber_v2(" -90e3   "))
        XCTAssertFalse(algorithm.isNumber_v2(" 1e"))
        XCTAssertFalse(algorithm.isNumber_v2("e3"))
        XCTAssertTrue (algorithm.isNumber_v2(" 6e-1"))
        XCTAssertFalse(algorithm.isNumber_v2(" 99e2.5 "))
        XCTAssertTrue (algorithm.isNumber_v2("53.5e93"))
        XCTAssertFalse(algorithm.isNumber_v2(" --6 "))
        XCTAssertFalse(algorithm.isNumber_v2("-+3"))
        XCTAssertFalse(algorithm.isNumber_v2("95a54e53"))
    }
}
