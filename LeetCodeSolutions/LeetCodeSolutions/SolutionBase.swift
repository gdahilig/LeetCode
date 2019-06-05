//
//  SolutionBase.swift
//  LeetCodeSolutions
//
//  Created by Gene Dahilig on 6/5/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import Foundation

class Solution {
    func pass(_ idx: Int, _ didPass : Bool) {
        if didPass {
            print("Test #\(idx) PASSED!")
        } else {
            print("Test #\(idx) FAILED!")
        }
    }
}
