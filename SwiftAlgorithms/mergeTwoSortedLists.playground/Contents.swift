import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        return iterationApproach(list1,list2)
    }
    
    func mergeTwoListsWithRecursion(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        // Time complexity: O(m+n), m: number of nodes in list1, n: number of nodes in list2
        // Space complexity: O(m+n)
        guard let list1 = list1 else {
            return list2
        }
        guard let list2 = list2 else {
            return list1
        }

        if list1.val < list2.val {
            list1.next = mergeTwoListsWithRecursion(list1.next, list2)
            return list1
        } else {
            list2.next = mergeTwoListsWithRecursion(list2.next, list1)
            return list2
        }
        
        
//        if list1 == nil { return list2 }
//        if list2 == nil { return list1 }
//
//        var head: ListNode?
//        if list1!.val < list2!.val {
//            head = list1
//            list1 = list1!.next
//        } else {
//            head = list2
//            list2 = list2!.next
//        }
//
//        mergeTwoListsWithRecursion(list1, list2)
//
//        return head
    }
    
    func iterationApproach(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        // Time complexity: O(m+n), m: number of nodes in list1, n: number of nodes in list2
        // Space complexity: O(1)
        guard let list1 = list1 else {
            return list2
        }
        guard let list2 = list2 else {
            return list1
        }
        
        let head = list1.val > list2.val ? list2 : list1
        var tail = head
        var headList1 = list1.val > list2.val ? list1 : list1.next
        var headList2 = list1.val > list2.val ? list2.next : list2
        
        while( headList1 != nil && headList2 != nil ){
            
            if headList1!.val > headList2!.val {
                tail.next = headList2
                tail = headList2!
                headList2 = headList2!.next
            } else {
                tail.next = headList1
                tail = headList1!
                headList1 = headList1!.next
            }
            
        }
        
        tail.next = headList1 == nil ? headList2 : headList1
        
        return head
    }
    
    func mySolution(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        
        if list2 == nil { return list1 }
        if list1 == nil { return list2 }
        
        var result = list1!.val > list2!.val ? list2 : list1
        var nodeToInsert = list1!.val > list2!.val ? list1 : list2
        var nextNodeToInsert = nodeToInsert!.next
        var currentNode = result
        
        while(nodeToInsert != nil) {
            if currentNode!.next == nil {
                currentNode!.next = nodeToInsert
                break
            } else if nodeToInsert!.val < currentNode!.next!.val {
                nextNodeToInsert = nodeToInsert!.next
                nodeToInsert!.next = currentNode!.next
                currentNode!.next = nodeToInsert
                if nextNodeToInsert == nil {
                    break
                }
                nodeToInsert = nextNodeToInsert
                nextNodeToInsert = nodeToInsert!.next
            } else {
                currentNode = currentNode!.next
            }
        }
            
        return result
    }
}

