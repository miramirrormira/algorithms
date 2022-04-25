//: [Previous](@previous)

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


class Queue {
    var front: ListNode?
    var rear: ListNode?
    
    func enQueue(item: ListNode) {
        if rear == nil {
            front = item
            rear = item
        } else {
            rear!.next = item
            rear = item
        }
    }
    
    func deQueue() -> ListNode? {
        if front == nil {
            return nil
        } else {
            let deQueuedNode = front
            front = front!.next
            if front == nil {
                rear = nil
            }
            return deQueuedNode
        }
    }
}

let q = Queue()

q.enQueue(item: ListNode(0))
q.enQueue(item: ListNode(1))
q.enQueue(item: ListNode(2))
q.enQueue(item: ListNode(3))

q.deQueue()?.val
q.deQueue()?.val
q.deQueue()?.val
q.deQueue()?.val
