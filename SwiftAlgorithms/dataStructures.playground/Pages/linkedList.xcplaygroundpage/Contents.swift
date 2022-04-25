//struct ListNode {
//    var value: Int
//    var next: ListNode?
//}
// https://developer.apple.com/forums/thread/19412

// box approach
class Box<T> {
    var wrapped: T
    init(_ wrapped: T) {
        self.wrapped = wrapped
    }
}

struct ListNode {
    var value: Int
    var next: Box<ListNode>?
}

// array approach
struct ListNode2 {
    var value: Int
    var next: [ListNode2]
}

//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init() { self.val = 0; self.next = nil; }
//    public init(_ val: Int) { self.val = val; self.next = nil; }
//    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
//}
