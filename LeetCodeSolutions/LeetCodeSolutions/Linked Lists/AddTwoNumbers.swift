//
//  AddTwoNumbers.swift
//  LeetCodeSolutions
//
//  Created by Gene Dahilig on 6/16/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import Foundation




class AddTwoNumbers : Solution {
    class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var result : ListNode?
        
        var carry = 0
        var node1 = l1
        var node2 = l2
        while node1 != nil && node2 != nil {
            carry = (node1!.val + node2!.val + carry) / 10
            let newValue = (node1!.val + node2!.val + carry) % 10
            
            if result == nil {
                result = ListNode(newValue)
            } else {
                result!.next = ListNode(newValue)
            }
            
            node1 = node1!.next
            node2 = node2!.next
        }
        
        if node1 == nil && node2 == nil {
            return result
        }
        if node1 == nil {
            if result == nil {
                return node2
            }
            else {
                result!.next = node2
            }
        } else {
            if result == nil {
                return node1
            } else {
                result!.next = node1
            }
            
            
        }
        
        
        return ListNode(0)
    }
    
    func buildList(_ arry : [Int]) -> ListNode?{
        guard arry.count > 0 else {
            return nil
        }
        var result : ListNode?
        for x in arry {
            if result == nil {
                result = ListNode(x)
            } else {
                result!.next = ListNode(x)
            }
        }
        return result
    }
    
    func listequal(_ l1 : ListNode?, _ l2 : ListNode?) -> Bool {
        guard l1 != nil && l2 != nil else {
            return false
        }
        var node1 = l1
        var node2 = l2
        while node1 != nil && node2 != nil {
            if node1!.val == node2!.val {
                node1 = node1!.next
                node2 = node2!.next
            }
            
            
            
        }
        
        return node1 != nil && node2 != nil
    }
    
    override func test() -> Bool {
        let didPass = false
        var result : ListNode?
        var expected : ListNode?
        var l1 : ListNode?
        var l2 : ListNode?
        
        l1 = nil
        l2 = nil
        result = addTwoNumbers(l1, l2)
        printTestCaseResult("Test_00", result == nil)
        
        l1 = ListNode(10)
        l2 = nil
        result = addTwoNumbers(l1, l2)
        printTestCaseResult("Test_02", result != nil && result!.val == 10)

        l1 = nil
        l2 = ListNode(20)
        result = addTwoNumbers(l1, l2)
        expected = nil
        printTestCaseResult("Test_03", result != nil && result!.val == 20)

        l1 = ListNode(1)
        l2 = ListNode(1)
        result = addTwoNumbers(l1, l2)
        expected = nil
        printTestCaseResult("Test_03", result != nil && result!.val == 2)
        
        l1 = buildList([1,1])
        l2 = buildList([1,1])
        result = addTwoNumbers(l1, l2)
        
        return didPass
    }
}
