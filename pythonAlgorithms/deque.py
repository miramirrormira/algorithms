from collections import deque

queue = deque([1,2,3])

queue.append(4)
print(queue) # deque([1, 2, 3, 4])

queue.pop()
print(queue) # deque([1, 2, 3])

queue.appendleft(0)
print(queue) # deque([0, 1, 2, 3])

queue.popleft()
print(queue) # deque([1, 2, 3])

print(queue.index(2, 1, 2)) # 1, search for 2's index, starting from index 1 until index 2 (not including index 2)

queue.insert(3, 4)
print(queue) # deque([1, 2, 3, 4])

print("The count of 2 in deque is: ", queue.count(2))

queue.remove(1) # delete the first occurrence of 1
print(queue) # deque([2, 3, 4])

queue.extend([5,6,7])
print(queue) # deque([2, 3, 4, 5, 6, 7])

queue.extendleft([8,9,10])
print(queue) # deque([10, 9, 8, 2, 3, 4, 5, 6, 7])

queue.rotate(3)
print(queue) # deque([5, 6, 7, 10, 9, 8, 2, 3, 4])

queue.rotate(-3)
print(queue) # deque([10, 9, 8, 2, 3, 4, 5, 6, 7])

queue.reverse()
print(queue) # deque([7, 6, 5, 4, 3, 2, 8, 9, 10])

print(queue[-1])
