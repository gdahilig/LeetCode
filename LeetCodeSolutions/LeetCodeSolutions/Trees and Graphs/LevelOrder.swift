
//
//  LevelOrder.swift
//  LeetCodeSolutions
//
//  Created by Gene Dahilig on 6/8/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import Foundation

 public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class LevelOrder : Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        return []
    }
    
    override func test() -> Bool {
        // subclass should override.
        return false
    }
    
}

