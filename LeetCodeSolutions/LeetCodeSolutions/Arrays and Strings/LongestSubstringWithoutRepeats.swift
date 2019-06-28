//
//  LongestSubstringWithoutRepeats.swift
//  LeetCodeSolutions
//
//  Created by Gene Dahilig on 6/27/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//
//  https://leetcode.com/explore/interview/card/amazon/76/array-and-strings/2961/

import Foundation
// To run tests
// _ = LongestSubstringWithoutRepeats().runTests()

class LongestSubstringWithoutRepeats : Solution {
/*
     1. Generate all substrings
     2. Eliminate all substrings with repeating chars
     3. Return the number of largest chars
 */
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var setStrings = Set<String>()
        
        // 1. Generate all substrings
        var arrayChars = Array(s)
        print (arrayChars)
        for start in 0 ..< arrayChars.count {
            var subString = ""
            for next in start ..< arrayChars.count {
                subString += String(arrayChars[next])
                print(subString)
                setStrings.insert(subString)
            }
        }
        print(setStrings)
        // 2. Eliminate all substrings with repeating chars
        var arraySubstrings = [String]()
        for str in setStrings {
            var setChars = Set<Character>()
            var dupe = false
            for ch in str {
                if setChars.contains(ch) {
                    dupe = true
                    break
                }
                setChars.insert(ch)
            }
            if !dupe {
                arraySubstrings.append(str)
            }
        }
        print("Strings w/o duplicate chars:")
        print(arraySubstrings)
        
        var count = 0
        for str in arraySubstrings {
            if str.count > count {
                count = str.count
            }
        }
        
        return count
    }
    
    override func test() -> Bool {
        var result  = 0
        var expected = 0
        var input : String

        input = "aa"
        result = lengthOfLongestSubstring(input)
        expected = 1
        printTestCaseResult("\(input)", result == expected)
        
        input = "abcd"
        result = lengthOfLongestSubstring(input)
        expected = 4
        printTestCaseResult("\(input)", result == expected)

        
        input = "abcabcbb"
        result = lengthOfLongestSubstring(input)
        expected = 3
        printTestCaseResult("\(input)", result == expected)

        input = "bbbbb"
        result = lengthOfLongestSubstring(input)
        expected = 1
        printTestCaseResult("\(input)", result == expected)

        input = "pwwkew"
        result = lengthOfLongestSubstring(input)
        expected = 3
        printTestCaseResult("\(input)", result == expected)

        return result == expected
    }
}
