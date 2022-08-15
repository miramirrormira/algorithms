import UIKit

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        return bestAnswer(&nums, val)
    }
    
    func twoPointers(_ nums: inout [Int], _ val: Int) -> Int {
        
        /*
         i starts from 0, and points to the position where the next item should move to, given the item != val
         traverse j from 0 to the end of nums array
         if the jth item != val
            swap between the ith item and the jth item
            increase i by 1
         */
        var i = 0
        for j in 0..<nums.count {
            if nums[j] != val {
                nums[i] = nums[j]
                i += 1
            }
        }
        
        /* while loop
         i starts from 0, points to the current item
         n starts from the end, points the item to move to index i, if the item at index n != val
         */
        var n = nums.count - 1
        while (i <= n) {
            if nums[i] == val {
                if nums[n] != val {
                    nums[i] = nums[n]
                }
                n -= 1
            } else {
                i += 1
            }
        }
        return i
    }
    
    /*
     traverse i from 0 to the end of the array,
     if the item at i == val
        swap between the item at i and the item at the end of the array
        pop the last item of the array
     else if the item at i != val
        i += 1
     stop when i == nums.count
     */
    func bestAnswer(_ nums: inout [Int], _ val: Int) -> Int {
        
        var i = 0
        while (i < nums.count ) {
            if nums[i] == val {
                if nums[nums.count - 1] != val {
                    nums[i] = nums[nums.count - 1]
                }
                nums.popLast()
            } else {
                i += 1
            }
        }
        
        return i
    }
    
    
    /*
     leftIndex starts from 0
     rightIndex starts from the end
     if the item at leftIndex == val
        if the item at rightIndex == val
            rightIndex -= 1
        if the item at rightIndex != val
            swap the item at leftIndex and rightIndex
     else if the item at leftIndex != val
        leftIndex += 1
     */
    func bestAnswerOne(_ nums: inout [Int], _ val: Int) -> Int {
        var leftIndex = 0
        var rightIndex = nums.count - 1
        
        while leftIndex <= rightIndex {
            
            if nums[leftIndex] == val {
                if nums[rightIndex] != val {
                    nums.swapAt(leftIndex, rightIndex)
                    leftIndex += 1
                    rightIndex -= 1
                } else {
                    rightIndex -= 1
                }
            } else {
                leftIndex += 1
            }
        }
        return leftIndex
    }
}


//let s = Solution()
//var input = [3,2,2,3]
//s.removeElement(&input, 3)
//print(input)
//
//input = [0,1,2,2,3,0,4,2]
//s.removeElement(&input, 2)
//print(input)
//
//input = [1]
//s.removeElement(&input, 1)
//print(input)
