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
typealias MergeFunction = (_ l1: ListNode?, _ l2: ListNode?) -> ListNode?

class MergeTwoSortedLists : Solution, SolutionProtocol {
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
    
    // LeetCode solution with 122s execution time
    func mergeTwoLists_16ms(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let head = ListNode(0)
        var curL1 = l1
        var curL2 = l2
        var curr = head
        while curL1 != nil || curL2 != nil {
            let num1 = curL1?.val ?? Int.max
            let num2 = curL2?.val ?? Int.max
            if num1 < num2 {
                curr.next = ListNode(num1)
                curL1 = curL1?.next
            } else {
                curr.next = ListNode(num2)
                curL2 = curL2?.next
            }
            curr = curr.next!
        }
        return head.next
    }
    
    // LeetCode solution with 12ms execution time
    func mergeTwoLists_12ms(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var head = ListNode(0)
        var curL1 = l1
        var curL2 = l2
        var curr = head
        while let cl1 = curL1, let cl2 = curL2 {
            if cl1.val < cl2.val {
                curr.next = ListNode(cl1.val)
                curL1 = cl1.next
            } else {
                curr.next = ListNode(cl2.val)
                curL2 = cl2.next
            }
            curr = curr.next!
        }
        if curL1 != nil {
            curr.next = curL1
        }
        if curL2 != nil {
            curr.next = curL2
        }
        return head.next
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
    
    func test() {
        runTestCases("mergeTwoLists", withMergeFn: mergeTwoLists)
        runTestCases("mergeTwoLists_12ms", withMergeFn: mergeTwoLists_12ms)
        runTestCases("mergeTwoLists_16ms", withMergeFn: mergeTwoLists_16ms)
    }
    
    func runTestCases(_ fnName : String, withMergeFn mergeFn : MergeFunction) {
        print("Merge Function: \(fnName)")
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
