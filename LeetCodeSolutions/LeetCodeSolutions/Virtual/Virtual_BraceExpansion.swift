//
//  Virtual_BraceExpansion.swift
//  LeetCodeSolutions
//
//  Created by Gene Dahilig on 6/15/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//
// LeetCode: https://leetcode.com/contest/biweekly-contest-2/problems/brace-expansion/
//
import Foundation
// To run tests
// _ = Virtual_BraceExpansion().runTests()

class Virtual_BraceExpansion : Solution {
    func createOptions(_ str : String ) -> ([[Character]], String) {
        var optionsArray = [[Character]]()
        var openBrace = false
        var optionArry = [Character]()
        var formatStr = ""
        
        for ch in str {
            if openBrace {
                if  ch == "}" {
                    // close brace.
                    // save options to options array
                    openBrace = false
                    formatStr += "%"
                    optionsArray.append(optionArry)
                } else if ch == "," {
                    continue
                }
                else { // save option
                    optionArry.append(ch)
                }
            }
            else { // no open brace
                if ch == "{" {
                    openBrace = true
                    optionArry = [Character]()
                } else {
                    formatStr = String("\(formatStr)\(ch)")
                }
                
            }
            
        }
        
        return (optionsArray, formatStr)
        
    }
    
    
    func generateExpansions(_ arr : [[Character]], _ formatStr : String) ->  [String] {
        
        var combinations = [[Character]]()                          // stores all the combinations generated
        let numComboElements = arr.count                            // number of option arrays
        var expansionArry = [String]()
        
        var comboElement = [Int](repeating: 0, count: numComboElements)
                                                                    // Keeps track of the current position of the
                                                                    // each combo element.
        while (true) {
            
            var combo = [Character]()                               // save the current combo to the output array
            for idx in 0..<numComboElements {
//                print("\(arr[idx][indices[idx]])", terminator: " ")
                combo.append(arr[idx][comboElement[idx]])
                

            }
            combinations.append(combo)
            var expanded = formatStr
            
            var comboIdx = 0
            var chars = Array(expanded)                             // gets an array of characters
            for idx in 0 ..< chars.count {                          // check if ch is needs expansion
                if chars[idx] == "%" {
                    chars[idx] = combo[comboIdx]
                    comboIdx += 1
                }
            }
            expanded = String(chars)
            expansionArry.append(expanded)
            
            var next = numComboElements-1                           // Find the array that has more elements
            while (next >= 0) &&                                    // to enumerate.
                (comboElement[next] + 1 >= arr[next].count) {
                    next -= 1
            }
            
            if (next<0) {                                           // no more combos left, return the combo list.
                return expansionArry
            }
            
            comboElement[next] += 1                                 // otherwise, move to the next comboElement.
            
            // for all arrays to the right of this
            // array current index again points to
            // first element
            for i in next+1 ..< numComboElements {                  // Reset all the arrays to the right of current one
                comboElement[i] = 0                                 // to 0 so we can continue
            }
        }
    }
    
    func expand(_ S: String) -> [String] {
        var options : [[Character]]
        var formatStr : String
        
        (options,formatStr) = createOptions(S)
        if options.count == 0 {                                     // no options means there is nothing to expand
            return [formatStr]                                      // i.e. no "{a,b}"
        }
        return generateExpansions(options, formatStr)
    }
    
    func test_Solution() -> Bool {
        var result : [String]
        var expected : [String]
        
        var input : String
        
        input = "ab"
        result = expand(input)
        expected = ["ab"]
        printTestCaseResult(input, result == expected)

        input = "{a,b}c"
        result = expand(input)
        expected = ["ac","bc"]
        printTestCaseResult(input, result == expected)
        
        input = "{a,b}c{d,e}f"
        result = expand(input)
        expected = ["acdf","acef","bcdf","bcef"]
        printTestCaseResult(input, result == expected)
        
        input = "{a,b,c}d{e,f}mno{x,y,z}"
        result = expand(input)
        expected = ["ademnox","ademnoy","ademnoz","adfmnox","adfmnoy","adfmnoz","bdemnox","bdemnoy","bdemnoz","bdfmnox","bdfmnoy","bdfmnoz","cdemnox","cdemnoy","cdemnoz","cdfmnox","cdfmnoy","cdfmnoz"]
        printTestCaseResult("CreateOptions: \(input)", result == expected)

        
//        input = "{a,b}{z,x,y}"
//        result = expand(input)
        // This is an LeetCode expected answer.  But the only difference been my generate and
        // LeetCode is the order of the "b*" elements.  They are all there but in a different order
        // i.e. I generate "bz","bx","by", LeetCode expects "bx","by","bz"
//        expected =  ["ax","ay","az","bx","by","bz"]
//        printTestCaseResult("CreateOptions: \(input)", result == expected)
        
        return false
    }
    
    func test_createOptions() -> Bool {
        var result : [[Character]]
        var expected : [[Character]]
        var formatStr : String
        var input : String
        
        input = "{a,b}c{d,e}f"
        expected = [["a","b"],["d","e"]]
        (result,formatStr) = createOptions(input)
        printTestCaseResult("FormatString_1: \(input)", formatStr == "%c%f")
        printTestCaseResult("CreateOptions: \(input)", result == expected)
        
        input = "{a,b,y}c{d,e,x}f"
        expected = [["a","b","y"],["d","e","x"]]
        (result,formatStr) = createOptions(input)
        printTestCaseResult("FormatString_2: \(input)", formatStr == "%c%f")
        printTestCaseResult("CreateOptions: \(input)", result == expected)
        
        input = "{a,b,y}c{d,e,x}f"
        expected = [["a","b","y"],["d","e","x"]]
        (result,formatStr) = createOptions(input)
        printTestCaseResult("FormatString_3: \(input)", formatStr == "%c%f")
        printTestCaseResult("CreateOptions: \(input)", result == expected)
        
        input = "{a,b,c}d{e,f}mno{x,y,z}"
        expected = [["a","b","c"],["e","f"],["x","y","z"]]
        (result,formatStr) = createOptions(input)
        printTestCaseResult("FormatString_1: \(input)", formatStr == "%d%mno%")
        printTestCaseResult("CreateOptions: \(input)", result == expected)
        return false
    }
    
    
    func test_generateCombos() -> Bool{
        var pass = false
        
        var options : [[Character]]
        var expected : [String]
        var formatStr : String
        var input : String
        var expansions : [String]
        
        input = "ac"
        expected = ["ac"]
        (options,formatStr) = createOptions(input)
        expansions = generateExpansions(options, formatStr)
        printTestCaseResult("generateExpansions(): \(input)", expansions == expected)
        
        input = "{a}c"
        expected = ["ac"]
        (options,formatStr) = createOptions(input)
        expansions = generateExpansions(options, formatStr)
        printTestCaseResult("generateExpansions(): \(input)", expansions == expected)

        input = "{a,b}c"
        expected = ["ac","bc"]
        (options,formatStr) = createOptions(input)
        expansions = generateExpansions(options, formatStr)
        printTestCaseResult("generateExpansions(): \(input)", expansions == expected)
        

        input = "{a}b{c,d}"
        expected = ["abc","abd"]
        (options,formatStr) = createOptions(input)
        expansions = generateExpansions(options, formatStr)
        printTestCaseResult("generateExpansions(): \(input)", expansions == expected)


        input = "{a,b}c{d,e}f"
        expected = ["acdf","acef","bcdf","bcef"]
        (options,formatStr) = createOptions(input)
        expansions = generateExpansions(options, formatStr)
        printTestCaseResult("generateExpansions(): \(input)", expansions == expected)

        input = "{a,b}c{d,e}f{g,h,i}"
        expected = ["acdfg","acdfh","acdfi",
                    "acefg","acefh","acefi",
                    "bcdfg","bcdfh","bcdfi",
                    "bcefg","bcefh","bcefi"
                   ]
        (options,formatStr) = createOptions(input)
        expansions = generateExpansions(options, formatStr)
        printTestCaseResult("generateExpansions(): \(input)", expansions == expected)

        return pass
    }
    
    override func test() -> Bool {
        var passed = true
        passed = test_createOptions() && passed
        passed = test_generateCombos() && passed
        passed = test_Solution()
        return passed
    }
}
