import Foundation

func binarySearch(nums: [Int], target: Int) -> Int? {
    var l = 0
    var r = nums.count - 1
    
    while (l <= r) {
        let mid = (l + r) / 2
        if nums[mid] < target {
            l = mid + 1
        } else if nums[mid] > target {
            r = mid - 1
        } else if nums[mid] == target {
            return mid
        }
    }
    
    return nil
}


var array = [1,7,9]
binarySearch(nums: array, target: 9)


print(Int(5*0.9))
