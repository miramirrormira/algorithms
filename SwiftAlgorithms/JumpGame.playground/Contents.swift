class Solution {
    func jump(_ nums: [Int]) -> Int {
        mySolution(nums)
    }
    
    func mySolution(_ nums: [Int]) -> Int {
        var numJumps = 0
        let numsCount = nums.count
        var i = 0
        var distanceIndexMap : [Int:Int] = [:]
        while( i < numsCount - 1 ) {
            if nums[i] + i >= numsCount - 1 {
                numJumps += 1
                break
            }
            distanceIndexMap = [:]
            var maxReachableIndex = nums[i] + i
            for j in 1...nums[i] {
                if nums[i+j] + i + j > maxReachableIndex {
                    maxReachableIndex = nums[i+j] + i + j
                    distanceIndexMap[maxReachableIndex] = j
                }
            }
            i = distanceIndexMap[maxReachableIndex]! + i
            numJumps += 1
        }
        return numJumps
    }
    
    func bestSolutionTwo(_ nums: [Int]) -> Int {
        
        var num_jumps = 0
        var prev_max_jump = 0
        var max_jump = 0
        for i in 0..<nums.count - 1 {
            max_jump = max(max_jump, nums[i] + i)
            if i == prev_max_jump {
                num_jumps += 1
                prev_max_jump = max_jump
            }
        }
        return num_jumps
    }
    
    func bestSolution(_ nums: [Int]) -> Int {
        var result = 0
        var left = 0
        var right = 0
        
        while right < nums.count - 1 {
            var farthest = 0
            for i in left...right {
                farthest = max(farthest, i + nums[i])
            }
            left = right + 1
            right = farthest
            result += 1
        }
        
        return result
    }
}

let s = Solution()
s.jump([2,3,1,1,4])
s.jump([3,2,1])
