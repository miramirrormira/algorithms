import UIKit

var array = [Int]()

var first = array.first != nil ? array.first! : 0

array = [1]
first = array.first != nil ? array.first! : 0



//func permutateString(_ str: String) -> [String]{
//
//    if str.count == 1 { return [str]}
//
//    for i in 0..<str.count {
//        var index = str.index(str.startIndex, offsetBy: i-1)
//        let letterI = str[index...index+1]
//        let leftStr = str[..<index]
//        index = str.index(str.endIndex, offsetBy: i - str.count + 1)
//        let rightStr = str[index...]
//        let remainingStr = String(leftStr + rightStr)
//
//        permutateString(remainingStr)
//    }
//    return []
//}
//
//
//var index = myString.index(myString.endIndex, offsetBy: -1)
//myString[...index]
//myString[index...]
//index = myString.index(myString.startIndex, offsetBy: 2)
//myString[...index]
//myString[index...]
