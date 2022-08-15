from collections import deque
import sys

class Node:
    def __init__(self, value):
        self.value = value
        self.left, self.right = None, None

    def print_tree(self):
        if self.left:
            self.left.print_tree()
        print(self.data)
        if self.right:
            self.right.print_tree()

############
# In-Order #
############
def inorder_traversal_recursive(root):
    result = []
    if root:
        result = inorder_traversal_recursive(root.left)
        result.append(root.value)
        result = result + inorder_traversal_recursive(root.right)
        print(result, " size: ", sys.getsizeof(result))
    return result  

def print_inorder_recursive(root):
    if root:
        print_inorder_recursive(root.left)
        print(root.value)
        print_inorder_recursive(root.right)

def print_inorder_iterative(root):
    current = root
    stack = deque()
    while True:
        if current:
            stack.append(current)
            current = current.left
        elif stack:
            current = stack.pop()
            print(current.value)
            current = current.right
        else:
            break

#############
# Pre-Order #
#############
def preorder_traversal_recursive(root):
    result = []
    if root:
        result.append(root.value)
        result = result + preorder_traversal_recursive(root.left)
        result = result + preorder_traversal_recursive(root.right)
    return result

def print_preorder_recursive(root):
    if root:
        print(root.value)
        print_preorder_recursive(root.left)
        print_preorder_recursive(root.right)

## iterative preorder method 1: visit the parent node, then push the right then the left node
def print_preorder_iterative1(root):
    if root is None:
        return
    stack = deque([root])
    while stack:
        node = stack.pop()
        print(node.value)
        if node.right:
            stack.append(node.right)
        if node.left:
            stack.append(node.left)

## iterative preorder method 2: 
## In method 1, the left node is pushed into the stack and then immediately popped. 
## In method 2, we will optimize it so that we don't have to push the left node
def print_preorder_iterative2(root):
    if root is None:
        return
    stack = deque()
    current = root
    while True:
        if current:
            print(current.value)
            if current.right:
                stack.append(current.right)
            current = current.left
        elif stack:
            current = stack.pop()
        else:
            break

##############
# Post-Order #
##############
def postorder_traversal_recursive(root):
    result = []
    if root:
        result = postorder_traversal_recursive(root.left)
        result = result + postorder_traversal_recursive(root.right)
        result.append(root.value)
    return result

def print_postorder_recursive(root):
    if root:
        print_postorder_recursive(root.left)
        print_postorder_recursive(root.right)
        print(root.value)

## method 1: using 2 stacks
def print_postorder_iterative1(root):
    if root is None:
        return
    stack1 = deque()
    stack2 = deque()
    stack1.append(root)
    while stack1:
        node = stack1.pop()
        stack2.append(node)
        if node.left:
            stack1.append(node.left)
        if node.right:
            stack1.append(node.right)
    while stack2:
        node = stack2.pop()
        print(node.value)

## method 2: using 1 stack
def print_postorder_iterative2(root):
    if root is None:
        return
    stack = deque()
    current = root
    while True:
        while current:
            if current.right:
                stack.append(current.right)
            stack.append(current)
            current = current.left
        current = stack.pop()
        if current.right and len(stack) > 0 and stack[-1] == current.right:
            stack.pop()
            stack.append(current)
            current = current.right
        else:
            print(current.value)
            current = None
        if len(stack) == 0:
            break

## method 3: using 1 stack
def print_postorder_iterative3(root):
    stack = deque()
    while True:
        while root is not None:
            stack.append(root)
            stack.append(root)
            root = root.left
        if len(stack) == 0:
            return
        root = stack.pop()
        if len(stack) > 0 and stack[-1] == root:
            root = root.right
        else:
            print(root.value)
            root = None

## method 4: using 1 stack and 1 hashmap
def print_postorder_iterative4(root):
    stack = deque()
    unordered_map = {}
    stack.append(root)
    counter = 0
    while stack and counter < 100:
        counter += 1
        unordered_map[stack[-1]] = 1
        if stack[-1].left and stack[-1].left not in unordered_map:
            stack.append(stack[-1].left)
            continue
        if stack[-1].right and stack[-1].right not in unordered_map:
            stack.append(stack[-1].right)
            continue
        print(stack[-1].value)
        stack.pop()
    
root = Node(1)
root.left = Node(2)
root.right = Node(3)
root.left.left = Node(4)
root.left.right = Node(5)
root.right.left = Node(6)
root.right.right = Node(7)
root.right.right.left = Node(8)
root.right.right.right = Node(9)

# Recursive
# result = inorder_traversal_recursive(root=root)
# print(result)

# result = postorder_traversal_recursive(root=root)
# print(result)

# result = preorder_traversal_recursive(root=root)
# print(result)


# Iterative
# print_preorder_iterative1(root)
# print_preorder_iterative2(root)                   
# print_preorder_recursive(root)

# print_inorder_iterative(root)
# print_inorder_recursive(root)

# print_postorder_recursive(root)
# print_postorder_iterative1(root)
# print_postorder_iterative2(root)
# print_postorder_iterative3(root)
# print_postorder_iterative4(root)