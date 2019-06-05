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
        return false
    }
 
   override func test() -> Bool {

        var passAll = false
        var result : Bool
        var expected : Bool
        
        expected = false
        result = self.isNumber(" ")
        passAll = passAll && (result == expected)
        
        self.pass(passAll)
        return passAll
    }
}
