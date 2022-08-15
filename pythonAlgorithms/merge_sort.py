def merge_sort(arr):
    if len(arr) < 2:
        return arr
    else:
        mid = len(arr)//2
        left_arr = merge_sort(arr[:mid])
        right_arr = merge_sort(arr[mid:])
        return merge(left_arr, right_arr)
        
def merge(sorted_arr1, sorted_arr2):

    i = 0
    j = 0
    result = []

    while i < len(sorted_arr1) and j < len(sorted_arr2):
        if sorted_arr1[i] < sorted_arr2[j]:
            result.append(sorted_arr1[i])
            i += 1
        else:
            result.append(sorted_arr2[j])
            j += 1

    if i < len(sorted_arr1):
        result += sorted_arr1[i:]
    elif j < len(sorted_arr2):
        result += sorted_arr2[j:]
    return result

array = [3,2,5,2,3,6]
print("merging array:", array, ", result: ", merge_sort(array))

array = [3]
print("merging array:", array, ", result: ", merge_sort(array))

array = []
print("merging array:", array, ", result: ", merge_sort(array))