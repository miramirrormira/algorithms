class Node:
    def __init__(self, data, next = None, prev = None):
        self.data = data
        self.next = next
        self.prev = prev


class DoublyLinkedList:
    def __init__(self):
        self.head = None

    def print_list(self):
        temp = self.head
        while temp is not None:
            print(temp.data)
            temp = temp.next
        print()
    
    def push(self, new_data):

        new_node = Node(data = new_data)
        new_node.next = self.head
        new_node.prev = None

        if self.head is not None:
            self.head.prev = new_node
        
        self.head = new_node

    def insertAfter(self, prev_node, new_data):
        if prev_node is None:
            print("This node doesn't exist in DLL")
            return

        new_node = Node(data=new_data)

        new_node.next = prev_node.next
        prev_node.next = new_node
        new_node.prev = prev_node

        if new_node.next is not None:
            new_node.next.prev = new_node

    def insertBefore(self, next_node, new_data):
        if next_node is None:
            print("This node doesn't exist in DLL")
            return
        
        new_node = Node(data=new_data)
        new_node.next = next_node

        prev_node = next_node.prev

        next_node.prev = new_node

        if prev_node is None:
            self.head = new_node
        else:
            prev_node.next = new_node
            new_node.prev = prev_node

        
    def append(self, new_data):

        new_node = Node(data=new_data)
        new_node.next = None

        if self.head is None:
            new_node.prev = None
            self.head = new_node
            return

        tail_node = self.head
        while tail_node.next:
            tail_node = tail_node.next

        tail_node.next = new_node
        new_node.prev = tail_node


dll = DoublyLinkedList()
dll.push(1)
dll.push(2)
dll.print_list()

dll.insertBefore(next_node=dll.head.next, new_data = 5)
dll.print_list()

dll.insertBefore(next_node=dll.head, new_data = 6)
dll.print_list()