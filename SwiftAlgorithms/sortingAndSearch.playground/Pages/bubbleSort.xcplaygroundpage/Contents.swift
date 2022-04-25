import Foundation

/*
 Bubble: https://www.geeksforgeeks.org/bubble-sort/?ref=gcse
 
 worst and average case time complexity: O(n^2)
 best case time complexity: O(n).  The best-case occurs when an array is already sorted.
 Auxiliary Space: O(1)
 sorting in place: yes
 */

func bubbleSort(nums: inout [Int]) {
    for j in (0..<nums.count).reversed() {
        var swapped = false
        for i in 0..<j {
            if nums[i] > nums[i + 1] {
                nums.swapAt(i, i + 1)
                swapped = true
            }
        }
        if swapped == false {
            break
        }
    }
}

func bubbleSortTwo(nums: inout [Int]) {
    for i in 0..<nums.count {
        var swapped = false
        for j in (i+1)..<nums.count {
            if nums[j-1] > nums[j] {
                nums.swapAt(j-1, j)
                swapped = true
            }
        }
        if swapped == false {
            break
        }
    }
}

//var input = [Int]()
//bubbleSort(nums: &input)
//print(input)
//
//input = [3,2,6,2,3]
//bubbleSort(nums: &input)
//print(input)
//
//input = [0]
//bubbleSort(nums: &input)
//print(input)
//
//input = [0,0,0,0,0]
//bubbleSort(nums: &input)
//print(input)

var input = [Int]()
bubbleSortTwo(nums: &input)
print(input)

input = [3,2,6,2,3]
bubbleSortTwo(nums: &input)
print(input)

input = [0]
bubbleSortTwo(nums: &input)
print(input)

input = [0,0,0,0,0]
bubbleSortTwo(nums: &input)
print(input)
