//
//  Test_MergeTwoSortedLists.swift
//  UnitTest
//
//  Created by Gene Dahilig on 7/19/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import XCTest

class Test_MergeTwoSortedLists: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test1() {
        var l1,l2 : ListNode?
        var merged : ListNode?
        let algorithm = MergeTwoSortedLists()
        
        l1 = algorithm.array2List([])
        l2 = algorithm.array2List([])
        merged = algorithm.mergeTwoLists(l1, l2)
        XCTAssert(merged == nil)
    }
    func test2() {
        var l1,l2 : ListNode?
        var merged : ListNode?
        let algorithm = MergeTwoSortedLists()
            
        l1 = algorithm.array2List([1])
        l2 = algorithm.array2List([])
        merged = algorithm.mergeTwoLists(l1, l2)
        XCTAssert(algorithm.compareNodeArray(merged, arry: [1]))
    }
    func test3() {
        var l1,l2 : ListNode?
        var merged : ListNode?
        var algorithm = MergeTwoSortedLists()
        
        l1 = algorithm.array2List([])
        l2 = algorithm.array2List([1])
        merged = algorithm.mergeTwoLists(l1, l2)
        XCTAssert(algorithm.compareNodeArray(merged, arry: [1]))
    }
    
    func test4() {
        var l1,l2 : ListNode?
        var merged : ListNode?
        let algorithm = MergeTwoSortedLists()
        
        l1 = algorithm.array2List([1])
        l2 = algorithm.array2List([2])
        merged = algorithm.mergeTwoLists(l1, l2)
        XCTAssert(algorithm.compareNodeArray(merged, arry: [1,2]))
    }
    
    func test5() {
        var l1,l2 : ListNode?
        var merged : ListNode?
        let algorithm = MergeTwoSortedLists()
        
        l1 = algorithm.array2List([1,3])
        l2 = algorithm.array2List([2])
        merged = algorithm.mergeTwoLists(l1, l2)
        XCTAssert(algorithm.compareNodeArray(merged, arry: [1,2,3]))
    }
    
    func test6() {
        var l1,l2 : ListNode?
        var merged : ListNode?
        let algorithm = MergeTwoSortedLists()
        

        l1 = algorithm.array2List([2])
        l2 = algorithm.array2List([1,3])
        merged = algorithm.mergeTwoLists(l1, l2)
        XCTAssert(algorithm.compareNodeArray(merged, arry: [1,2,3]))
    }
    
    func test7() {
        var l1,l2 : ListNode?
        var merged : ListNode?
        let algorithm = MergeTwoSortedLists()

        l1 = algorithm.array2List([1,3,5,7])
        l2 = algorithm.array2List([2,4,6])
        merged = algorithm.mergeTwoLists(l1, l2)
        XCTAssert(algorithm.compareNodeArray(merged, arry: [1,2,3,4,5,6,7]))
    }
    
    func test8() {
        var l1,l2 : ListNode?
        var merged : ListNode?
        let algorithm = MergeTwoSortedLists()
        
        l1 = algorithm.array2List([2,4,6])
        l2 = algorithm.array2List([1,3,5,7])
        merged = algorithm.mergeTwoLists(l1, l2)
        XCTAssert(algorithm.compareNodeArray(merged, arry: [1,2,3,4,5,6,7]))
    }
}
