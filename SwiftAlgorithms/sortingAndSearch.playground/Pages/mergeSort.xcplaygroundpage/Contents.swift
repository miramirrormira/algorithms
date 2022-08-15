import Foundation

/*
 Time complexity: O(nlogn), best, worst and average
 Auxiliary Space: O(n)
 Algorithmic Paradigm: Divide and Conquer
 Sorting In Place: No in a typical implementation
 Stable: Yes
 */

// approach 1
func merge(left: [Int], right:[Int]) -> [Int] {
    var mergedList = [Int]()
    var left = left
    var right = right

    while left.count > 0 && right.count > 0 {
        if left.first! < right.first! {
            mergedList.append(left.removeFirst())
        } else {
            mergedList.append(right.removeFirst())
        }
    }

    return mergedList + left + right
}

func mergeSort1(list:[Int]) -> [Int] {
    guard list.count > 1 else {
        return list
    }

    let leftList = Array(list[0..<list.count/2])
    let rightList = Array(list[list.count/2..<list.count])

    return merge(left: mergeSort1(list:leftList), right: mergeSort1(list:rightList))
}


/* approach 2
 1. pass the array into the func as a pointer, eventually we will store the result in the input array. Since we are storing the result in the input array, if the input array has only 1 or 0 items, we don't have to do anything, and that's our base case.
 2. make a copy of the input array and divide the array to left and right parts.
 3. merge sort the left and right array, the result will be updated in the left and right array
 4. merge the left and right sorted array
*/
func mergeSort2(arr: inout [Int]) {
    if arr.count > 1 {
        
        let mid = arr.count/2
        var left = Array(arr[..<mid])
        var right = Array(arr[mid...])
        
        mergeSort2(arr: &left)
        mergeSort2(arr: &right)
        
        var i = 0
        var j = 0
        
        for k in 0..<arr.count {
            if j > right.count - 1 || ( i < left.count && left[i] < right[j]) {
                arr[k] = left[i]
                i += 1
            } else {
                arr[k] = right[j]
                j += 1
            }
        }
    }
}


// approach 3

func mergeSort3(array: inout [Int]) {
    
    if array.count < 2 { return }
    
    let m = array.count / 2
    var left = Array(array[..<m])
    var right = Array(array[m...])
    
    mergeSort3(array: &left)
    mergeSort3(array: &right)
    
    merge(array: &array, arr1: &left, arr2: &right)
}

func merge(array: inout [Int], arr1: inout [Int], arr2: inout [Int]) {
    
    var i = 0
    var j = 0
    let n = array.count
    
    for k in 0..<n {
        if j > arr2.count - 1 || (i < arr1.count && arr1[i] < arr2[j]) {
            array[k] = arr1[i]
            i += 1
        } else {
            array[k] = arr2[j]
            j += 1
        }
    }
}


var input = [3,2,5,2,4,7,8,4,8,3,23,98]
mergeSort3(array: &input)

//mergeSort(arr: &input)
//input = [0]
//mergeSort(arr: &input)
//input = []
//mergeSort(arr: &input)
