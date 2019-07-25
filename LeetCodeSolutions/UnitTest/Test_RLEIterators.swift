//
//  Test_RLEIterators.swift
//  UnitTest
//
//  Created by Gene Dahilig on 7/21/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import XCTest

class Test_RLEIterators: XCTestCase {

    func test1() {
        var rle : RLE_Iterator
        var result  : Int
        var expected : Int
        
        rle = RLE_Iterator([1,2])
        expected = 2
        result = rle.next(1)
        XCTAssertEqual(result, expected)
        
        expected = -1
        result = rle.next(1)
        XCTAssertEqual(result, expected)
        
        expected = -1
        result = rle.next(1)
        XCTAssertEqual(result, expected)
    }

    func test2() {
        var rle : RLE_Iterator
        var result  : Int
        var expected : Int
        
        rle = RLE_Iterator([1,2,4,9])

        result = rle.next(4)
        expected = 9
        XCTAssertEqual(result, expected)
        
        result = rle.next(4)
        expected = -1
        XCTAssertEqual(result, expected)
    }
    
    func test3() {
        var rle : RLE_Iterator
        var result  : Int
        var expected : Int
        
        rle = RLE_Iterator([3,8,0,9,2,5])
        
        result = rle.next(2)
        expected = 8
        XCTAssertEqual(result, expected)

        result = rle.next(1)
        expected = 8
        XCTAssertEqual(result, expected)

        result = rle.next(1)
        expected = 5
        XCTAssertEqual(result, expected)

        result = rle.next(2)
        expected = -1
        XCTAssertEqual(result, expected)
    }
}
