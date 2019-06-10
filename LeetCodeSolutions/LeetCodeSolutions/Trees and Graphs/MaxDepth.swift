//
//  MaxDepth.swift
//  LeetCodeSolutions
//
//  Created by Gene Dahilig on 6/10/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import Foundation


class MaxDepth : Solution {
    /**
     * Definition for a binary tree node.
     */
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
    func buildTree_NIL() -> (TreeNode?,Int) {
        return (nil, 0)
    }
    
    func buildTree_01() -> (TreeNode?,Int) {
        //          3
        //         / \
        //        9  20
        //          /  \
        //         15   7
        //        /
        //       10
        // expected result: 4
        let root : TreeNode = TreeNode(3)
        root.left  = TreeNode(9)
        root.right = TreeNode(20)
        
        root.right!.left  = TreeNode(15)
        root.right!.left!.left  = TreeNode(10)
        root.right!.right = TreeNode(7)
        
        return (root, 4)
    }
    
    func buildTree_02() -> (TreeNode?,Int) {
        //             3
        //           /  \
        //          /    \
        //         /      \
        //        9        20
        //       / \      /  \
        //      8  10   15    7
        //              /
        //            12
        // expected:  4
        //
        //
        let root : TreeNode = TreeNode(3)
        
        root.left  = TreeNode(9)
        root.left!.left = TreeNode(8)
        root.left!.right = TreeNode(10)
        
        root.right = TreeNode(20)
        root.right!.left  = TreeNode(15)
        root.right!.left!.left = TreeNode(12)
        root.right!.right = TreeNode(7)
        
        return (root, 4)
    }
    
    func buildTree_03() -> (TreeNode?,Int) {
        //    3
        //  Expected: 1
        let root : TreeNode = TreeNode(3)
        return (root, 1)
    }
    
    
    func buildTree_04() -> (TreeNode?,Int) {
        //    3
        //   /
        //  1
        //  Expected: 2
        let root = TreeNode(3)
        root.left = TreeNode(1)
        return (root, 2)
    }
    
    func buildTree_05() -> (TreeNode?,Int) {
        //    3
        //     \
        //      4
        //  Expected: 2
        let root = TreeNode(3)
        root.right = TreeNode(4)
        return (root, 2)
    }
    
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        return max(maxDepth(root!.left), maxDepth(root!.right))+1
    }
    
    override func test() -> Bool {
        var result : Int
        var expected : Int
        var root : TreeNode?
        
        (root, expected) = buildTree_NIL()
        result = maxDepth(root)
        printTestCaseResult("BuildTree_NIL", result == expected)
        
        (root, expected) = buildTree_01()
        result = maxDepth(root)
        printTestCaseResult("BuildTree_01", result == expected)

        (root, expected) = buildTree_02()
        result = maxDepth(root)
        printTestCaseResult("BuildTree_02", result == expected)

        (root, expected) = buildTree_03()
        result = maxDepth(root)
        printTestCaseResult("BuildTree_03", result == expected)

        (root, expected) = buildTree_04()
        result = maxDepth(root)
        printTestCaseResult("BuildTree_04", result == expected)

        (root, expected) = buildTree_05()
        result = maxDepth(root)
        printTestCaseResult("BuildTree_05", result == expected)
        return false
 }
}
