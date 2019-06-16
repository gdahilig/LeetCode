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
    func expand(_ S: String) -> [String] {
        var optionsArray = [[Character]]()
        func createOptions( str : String ) -> [ [String] ] {
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
            
            return []
            
        }
        createOptions(str: S)
        return []
    }
    
    override func test() -> Bool {
        var result : [String]
        var expected : [String]
        
        var input : String
        
        input = "{a,b}c{d,e}f"
        result = expand(input)
        expected = ["acdf","acef","bcdf","bcef"]
        printTestCaseResult("{a,b}c{d,e}f", result == expected)
        return false
    }
    
    func test_CreateOptions() {
        
    }
}
