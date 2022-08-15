class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

        bestSolution(nums, target)
    }
    
    func bestSolution(_ nums: [Int], _ target: Int) -> [Int] {
        
        var lookedNums = [Int: Int]()
        var counterPart = 0
        
        for (i, num) in nums.enumerated() {
            
            counterPart = target - num
            if let counterPartIndex = lookedNums[counterPart] {
                return [counterPartIndex, i]
            } else {
                lookedNums[num] = i
            }
            
        }
        return []
    }
    
    
    func myInitialSolution(_ nums: [Int], _ target: Int) -> [Int] {
        
        // brute force
        for i in 0..<nums.count {
            let diff = target - nums[i]
            for j in (i+1)..<nums.count {
                if nums[j] == diff {
                    if i != j {
                        return [i, j]
                    }
                }
            }
        }
        
        return []
    }
    
}
