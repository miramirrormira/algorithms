class Solution {
    func romanToInt(_ s: String) -> Int {
        return bestSolution(s)
    }
    
    func mySolution(_ s: String) -> Int {
        
        var lastLetter = ""
        var result = 0
        let letterCount = s.count
        for i in 0..<letterCount {
            
            let currentLetter = String(s[s.index(s.startIndex, offsetBy: letterCount - 1 - i)])
            
            if currentLetter == "I" {
                if lastLetter == "V" || lastLetter == "X" {
                    result -= 1
                } else {
                    result += 1
                }
            } else if currentLetter == "V" {
                result += 5
            } else if currentLetter == "X" {
                if lastLetter == "L" || lastLetter == "C" {
                    result -= 10
                } else {
                    result += 10
                }
            } else if currentLetter == "L" {
                result += 50
            } else if currentLetter == "C" {
                if lastLetter == "D" || lastLetter == "M" {
                    result -= 100
                } else {
                    result += 100
                }
            } else if currentLetter == "D" {
                result += 500
            } else if currentLetter == "M" {
                result += 1000
            }
            
            lastLetter = currentLetter
        }
        
        return result
    }
    
    func bestSolution(_ s: String) -> Int {
        var result = 0
        var previousValue = 0
        for c in s {
            var value = 0
            switch c {
            case "I":
                value = 1
                break
            case "V":
                value = 5
                break
            case "X":
                value = 10
                break
            case "L":
                value = 50
                break
            case "C":
                value = 100
                break
            case "D":
                value = 500
                break
            case "M":
                value = 1000
                break
            default:
                value = 0
                break
            }
            if previousValue < value {
                result -= previousValue * 2
            }
            result += value
            previousValue = value
        }
        return result
    }
}

//Symbol       Value
//I             1
//V             5
//X             10
//L             50
//C             100
//D             500
//M             1000

var mira = "MCMLXIV"
Solution().mySolution(mira)
