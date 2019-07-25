//
//  Test_LevelOrder.swift
//  UnitTest
//
//  Created by Gene Dahilig on 7/21/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import XCTest

class Test_LevelOrder: XCTestCase {
    var root : TreeNode?
    var expected : [[Int]] = []
    var result : [[Int]] = []
    var algorithm = LevelOrder()
    
    override func setUp() {
      algorithm = LevelOrder()
    }
    

    func test_NIL_Tree() {
        // Build NIL Tree
        root = nil
        expected = []
        result = algorithm.levelOrder(root)
        XCTAssertEqual(result, expected)

    }
    
    func test1() {
        // Build Tree
        //          3
        //         / \
        //        9  20
        //          /  \
        //         15   7
        //        /
        //       10
        // expected result: [[3], [9, 20], [15, 7], [10]]
        
        root = TreeNode(3)
        root!.left  = TreeNode(9)
        root!.right = TreeNode(20)
        
        root!.right!.left  = TreeNode(15)
        root!.right!.left!.left  = TreeNode(10)
        root!.right!.right = TreeNode(7)
        
        expected = [[3], [9, 20], [15, 7], [10]]
        result = algorithm.levelOrder(root)
        XCTAssertEqual(result, expected)
    }

    func test2() {
        // Build Tree
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
        root = TreeNode(3)
        
        root!.left  = TreeNode(9)
        root!.left!.left = TreeNode(8)
        root!.left!.right = TreeNode(10)
        
        root!.right = TreeNode(20)
        root!.right!.left  = TreeNode(15)
        root!.right!.left!.left = TreeNode(12)
        root?.right!.right = TreeNode(7)
        
        result = algorithm.levelOrder(root)
        expected = [[3],[9,20],[8,10,15,7],[12]]
        XCTAssertEqual(result, expected)
    }

    func test3() {
        // Build Tree
        //    3
        //  Expected: [[3]]
        root = TreeNode(3)
        result = algorithm.levelOrder(root)
        expected = [[3]]
        XCTAssertEqual(result, expected)
    }

    func test4() {
        // Build Tree
        //    3
        //   /
        //  1
        //  Expected: [[3],[1]]
        root = TreeNode(3)
        root!.left = TreeNode(1)
        
        result = algorithm.levelOrder(root)
        expected = [[3],[1]]
        XCTAssertEqual(result, expected)
    }
    
    func test5() {
        // Build Tree
        //    3
        //     \
        //      4
        //  Expected: [[3],[4]]
        let root = TreeNode(3)
        root.right = TreeNode(4)
        result = algorithm.levelOrder(root)
        expected = [[3],[4]]
        XCTAssertEqual(result, expected)
    }

}
