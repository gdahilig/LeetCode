//
//  UnitTest_TwoSumArrays.swift
//  UnitTest
//
//  Created by Gene Dahilig on 7/19/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import XCTest

class Test_TwoSumArrays: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test1() {

        let twoSum = TwoSum()
        let expected = [1,2]
        XCTAssert(twoSum.twoSum_One_Pass_Hash([3,2,4], 6) == expected)
    }
    
    func test2() {
        let twoSum = TwoSum()
        var expected = [2,3]
        XCTAssert(twoSum.twoSum_Two_Pass_Hash([3,2,4,6], 10) == expected)
    }
    
    func test3() {
        let twoSum = TwoSum()
        var expected = [0,2]
        XCTAssert(twoSum.twoSum_Two_Pass_Hash([3, 2, 42, 8, 4,6], 45) == expected)
    }

}
