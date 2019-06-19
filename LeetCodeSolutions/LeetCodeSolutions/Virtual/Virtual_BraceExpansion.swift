//
//  Virtual_BraceExpansion.swift
//  LeetCodeSolutions
//
//  Created by Gene Dahilig on 6/15/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import Foundation
// To run tests
// _ = Virtual_BraceExpansion().runTests()

class Virtual_BraceExpansion : Solution {
    func createOptions(_ str : String ) -> [ [Character] ] {
        var optionsArray = [[Character]]()
        var optIndex = 0
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
        
        return optionsArray
        
    }
    
    func createCombos(_ options: [[Character]]) -> [[Character]] {

        // options are an array of character arrays that where each element is an array of characters used for an expansion.
        var combos = [[Character]]()
        
        // take the last combo and build the initial combos array
        var lastOption = options.last
        for idx in 0...lastOption!.count-1 {
            var combo = [Character]()
            combo.append(options[options.count-1][idx])
            combos.append(combo)
        }
        
        // create next combos
        for idx in options.count-2...0 {
            // duplicate
            for option in options[idx] {
                for combo in combos {
                    let new = combo
                    combos.append(new)
                }
            }
            // process current combos
            
            
        }
        return combos
    }
    
    func expand(_ S: String) -> [String] {
        

        createOptions(S)
        return []
    }
    
    func test_Solution() -> Bool {
        var result : [String]
        var expected : [String]
        
        var input : String
        
        input = "{a,b}c{d,e}f"
        result = expand(input)
        expected = ["acdf","acef","bcdf","bcef"]
        printTestCaseResult("{a,b}c{d,e}f", result == expected)
        return false
    }
    
    func test_createOptions() -> Bool {
        var result : [[Character]]
        var expected : [[Character]]
        
        var input : String
        
        input = "{a,b}c{d,e}f"
        expected = [["a","b"],["d","e"]]
        result = createOptions(input)
        printTestCaseResult("CreateOptions: \(input)", result == expected)
        
        input = "{a,b,y}c{d,e,x}f"
        expected = [["a","b","y"],["d","e","x"]]
        result = createOptions(input)
        printTestCaseResult("CreateOptions: \(input)", result == expected)
        
        input = "{a,b,y}c{d,e,x}f"
        expected = [["a","b","y"],["d","e","x"]]
        result = createOptions(input)
        printTestCaseResult("CreateOptions: \(input)", result == expected)
        
        input = "{a,b,c}d{e,f}mno{x,y,z}"
        expected = [["a","b","c"],["e","f"],["x","y","z"]]
        result = createOptions(input)
        printTestCaseResult("CreateOptions: \(input)", result == expected)
        return false
    }
    func test_createCombos() -> Bool {
        var pass = false
        
        var options : [[Character]]
        var expected : [[Character]]
        var combos : [[Character]]
        
        var input : String
        
        input = "{a,b}c{d,e}f"
        expected = [["a","b"],["d","e"]]
        options = createOptions(input)
        combos = createCombos(options)
        
        return pass
    }
    
    
    override func test() -> Bool {
        var passed = true
        passed = test_createOptions() && passed
        
        passed = test_createCombos() && passed
    
        
        return passed
    }
    
}
