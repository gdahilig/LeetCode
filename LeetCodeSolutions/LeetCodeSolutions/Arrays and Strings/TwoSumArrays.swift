//
//  TwoSumArrays.swift
//  LeetCodeSolutions
//
//  Created by Gene Dahilig on 6/4/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import Foundation

// https://leetcode.com/problems/two-sum/

class TwoSum : Solution {
    
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
