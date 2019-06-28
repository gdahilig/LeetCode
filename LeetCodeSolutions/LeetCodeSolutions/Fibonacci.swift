//
//  Fibonacci.swift
//  LeetCodeSolutions
//
//  Created by Gene Dahilig on 6/16/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import Foundation

// To run tests
// _ = SolutionName().runTests()

class Fibonacci : Solution {
    override func test() -> Bool {
        var result  = 0
        var expected = 0
        printTestCaseResult("Test_00", result == expected)
        return result == expected
    }
}
