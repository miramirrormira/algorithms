
def quick_sort(arr, l, r):
    if l < r:
        p = lomuto_partition(arr, l, r)
        quick_sort(arr, p + 1, r)
        quick_sort(arr, l, p - 1)

def lomuto_partition(arr, l, r):
    i = l - 1
    j = l
    pivot = arr[r]

    for j in range(l, r):
        if arr[j] <= pivot:
            i += 1
            arr[i], arr[j] = arr[j], arr[i]
        
    arr[i + 1], arr[r] = arr[r], arr[i + 1]
    return i + 1


def quick_sort_hoares(arr, low, high):
    if low < high:
        p = hoares_partition(arr, low, high)
        quick_sort_hoares(arr, low, p)
        quick_sort_hoares(arr, p + 1, high)

def hoares_partition(arr, low, high):
 
    pivot = arr[low]
    i = low - 1
    j = high + 1
 
    while (True):
 
        # Find leftmost element greater than
        # or equal to pivot
        i += 1
        while (arr[i] < pivot):
            i += 1
 
        # Find rightmost element smaller than
        # or equal to pivot
        j -= 1
        while (arr[j] > pivot):
            j -= 1
 
        # If two pointers met.
        if (i >= j):
            return j
 
        arr[i], arr[j] = arr[j], arr[i] 

arr = [4, 7, 5, 3, 6]
p = hoares_partition(arr, 0, 4)
print(arr)
print(p)