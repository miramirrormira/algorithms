import UIKit

class Solution {
    func isValid(_ s: String) -> Bool {
        mySolutionOne(s)
    }
    
    func mySolutionOne (_ s: String) -> Bool {
        var openParentheses : String = ""
        
        for el in s {
            if el == "(" || el == "{" || el == "[" {
                openParentheses.append(el)
                continue
            }
            if el == ")" {
                if openParentheses.isEmpty {
                    return false
                } else if openParentheses.popLast() != "(" {
                    return false
                }
                
            } else if el == "}" {
                if openParentheses.isEmpty {
                    return false
                } else if openParentheses.popLast() != "{" {
                    return false
                }
            } else if el == "]" {
                if openParentheses.isEmpty {
                    return false
                } else if openParentheses.popLast() != "[" {
                    return false
                }
            }
        }
        
        return openParentheses.isEmpty
    }
}

//var s = Solution()
//s.isValid("[]")

var string = "string"
string[string.index(string.startIndex, offsetBy: 1)] == "t"
