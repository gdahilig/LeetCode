//
//  MergeTwoSortedLists.swift
//  LeetCodeSolutions
//
//  Created by Gene Dahilig on 6/4/19.
//  Copyright © 2019 Gene Dahilig. All rights reserved.
//

import Foundation

//    Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class MergeTwoSortedLists {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard l1 != nil else {
            return l2
        }
        guard l2 != nil else {
            return l1
        }
        
        var curr1 = l1
        var curr2 = l2
        var merged,
            mergeTail : ListNode?   // keeps track of the end of the merged list
        
        if curr1!.val < curr2!.val {
            merged = l1
            mergeTail = l1
            curr1 = l1?.next    // advance l1
        } else {
            merged = l2
            mergeTail = l2
            curr2 = l2?.next    // advance l2
        }
        
        repeat {
            if curr1 == nil {
                mergeTail!.next = curr2
                mergeTail = curr2
                curr2 = curr2!.next
                continue
            }
            if curr2 == nil {
                mergeTail!.next = curr1
                mergeTail = curr1
                curr1 = curr1!.next
                continue
            }
            
            // Both items (curr1 & curr2) are not nil
            if curr1!.val < curr2!.val {
                mergeTail!.next = curr1
                mergeTail = curr1
                curr1 = curr1!.next
            } else {
                mergeTail!.next = curr2
                mergeTail = curr2
                curr2 = curr2!.next
            }
        } while curr1 != nil || curr2 != nil

        return merged
    }
    
//  helper function to create a linked list from array of ints
    func array2List(_ arry: [Int]) -> ListNode? {
        var head : ListNode?
        var tail : ListNode?

        if arry.count == 0 {
            return nil
        }
        
        for idx in 0..<arry.count {
            let curr = ListNode(arry[idx])
            if head == nil {
                head = curr
            }
            else {
                tail?.next = curr
            }
            tail = curr
        }
        return head
    }
    
    func list2Array(_ node: ListNode?) -> [Int] {
        if node == nil {
            return []
        }

        var arry = [Int]()
        var tmp = node
        while tmp != nil {
            arry.append(tmp!.val)
            tmp = tmp!.next
        }
        return arry
        
    }
    func compareNodeArray (_ node: ListNode?, arry : [Int]) -> Bool {
        return self.list2Array(node) == arry
    }
    
    func pass(_ idx: Int, _ didPass : Bool) {
        if didPass {
            print("Test #\(idx) PASSED!")
        } else {
            print("Test #\(idx) FAILED!")
        }
    }
    
    func test() {
        var l1,l2 : ListNode?
        var merged : ListNode?
        var idx = 1

        l1 = self.array2List([])
        l2 = self.array2List([])
        merged = self.mergeTwoLists(l1, l2)
        self.pass(idx, merged == nil)
        
        idx += 1
        l1 = self.array2List([1])
        l2 = self.array2List([])
        merged = self.mergeTwoLists(l1, l2)
        self.pass(idx, self.compareNodeArray(merged, arry: [1]))

        idx += 1
        l1 = self.array2List([])
        l2 = self.array2List([1])
        self.pass(idx, self.compareNodeArray(merged, arry: [1]))

        idx += 1
        l1 = self.array2List([1])
        l2 = self.array2List([2])
        merged = self.mergeTwoLists(l1, l2)
        self.pass(idx, self.compareNodeArray(merged, arry: [1,2]))
  
        idx += 1
        l1 = self.array2List([1,3])
        l2 = self.array2List([2])
        merged = self.mergeTwoLists(l1, l2)
        self.pass(idx, self.compareNodeArray(merged, arry: [1,2,3]))
        
        idx += 1
        l1 = self.array2List([2])
        l2 = self.array2List([1,3])
        merged = self.mergeTwoLists(l1, l2)
        self.pass(idx, self.compareNodeArray(merged, arry: [1,2,3]))
        
        idx += 1
        l1 = self.array2List([1,3,5,7])
        l2 = self.array2List([2,4,6])
        merged = self.mergeTwoLists(l1, l2)
        self.pass(idx, self.compareNodeArray(merged, arry: [1,2,3,4,5,6,7]))

        idx += 1
        l1 = self.array2List([2,4,6])
        l2 = self.array2List([1,3,5,7])
        merged = self.mergeTwoLists(l1, l2)
        self.pass(idx, self.compareNodeArray(merged, arry: [1,2,3,4,5,6,7]))
    }
}
