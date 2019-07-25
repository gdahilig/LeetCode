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
            case ProcessDecimal1
            case ProcessDecimal2
            case ProcessSign1
            case ProcessSign2
            case ProcessExp
            case End
        }
        
        var state = States.Start
        
        for ch in s {
            switch state {
            case .Start:
                switch ch {
                case "0"..."9":
                    state = .ProcessDigits1
                case "+","-":
                    state = .ProcessSign1
                case " ":
                    state = .ProcessWhiteSpace1
                case ".":
                    state = .ProcessDecimal1
                default:
                    return false
                }
            case .ProcessWhiteSpace1:
                switch ch {
                case "+","-":
                    state = .ProcessSign1
                case "0"..."9":
                    state = .ProcessDigits1
                case " ":
                    state = .ProcessWhiteSpace1
                case ".":
                    state = .ProcessDecimal1
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
                    state = .ProcessDecimal2
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
                    state = .ProcessDigits3
                case " ":
                    state = .ProcessWhiteSpace2
                default:
                    return false
                }
            case .ProcessExp:
                switch ch {
                case "0"..."9":
                    state = .ProcessDigits3
                case "-","+":
                    state = .ProcessSign2
                default:
                    return false
                }
            case .ProcessDecimal1:
                switch ch {
                case "0"..."9":
                    state = .ProcessDecimal2
                default:
                    return false
                }
            case .ProcessDecimal2:
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
            case .ProcessSign1:
                switch ch {
                case "0"..."9":
                    state = .ProcessDigits1
                case ".":
                    state = .ProcessDecimal1
                default:
                    return false
                }
            case .ProcessSign2:
                switch ch {
                case "0"..."9":
                    state = .ProcessDigits3
                default:
                    return false
                }
            default:
                return false
            }
        }
        return state == .ProcessWhiteSpace2 ||
            state == .ProcessDecimal2    ||
            state == .ProcessDigits1     ||
            state == .ProcessDigits2     ||
            state == .ProcessDigits3
    }
    
    func isNumber_v2(_ s: String) -> Bool {
        enum InputClass : CaseIterable {
            case digits
            case sign
            case blank
            case decimal
            case exponent
        }
        enum States : CaseIterable {
            case Start
            case ProcessWhiteSpace1
            case ProcessWhiteSpace2
            case ProcessDigits1
            case ProcessDigits2
            case ProcessDigits3
            case ProcessDecimal1
            case ProcessDecimal2
            case ProcessSign1
            case ProcessSign2
            case ProcessExp
            case End
        }
        
        typealias Transitions = [InputClass:States]
        
        func buildStateTable () -> [States : Transitions] {
            var transitionTable : [States : Transitions]
            
            transitionTable = [
                .Start : [
                    .digits : .ProcessDigits1,
                    .sign   : .ProcessSign1,
                    .blank  : .ProcessWhiteSpace1,
                    .decimal: .ProcessDecimal1
                    ],
                .ProcessWhiteSpace1 : [
                    .digits : .ProcessDigits1,
                    .sign   : .ProcessSign1,
                    .blank  : .ProcessWhiteSpace1,
                    .decimal: .ProcessDecimal1
                    ],
                .ProcessWhiteSpace2 : [
                    .blank  : .ProcessWhiteSpace2
                    ],
                .ProcessDigits1 : [
                    .digits : .ProcessDigits1,
                    .blank  : .ProcessWhiteSpace2,
                    .decimal: .ProcessDecimal2,
                    .exponent:.ProcessExp
                    ],
                .ProcessDigits2 : [
                    .digits : .ProcessDigits2,
                    .blank  : .ProcessWhiteSpace2,
                    .exponent:.ProcessExp
                    ],
                .ProcessDigits3 : [
                    .digits : .ProcessDigits3,
                    .blank  : .ProcessWhiteSpace2,
                    ],
                .ProcessExp : [
                    .digits : .ProcessDigits3,
                    .sign  : .ProcessSign2,
                    ],
                .ProcessDecimal1 : [
                    .digits : .ProcessDecimal2,
                    ],
                .ProcessDecimal2 : [
                    .digits : .ProcessDigits2,
                    .blank  : .ProcessWhiteSpace2,
                    .exponent:.ProcessExp
                    ],
                .ProcessSign1 : [
                    .digits : .ProcessDigits1,
                    .decimal: .ProcessDecimal1,
                    ],
                .ProcessSign2 : [
                    .digits : .ProcessDigits3,
                ],
            ]
            
            return transitionTable
        }

        func getInputClass(_ s : Character) -> InputClass?  {
            switch s {
            case "0"..."9"  : return .digits
            case " "        : return .blank
            case "+","-"    : return .sign
            case "."        : return .decimal
            case "e"        : return .exponent
            default         : return nil
            }
        }
        
        var transitionTable = buildStateTable()

        // set  initial state
        var currState = States.Start
        
        for ch in s {
            guard let inputClass = getInputClass(ch) else {
                return false
            }
            
            guard let nextState = transitionTable[currState]![inputClass] else {
                return false
            }

            currState = nextState
        }
        return currState == .ProcessWhiteSpace2 ||
            currState == .ProcessDecimal2    ||
            currState == .ProcessDigits1     ||
            currState == .ProcessDigits2     ||
            currState == .ProcessDigits3
    }
}



