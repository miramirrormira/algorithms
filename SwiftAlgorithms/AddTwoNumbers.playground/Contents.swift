import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        return initialSolution(l1, l2)
    }
    
    func secondSolution (_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        
    }
    
    func initialSolution(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // traverse through the two linked lists and get all the digits stored in two Int arrays
        let l1Array = getDigitArray(l1)
        let l2Array = getDigitArray(l2)
        let maxNumOfDigits = max(l1Array.count, l2Array.count)
        if maxNumOfDigits == 0 { return nil }
        
        var carry = 0
        var resultString = "" // save the result sum in a string, when create the final linked list from it.
        for digitIndex in 0..<maxNumOfDigits {
            var l1CurrentDigit = 0
            if digitIndex < l1Array.count {
                l1CurrentDigit = l1Array[digitIndex]
            }
            var l2CurrentDigit = 0
            if digitIndex < l2Array.count {
                l2CurrentDigit = l2Array[digitIndex]
            }
            
            let sumCurrentDigits = l1CurrentDigit + l2CurrentDigit + carry
            let sumCurrentDigitsArray = String(sumCurrentDigits).compactMap { Int(String($0)) }
            let resultDigit = sumCurrentDigitsArray.last!
            if sumCurrentDigitsArray.count == 2 {
                carry = Int(sumCurrentDigitsArray.first != nil ? sumCurrentDigitsArray.first! : 0)
            } else {
                carry = 0
            }
            
            resultString = resultString + String(resultDigit)
            
            if digitIndex == maxNumOfDigits - 1 && carry != 0 {
                resultString = resultString + String(carry)
            }
        }
        
        var resultListNode : ListNode?
        var lastNode : ListNode?
        for digit in resultString {
            if lastNode == nil {
                lastNode = ListNode(Int(String(digit))!)
                resultListNode = lastNode
                continue
            }
            let newNode = ListNode(Int(String(digit))!)
            lastNode!.next = newNode
            lastNode = newNode
        }

        return resultListNode
    }
    
    func getDigitArray(_ l: ListNode?) -> [Int] {
        if let node = l {
            var result = [Int]()
            var currentNode = node
            result.append(currentNode.val)
            while(currentNode.next != nil) {
                result.append(currentNode.next!.val)
                currentNode = currentNode.next!
            }
            return result
        } else {
            return []
        }
    }
    
}


let l1 = ListNode(1)
let l2 = ListNode(2)
let l3 = ListNode(3)
l1.next = l2
l2.next = l3

let solution = Solution()
assert(solution.getDigitArray(l1) == [1,2,3], "not equal")
assert(solution.getDigitArray(l3) == [3], "not equal")
assert(solution.getDigitArray(nil) == [], "not equal")
