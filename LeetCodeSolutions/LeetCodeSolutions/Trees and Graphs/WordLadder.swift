//
//  WordLadder.swift
//  LeetCodeSolutions
//
//  Created by Gene Dahilig on 6/10/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import Foundation

// To run tests
// _ = SolutionName().runTests()

class WordLadder : Solution {
    func getOneCharOff(_ word1 : String, _ word2 : String) -> Bool {
        
        // count similar letters.
        var count : Int = 0
        for idx in 0...word1.count-1 {
            let index1 = word1.index(word1.startIndex, offsetBy: idx)
            let charword1 = word1[index1] // returns Character 'u'
            let index2 = word2.index(word2.startIndex, offsetBy: idx)
            let charword2 = word2[index2] // returns Character 'u'                count += 1
            if charword1 == charword2 {
                count += 1
            }
        }
        return count == word1.count-1
    }
    
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
//        var nextWords = [String]()
//        for word in wordList {
//            if word == endWord {
//                return 1
//            }
//            if getOneCharOff(beginWord, word) == 1 {
//                nextWords.append(word)
//            }
//        }
//
//        ladderLength(
        return 0
    }
    
    
    
    override func test() -> Bool {
        test_getOneCharOff() 
        return false
    }
    
    func test_Solution() -> Bool {
        var beginWord : String
        var endWord : String
        var wordList : [String]
        var result : Int
        var expected : Int
        
        beginWord = "hit"
        endWord = "cog"
        wordList = ["hot","dot","dog","lot","log"]
        expected = 5
        result = ladderLength(beginWord, endWord, wordList)
        printTestCaseResult("Test_01", result == expected)
        return false
    }
    
    func test_getOneCharOff() {
        
        var expected : Bool
        var result : Bool

        expected = true
        result = getOneCharOff("cog", "bog")
        printTestCaseResult("getOneCharOff_01", result == expected)
        
        expected = false
        result = getOneCharOff("cog", "bag")
        printTestCaseResult("getOneCharOff_02", result == expected)

        expected = false
        result = getOneCharOff("cog", "bat")
        printTestCaseResult("getOneCharOff_03", result == expected)

        expected = false
        result = getOneCharOff("cog", "cog")
        printTestCaseResult("getOneCharOff_04", result == expected)
    }
}
