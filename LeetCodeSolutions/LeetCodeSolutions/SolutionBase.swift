//
//  SolutionBase.swift
//  LeetCodeSolutions
//
//  Created by Gene Dahilig on 6/5/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import Foundation
protocol NameDescribable {
    var typeName: String { get }
    static var typeName: String { get }
}


extension NameDescribable {
    var typeName: String {
        return String(describing: type(of: self))
    }
    
    static var typeName: String {
        return String(describing: self)
    }
}

class Solution {
    func pass(_ idx: Int, _ didPass : Bool) {
        if didPass {
            print("Test #\(idx) PASSED!")
        } else {
            print("Test #\(idx) <================== FAILED!")
        }
    }

    func pass(_ didPass : Bool) {
        if didPass {
            print("Test PASSED!")
        } else {
            print("Test FAILED!")
        }
    }

    func runTests() {
        self.printTestBanner()
        self.test()
    }
    
    func test() -> Bool {
        // subclass should override.
        return false
    }
    func printTestBanner() {
        print("------------------------------")
        print("Testing: \(self.typeName)")
        print("------------------------------")
    }
    func printTestCaseResult(_ name : String, _ didPass : Bool) {
        if didPass {
            print("Testcase \"\(name)\" PASSED!")
        } else {
            print("Testcase \"\(name)\"  <==================== FAILED!")
        }
    }
}

extension Solution: NameDescribable {}
