import Foundation

/*
 Pivot item: the last item in the array.
 i: indicates the position where the pivot item should be, and every item behind i (including ith item) should be less than the pivot value, i.e. the left partition. i starts from 0.
 j: traverse from 0 to the item before the pivot item.
 */

func partitionLomuto(array: inout [Int], _ low: Int, _ high: Int) -> Int {
    // pick last item to pivot
    var i = low - 1
    for j in low..<high {
        if array[j] < array[high] {
            i += 1
            array.swapAt(i, j)
        }
    }
    array.swapAt(i + 1, high)
    return i + 1
}

func partitionHoares(array: inout [Int], low: Int, high: Int) -> Int {
    let pivot = array[low]
    var i = low - 1
    var j = high + 1
    while true {
        i += 1
        while array[i] < pivot {
            i += 1
        }
        
        j -= 1
        while array[j] > pivot {
            j -= 1
        }
        
        if (i >= j) {
//            print("returning: \(j)")
            return j
        }
        array.swapAt(i, j)
    }
}

func quickSort1(array: inout [Int], low: Int, high: Int) {
    if low >= high { return }
    let p = partitionLomuto(array: &array, low, high)
    quickSort1(array: &array, low: low, high: p - 1)
    quickSort1(array: &array, low: p + 1, high: high)
}

func quickSort2(array: inout [Int], low: Int, high: Int) {
    if low >= high { return }
    let p = partitionHoares(array: &array, low: low, high: high)
    quickSort2(array: &array, low: low, high: p)
    quickSort2(array: &array, low: p + 1, high: high)
}
    

var array = [3,4,6,6]
//quickSort1(array: &array, low: 0, high: 6)
//print(array)

array = [10,5,6,20]
quickSort2(array: &array, low: 0, high: array.count - 1)
print(array)

partitionHoares(array: &array, low: 0, high: array.count-1)
//partitionLomuto(array: &array, 0, 6)
print(array)
