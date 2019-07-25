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


    func lengthOfLongestSubstring2(_ s: String) -> Int {
        
        if s.count == 0 {
            return 0
        } else if s.count == 1 {
            return 1
        }
        
        var maxLength = 0
        var temp = [Character]()
        let charArray = Array(s)
        temp.append(charArray[0])
        
        for i in 1..<charArray.count{
            
            if let index = temp.firstIndex(of: charArray[i]){
                temp.removeFirst(index+1)
            }
            temp.append(charArray[i])
            maxLength = max(maxLength, temp.count)
            
        }
        return maxLength
    }
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        if s.count == 1 {
            return 1
        }
        var arrayChars = Array(s)
        var maxSize = 0
        var subString = [Character]()
        subString.append(arrayChars[0])
        for start in 1 ..< arrayChars.count {
            if let idx = subString.firstIndex(of: arrayChars[start]) {
                subString.removeFirst(idx+1)
            }
            subString.append(arrayChars[start])
            maxSize = max(subString.count, maxSize)
        }
        
        return maxSize
    }
    
    /*
     1. Generate all substrings
     2. Eliminate all substrings with repeating chars
     3. Return the number of largest chars
     */
    func lengthOfLongestSubstring1(_ s: String) -> Int {
        var setStrings = Set<[Character]>()
        
        func containsRepeatingChars(_ str : [Character]) -> Bool {
            var setChars = Set<Character>()
            for ch in str {
                if setChars.contains(ch) {
                    return true
                }
                setChars.insert(ch)
            }
            return false
        }
        
        var arrayChars = Array(s)
        var maxSize = 0
        for start in 0 ..< arrayChars.count {
            var subString = [Character]()
            for next in start ..< arrayChars.count {
                subString.append(arrayChars[next])
                if !containsRepeatingChars(subString) {
                    maxSize = max(subString.count, maxSize)
                }
            }
        }
        
        return maxSize
    }

    func lengthOfLongestSubstring0(_ s: String) -> Int {
        var setStrings = Set<String>()
        
        // 1. Generate all substrings
        var arrayChars = Array(s)
        for start in 0 ..< arrayChars.count {
            var subString = ""
            for next in start ..< arrayChars.count {
                subString += String(arrayChars[next])
                setStrings.insert(subString)
            }
        }
        // 2. Eliminate all substrings with repeating chars
        var arraySubstrings = [String]()
        var max = 0
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
                if str.count > max {
                    max = str.count
                }
            }
        }
        return max
    }
    
}
