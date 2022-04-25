import UIKit

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var nums1Copy = nums1
        var nums2Copy = nums2
        if nums1.count == 0 && nums2.count > 0 {
            return getMedian(nums2)
        } else if nums1.count > 0 && nums2.count == 0 {
            return getMedian(nums1)
        }
        
        if nums1.last! < nums2.first! {
            return getMedian(nums1 + nums2)
        } else if nums2.last! < nums1.first! {
            return getMedian(nums2 + nums1)
        }
        
        let finalNums1Length = nums1.count%2 == 1 ? 1 : 2
        let finalNums2Length = nums2.count%2 == 1 ? 1 : 2
        
        partition(nums1: &nums1Copy, nums2: &nums2Copy, finalNums1Length: finalNums1Length, finalNums2Length: finalNums2Length)
        print("nums1: \(nums1Copy)")
        print("nums2: \(nums2Copy)")
        var resultArray : [Int] = nums1Copy + nums2Copy
        
        bubbleSort(&resultArray)
        
        return getMedian(resultArray)
    }
    
    func partition(nums1: inout [Int], nums2: inout [Int], finalNums1Length: Int, finalNums2Length: Int) {
        
        if nums1.count == finalNums1Length && nums2.count == finalNums2Length {
            return
        }
        let nums1median = getMedian(nums1)
        let nums2median = getMedian(nums2)
        if nums1median > nums2median {
            getLeftHalf(&nums1)
            getRightHalf(&nums2)
        } else if nums1median < nums2median {
            getLeftHalf(&nums2)
            getRightHalf(&nums1)
        } else {
            nums1 = [Int(nums1median)]
            nums2 = [Int(nums2median)]
            return
        }
        print("😊 nums1: \(nums1)")
        print("😊 nums2: \(nums2)")
        partition(nums1: &nums1, nums2: &nums2, finalNums1Length: finalNums1Length, finalNums2Length: finalNums2Length)
    }
    
    func getMedian(_ nums: [Int]) -> Double {
        if nums.count%2 == 1 {
            return Double(nums[Int(nums.count/2)])
        } else {
            return Double(nums[nums.count/2-1] + nums[nums.count/2])/2.0
        }
    }
    
    func getLeftHalf(_ nums: inout [Int]) {
        if nums.count%2 == 1 {
            nums = Array(nums.prefix(upTo: Int(nums.count/2 + 1)))
        } else {
            nums = Array(nums.prefix(upTo: nums.count/2))
        }
    }
    
    func getRightHalf(_ nums: inout [Int]) {
        if nums.count%2 == 1 {
            nums = Array(nums.suffix(from: Int(nums.count/2)))
        } else {
            nums = Array(nums.suffix(from: nums.count/2))
        }
    }
    
    func bubbleSort(_ arr: inout [Int]) {
        
        let n = arr.count
        
        for i in 0..<n {
            var swapped = false
            for j in 0..<n-i-1 {
                if arr[j] > arr[j+1]{
                    arr.swapAt(j, j+1)
                    swapped = true
                }
            }
            
            if swapped == false {
                break
            }
        }
    }
}

let nums1 = [1,3,4]
let nums2 = [2]

let solution = Solution()
solution.findMedianSortedArrays(nums1, nums2)

