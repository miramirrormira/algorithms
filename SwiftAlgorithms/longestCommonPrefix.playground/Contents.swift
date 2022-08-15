/*
Write a function to find the longest common prefix string amongst an array of strings.
If there is no common prefix, return an empty string "".

Example 1:
Input: strs = ["flower","flow","flight"]
Output: "fl"

Example 2:
Input: strs = ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.

Constraints:
1 <= strs.length <= 200
0 <= strs[i].length <= 200
strs[i] consists of only lower-case English letters.
*/

import Foundation

class Solution {
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        return anotherBinarySearchCommonPrefix(strs)
    }
    
    func horizonalScanning(_ strs: [String]) -> String {
        //Time Complexity: O(S), where S is the number of all characters in the array, S=m⋅n, n strings with length m. In the worst case all n strings are the same.
        //Space Complexity: O(1)
        var prefix = String(strs[0])
        for str in strs[1...] {
//  this approach's inefficient, because hasPrefix is called multiple times until the prefix dropped enough letters. The hasPrefix function checks the letter from the start until finding the end index of the prefix.
//            while (str.hasPrefix(prefix) == false) {
//                prefix = String(prefix.dropLast(1))
//                if prefix.count == 0 {
//                    return ""
//                }
//            }
            prefix = commonPrefix(str, prefix)
            if prefix == "" {
                return prefix
            }
        }
        return prefix
    }
    
    func horizonalRecursive(_ strs: [String]) -> String {
        if strs.count == 1 { return strs[0] }
        let prefix = horizonalRecursive(Array(strs[1...]))
        return commonPrefix(strs[0], prefix)
    }
    
    func verticalScanning(_ strs: [String]) -> String {
        //Time Complexity: O(S), where S is the number of all characters in the array, S=m⋅n, n strings with length m. In the worst case all n strings are the same.
        //Space Complexity: O(1)
        let prefix = String(strs[0])
        for (i, le) in prefix.enumerated() {
            for str in strs[1...] {
                if i == str.count || le != str[str.index(str.startIndex, offsetBy: i)] {
                    return String(prefix[..<prefix.index(prefix.startIndex, offsetBy: i)])
                }
            }
        }
        return prefix
    }
    
    func myVerticalScanning(_ strs: [String]) -> String {
        let firstStr = strs[0]
        for i in 0..<firstStr.count {
            let targetLetter = String(firstStr[firstStr.index(firstStr.startIndex, offsetBy: i)])
            for str in strs[1...] {
                if i == str.count || targetLetter != String(str[str.index(str.startIndex, offsetBy: i)]) {
                    return String(firstStr[..<firstStr.index(firstStr.startIndex, offsetBy: i)])
                }
            }
        }
        return firstStr
    }
    
    
    func commonPrefix(_ str1: String, _ str2: String) -> String {
        for (i, le) in str1.enumerated() {
            if i == str2.count || le != str2[str2.index(str2.startIndex, offsetBy: i)] {
                return String(str1[..<str1.index(str1.startIndex, offsetBy: i)])
            }
        }
        return str1
    }
    
    func divideConquerCommonPrefix(_ strs: [String]) -> String {
        
        //Time complexity : O(S), where S is the number of all characters in the array, S=m⋅n, n strings with length m.
        //Space complexity: ????
        
        if strs.count == 1 {
            return strs[0]
        } else {
            let mid = Int(strs.count/2)
            let leftPrefix = divideConquerCommonPrefix(Array(strs[0..<mid]))
            let rightPrefix = divideConquerCommonPrefix(Array(strs[mid..<strs.count]))
            return commonPrefix(leftPrefix, rightPrefix)
        }
    }
    
    func anotherBinarySearchCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }
        var low = 1
        var high = Int.max
        for str in strs {
            high = min(high, str.count)
        }
        while (low <= high) {
            let mid = (low + high) / 2
            if hasCommonString(strs, low, mid) {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        return String(strs[0][..<strs[0].index(strs[0].startIndex, offsetBy: (low + high) / 2)])
    }
    
    func binarySearchCommonPrefix(_ strs: [String]) -> String {
//        Time complexity : O(S⋅logm), where S is the sum of all characters in all strings.
//        The algorithm makes logm iterations, for each of them there are S=m⋅n comparisons, which gives in total O(S⋅logm) time complexity.
//        Space complexity : O(1). We only used constant extra space.
        if strs.isEmpty { return "" }
        var low = 1
        var high = Int.max
        for str in strs {
            high = min(high, str.count)
        }
        while (low <= high) {
            let middle = (low + high) / 2
            if commonPrefix(strs, middle) {
                low = middle + 1
            } else {
                high = middle - 1
            }
        }
        return String(strs[0][..<strs[0].index(strs[0].startIndex, offsetBy: (low + high) / 2)])
    }
    
    func commonPrefix(_ strs: [String], _ length: Int) -> Bool {
        let prefix = strs[0][..<strs[0].index(strs[0].startIndex, offsetBy: length)]
        for str in strs[1...] {
            if str.hasPrefix(prefix) == false {
                return false
            }
        }
        return true
    }
    
    func hasCommonString(_ strs: [String], _ start: Int, _ end: Int) -> Bool {
        guard start <= end else { return false }
        let startIndex = strs[0].index(strs[0].startIndex, offsetBy: start - 1)
        let endIndex = strs[0].index(strs[0].startIndex, offsetBy: end - 1)
        let targetString = strs[0][startIndex...endIndex]
        for str in strs[1...] {
            if str.count < end { return false }
            let string = str[startIndex...endIndex]
            if string.hasPrefix(targetString) == false {
                return false
            }
        }
        return true
    }
}

var strs = ["flowers","flow","flight"]

//strs = ["dog","racecar","car"]
let solution = Solution()
//solution.binarySearchCommonPrefix(strs)
//solution.binarySearchCommonPrefix([""])
//solution.commonPrefix("mira", "mi")
//solution.commonPrefix(strs, 2)
//solution.hasCommonString(strs, 0, 3)
solution.anotherBinarySearchCommonPrefix(strs)
solution.anotherBinarySearchCommonPrefix([""])
solution.anotherBinarySearchCommonPrefix(["a"])
solution.anotherBinarySearchCommonPrefix(["a","ab"])
solution.anotherBinarySearchCommonPrefix(["ab","a"])


var str = "flow"
str[str.index(str.startIndex, offsetBy: 1)]

let startIndex = str.index(str.startIndex, offsetBy: 0)
let endIndex = str.index(str.startIndex, offsetBy: 0)
let commonStr = str[startIndex...endIndex]
//let anotherStr = "mira"
//anotherStr[startIndex...endIndex]

