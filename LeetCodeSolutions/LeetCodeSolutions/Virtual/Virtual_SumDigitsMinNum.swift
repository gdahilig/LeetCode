//
//  Virtual_SumDigitsMinNum.swift
//  LeetCodeSolutions
//
//  Created by Gene Dahilig on 6/15/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import Foundation
// To run tests
// _ = Virtual_SumDigitsMinNum().runTests()

class Virtual_SumDigitsMinNum : Solution {
    func sumOfDigits(_ A: [Int]) -> Int {
        // get min
        var currMin = Int.max
        for i in A {
            currMin = min(currMin,i)
        }
        
        var num = currMin
        var total = 0
        while (num/10) > 0 {
            var digit = num%10
            total += digit
            num /= 10
        }
        let tmp = (total + num)%2
        return tmp == 0 ? 1 : 0
    }
    
    override func test() -> Bool {
        
        var result : Int
        var arryInts : [Int]
        
        arryInts = [10, 11]
        result = sumOfDigits(arryInts)
        printTestCaseResult("\(arryInts)", result == 0)
        
        arryInts = [12, 11]
        result = sumOfDigits(arryInts)
        printTestCaseResult("\(arryInts)", result == 1)

        arryInts = [34,23,1,24,75,33,54,8]
        result = sumOfDigits(arryInts)
        printTestCaseResult("\(arryInts)", result == 0)

        arryInts = [34,23,24,75,33,54,8,1]
        result = sumOfDigits(arryInts)
        printTestCaseResult("\(arryInts)", result == 0)

        return false
    }
    
    
}
