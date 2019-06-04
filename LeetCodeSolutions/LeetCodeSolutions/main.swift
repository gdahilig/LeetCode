//
//  main.swift
//  LeetCodeSolutions
//
//  Created by Gene Dahilig on 6/4/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import Foundation

// https://leetcode.com/problems/two-sum/

class Solution {
    func twoSum_brute_force(_ nums: [Int], _ target: Int) -> [Int] {
        for x in 0..<nums.count {
            for y in x+1..<nums.count {
                if nums[x]+nums[y] == target {
                    return [x,y]
                }
            }
        }
        return []
    }
    
    func twoSum_Two_Pass_Hash(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = Dictionary<Int,Int>()
        for x in 0..<nums.count {
            dict[nums[x]] = x
        }
        for x in 0..<nums.count {
            let compliment = target-nums[x]
            if (dict[compliment] != nil) && dict[compliment] != x {
                return [x, dict[compliment]!]
            }
        }
        return []
    }

    func twoSum_One_Pass_Hash(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = Dictionary<Int,Int>()
        for x in 0..<nums.count {
            let compliment = target-nums[x]
            if dict[compliment] != nil {
                return [dict[compliment]!, x]
            }
            dict[nums[x]] = x
        }
        return []
    }
}

var pass : Bool

func printResult(_ pass : Bool) {
    if (pass) {
        print("Test PASSED!")
    } else {
        print("Test FAILED!")
    }
}
var expected = [1,2]
pass = Solution().twoSum_One_Pass_Hash([3,2,4], 6) == expected
printResult(pass)

expected = [2,3]
pass = Solution().twoSum_Two_Pass_Hash([3,2,4,6], 10) == expected
printResult(pass)


expected = [0,2]
pass = Solution().twoSum_Two_Pass_Hash([3, 2, 42, 8, 4,6], 45) == expected
printResult(pass)

