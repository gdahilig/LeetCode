//
//  RLEIterator.swift
//  LeetCodeSolutions
//
//  Created by Gene Dahilig on 7/7/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//
//  https://leetcode.com/problems/rle-iterator/

import Foundation

// To run tests
// _ = RLEIterator().runTests()

class RLE_Iterator : Solution {
    class RLEIterator {
        var rle = [Int]()
        init(_ A: [Int]) {
            self.rle = A
        }
        
        func next(_ n: Int) -> Int {
            var count = n

            while true {
                if rle.count == 0 {
                    return -1
                }
                if count == 0 {
                    return rle[1]
                }
                // current: 0,x ==> pop
                if rle[0] == 0  {
                    if rle.count <= 2 {
                        rle.removeFirst(2)
                        return -1
                    } else {
                        rle.removeFirst(2)
                        continue
                    }
                }
                // rle[0]-count > 0 ==> rle[0] = rle[0]-count
                if rle[0] >= count {
                    rle[0] = rle[0] - count
                    
                    return rle[1]
                }
                // count > rle[0]-count < 0  ==>
                if (rle[0] < count) {
                    count = count - rle[0]
                    rle.removeFirst(2)
                }
            }
        }
    }
        /**
         * Your RLEIterator object will be instantiated and called as such:
         * let obj = RLEIterator(A)
         * let ret_1: Int = obj.next(n)
         */
        
    override func test() -> Bool {
        var obj : RLEIterator
        var result  = 0
        var expected = 1

        obj = RLEIterator([1,2])
        expected = 2
        result = obj.next(1)
        printTestCaseResult("Test_01", result == expected)

        expected = -1
        result = obj.next(1)
        printTestCaseResult("Test_02", result == expected)
        
        expected = -1
        result = obj.next(1)
        printTestCaseResult("Test_03", result == expected)

        obj = RLEIterator([1,2])
        expected = -1
        result = obj.next(4)
        printTestCaseResult("Test_04", result == expected)

        //------------------------------------------------
        obj = RLEIterator([1,2,4,9])
        expected = 9
        result = obj.next(4)
        printTestCaseResult("Test_05A", result == expected)
        expected = -1
        result = obj.next(4)
        printTestCaseResult("Test_05B", result == expected)

        //------------------------------------------------
        obj = RLEIterator([3,8,0,9,2,5])
        expected = 8
        result = obj.next(2)
        printTestCaseResult("Test_06A", result == expected)

        expected = 8
        result = obj.next(1)
        printTestCaseResult("Test_06B", result == expected)

        expected = 5
        result = obj.next(1)
        printTestCaseResult("Test_06C", result == expected)

        expected = -1
        result = obj.next(2)
        printTestCaseResult("Test_06D", result == expected)
        
        return result == expected
    }
}
