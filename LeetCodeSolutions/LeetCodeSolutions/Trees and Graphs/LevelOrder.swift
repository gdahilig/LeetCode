
//
//  LevelOrder.swift
//  LeetCodeSolutions
//
//  Created by Gene Dahilig on 6/8/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//
/*
 Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
 
 For example:
 Given binary tree [3,9,20,null,null,15,7],
 
     3
    / \
   9  20
     /  \
    15   7
 return its level order traversal as:
 
 [
 [3],
 [9,20],
 [15,7]
 ]

 */

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
    func levelOrder(_ _root: TreeNode?) -> [[Int]] {
        
        var result = [[Int]]()
        guard let root = _root else {
            return []
        }
        var levelArray = [(Int,Int)]()
        var queue = [(TreeNode,Int)]()
        queue.append((root,0))
        while queue.count > 0 {
            // visit node
            let (tmp,level) = queue.remove(at: 0)
            levelArray.append((tmp.val,level))
            if tmp.left != nil {
                queue.append(((tmp.left!,level+1)))
            }
            if tmp.right != nil {
                queue.append((tmp.right!,level+1))
            }
        }
        
        var currLevel = 0
        var currLevelArry = [Int]()
        for (value,level) in levelArray {
            if currLevel != level {
                result.append(currLevelArry)
                currLevelArry = [Int]()
                currLevel = level
            }
            currLevelArry.append(value)
        }
        if currLevelArry.count > 0 {
            result.append(currLevelArry)
        }
        return result
    }
    
    func buildTree_NIL() -> (TreeNode?,[[Int]]) {
        return (nil, [])
    }
    
    func buildTree_01() -> (TreeNode?,[[Int]]) {
        //          3
        //         / \
        //        9  20
        //          /  \
        //         15   7
        //        /
        //       10
        // expected result: [[3], [9, 20], [15, 7], [10]]
        let root : TreeNode = TreeNode(3)
        root.left  = TreeNode(9)
        root.right = TreeNode(20)
        
        root.right!.left  = TreeNode(15)
        root.right!.left!.left  = TreeNode(10)
        root.right!.right = TreeNode(7)
        
        return (root, [[3], [9, 20], [15, 7], [10]])
    }
    
    func buildTree_02() -> (TreeNode?,[[Int]]) {
        //             3
        //           /  \
        //          /    \
        //         /      \
        //        9        20
        //       / \      /  \
        //      8  10   15    7
        //              /
        //            12
        // expected:  [[3],[9,20],[8,10,15,7],[12]]
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
        
        return (root, [[3],[9,20],[8,10,15,7],[12]])
    }
    
    func buildTree_03() -> (TreeNode?,[[Int]]) {
        //    3
        //  Expected: [[3]]
        let root : TreeNode = TreeNode(3)
        return (root, [[3]])
    }
    
    
    func buildTree_04() -> (TreeNode?,[[Int]]) {
        //    3
        //   /
        //  1
        //  Expected: [[3],[1]]
        let root = TreeNode(3)
        root.left = TreeNode(1)
        return (root, [[3],[1]])
    }

    func buildTree_05() -> (TreeNode?,[[Int]]) {
        //    3
        //     \
        //      4
        //  Expected: [[3],[4]]
        let root = TreeNode(3)
        root.right = TreeNode(4)
        return (root, [[3],[4]])
    }

    
    override func test() -> Bool {
        var root : TreeNode?
        var expected : [[Int]]
        var result : [[Int]]

        
        (root,expected) = buildTree_05()
        result = levelOrder(root)
        printTestCaseResult("BuildTree_05", result == expected)
        return false
    }
    
}

