//
//  ValidNumber.swift
//  LeetCodeSolutions
//
//  Created by Gene Dahilig on 6/5/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import Foundation

class ValidNumber : Solution {
    func isNumber(_ s: String) -> Bool {
        enum States {
            case Start
            case ProcessWhiteSpace1
            case ProcessWhiteSpace2
            case ProcessDigits1
            case ProcessDigits2
            case ProcessDigits3
            case ProcessDecimal
            case ProcessExp
            case End
        }
        
        var state = States.Start
        
        for ch in s {
            switch state {
            case .Start:
                switch ch {
                case "+","-","0"..."9":
                    state = .ProcessDigits1
                case " ":
                    state = .ProcessWhiteSpace1
                case ".":
                    state = .ProcessDecimal
                default:
                    return false
                }
            case .ProcessWhiteSpace1:
                switch ch {
                case "+","-","0"..."9":
                    state = .ProcessDigits1
                case " ":
                    state = .ProcessWhiteSpace1
                case ".":
                    state = .ProcessDecimal
                default:
                    return false
                }
            case .ProcessWhiteSpace2:
                switch ch {
                case " ":
                    state = .ProcessWhiteSpace2
                default:
                    return false
                }
                continue
            case .ProcessDigits1:
                switch ch {
                case "0"..."9":
                    state = .ProcessDigits1
                case ".":
                    state = .ProcessDecimal
                case "e":
                    state = .ProcessExp
                case " ":
                    state = .ProcessWhiteSpace2
                default:
                    return false
                }
            case .ProcessDigits2:
                switch ch {
                case "0"..."9":
                    state = .ProcessDigits2
                case " ":
                    state = .ProcessWhiteSpace2
                case "e":
                    state = .ProcessExp
                default:
                    return false
                }
            case .ProcessDigits3:
                switch ch {
                case "0"..."9":
                    state = .ProcessDigits2
                case " ":
                    state = .ProcessWhiteSpace2
                default:
                    return false
                }
            case .ProcessExp:
                switch ch {
                case "0"..."9", "-":
                    state = .ProcessDigits3
                default:
                    return false
                }
            case .ProcessDecimal:
                switch ch {
                case "0"..."9":
                    state = .ProcessDigits2
                default:
                    return false
                }
            default:
                return false
            }
        }
        return state == .ProcessWhiteSpace2 ||
               state == .ProcessDigits1     ||
               state == .ProcessDigits2     ||
               state == .ProcessDigits3
    }
 
    func runTestCase(_ strNumber : String, _ expected : Bool) -> Bool {
        let result = self.isNumber(strNumber)
        self.printTestCaseResult(strNumber, result == expected)
        return result
    }
    
    override func test() -> Bool {

        var passAll = true

        var expected : Bool
        var result : Bool

        // Test Valid Number strings
        expected = true
        result = self.runTestCase("1", expected)
        passAll = passAll && (result == expected)

        result = self.runTestCase("111", expected)
        passAll = passAll && (result == expected)

        result = self.runTestCase("123456789", expected)
        passAll = passAll && (result == expected)

        result = self.runTestCase("+123", expected)
        passAll = passAll && (result == expected)

        result = self.runTestCase("  +1 ", expected)
        passAll = passAll && (result == expected)

        result = self.runTestCase("1e2", expected)
        passAll = passAll && (result == expected)

        // Test Invalid number strings
        expected = false
        result = self.runTestCase("x", expected)
        passAll = passAll && (result == expected)
        
        result = self.runTestCase("12x34", expected)
        passAll = passAll && (result == expected)

        result = self.LeetCodeTestCases()
        
        self.pass(passAll)
        return passAll
    }
    
    func LeetCodeTestCases() -> Bool {
        var result : Bool

        result = self.runTestCase( " +", false)
        result = self.runTestCase( " -", false)

        
        result = self.runTestCase( ".", false)
        result = self.runTestCase( " .", false)
        result = self.runTestCase( " .5", true)
        result = self.runTestCase( ". ", false)
        result = self.runTestCase( " . ", false)
        result = self.runTestCase( "..", false)
        result = self.runTestCase( ".1.", false)
        result = self.runTestCase( " .9", true)
        result = self.runTestCase( "0", true)
        result = self.runTestCase( " 0.1 ", true)
        result = self.runTestCase( ".1", true)
        result = self.runTestCase( "abc", false)
        result = self.runTestCase( "1 a", false)
        result = self.runTestCase( "2e10", true)
        result = self.runTestCase( " -90e3   ", true)
        result = self.runTestCase( " 1e", false)
        result = self.runTestCase( "e3", false)
        result = self.runTestCase( " 6e-1", true)
        result = self.runTestCase( " 99e2.5 ", false)
        result = self.runTestCase( "53.5e93", true)
        result = self.runTestCase( " --6 ", false)
        result = self.runTestCase( "-+3", false)
        result = self.runTestCase( "95a54e53", false)


        return result
    }
}



