class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        threePointersFromTheEnd(&nums1, m, nums2, n)
    }
    
    func mySolution(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        var i = m - 1
        var j = n - 1
        
        for t in 0..<m+n {
            
            if i < 0 {
                for k in 0...j {
                    nums1[k] = nums2[k]
                }
                break
            }
            if j < 0 {
                break
            }
            
            if nums1[i] > nums2[j] {
                nums1[m+n-t-1] = nums1[i]
                i -= 1
            } else {
                nums1[m+n-t-1] = nums2[j]
                j -= 1
            }
            
        }
    }
    
    func threePointersFromTheEnd(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        var nums1index = m - 1
        var nums2index = n - 1
        
        for i in (0..<(m+n)).reversed() {
            if nums1index < 0 || ( nums2index >= 0 && nums2[nums2index] > nums1[nums1index]) {
                nums1[i] = nums2[nums2index]
                nums2index -= 1
            } else {
                nums1[i] = nums1[nums1index]
                nums1index -= 1
            }
        }
    }
    
    func threePointersFromBeginning(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        let nums1Copy = m == 0 ? [] : nums1[..<m]
        
        var nums1index = 0
        var nums2index = 0
        
        // while loop
//        while (nums1index < m && nums2index < n) {
//            if nums1Copy[nums1index] < nums2[nums2index] {
//                nums1[nums1index + nums2index] = nums1Copy[nums1index]
//                nums1index += 1
//            } else {
//                nums1[nums1index + nums2index] = nums2[nums2index]
//                nums2index += 1
//            }
//        }
//
//        if nums1index <= m-1 {
//            nums1[(nums1index + nums2index)...] = nums1Copy[nums1index...]
//        }
//
//        if nums2index <= n-1 {
//            nums1[(nums1index + nums2index)...] = nums2[nums2index...]
//        }
        
        
        // for loop
        for i in 0..<(m + n) {
            if nums2index > n - 1 || (nums1index < m && nums1Copy[nums1index] < nums2[nums2index]) {
                nums1[i] = nums1Copy[nums1index]
                nums1index += 1
            } else {
                nums1[i] = nums2[nums2index]
                nums2index += 1
            }
        }
    }
}


var nums1 = [1,2,3,0,0,0]
var m = 3
var nums2 = [2,5,6]
var n = 3
Solution().merge(&nums1, m, nums2, n)

nums1 = [0]
m = 0
nums2 = [1]
n = 1
Solution().merge(&nums1, m, nums2, n)

