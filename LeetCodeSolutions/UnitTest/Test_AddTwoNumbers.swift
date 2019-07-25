//
//  Test_AddTwoNumbers.swift
//  UnitTest
//
//  Created by Gene Dahilig on 7/21/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import XCTest

class Test_AddTwoNumbers: XCTestCase {
    var result : AddTwoNumbers.ListNode?
    var expected : AddTwoNumbers.ListNode?
    var l1 : AddTwoNumbers.ListNode?
    var l2 : AddTwoNumbers.ListNode?
    let algorithm = AddTwoNumbers()
    
    override func setUp() {

    }

    override func tearDown() {
    }

    func test1() {
        l1 = nil
        l2 = nil
        result = algorithm.addTwoNumbers(l1, l2)
        XCTAssert(result == nil)
    }

    func test2() {
        l1 = AddTwoNumbers.ListNode(10)
        l2 = nil
        result = algorithm.addTwoNumbers(l1, l2)
        XCTAssert(result != nil && result!.val == 10)
    }

    func test3() {
        l1 = nil
        l2 = AddTwoNumbers.ListNode(20)
        result = algorithm.addTwoNumbers(l1, l2)
        XCTAssert(result != nil && result!.val == 20)
    }

    func test4() {
        l1 = AddTwoNumbers.ListNode(1)
        l2 = AddTwoNumbers.ListNode(1)
        result = algorithm.addTwoNumbers(l1, l2)
        XCTAssert(result != nil && result!.val == 2)
    }

    func test5() {
        l1 = algorithm.buildList([1,1])
        l2 = algorithm.buildList([1,1])
        
        result = algorithm.addTwoNumbers(l1, l2)
    }

}
