//: [Previous](@previous)

import Foundation


/*
 题目:
 将两个升序链表合并为一个新的 升序 链表并返回。
 新链表是通过拼接给定的两个链表的所有节点组成的。
 */

/*
 案例1:
 输入：l1 = [1,2,4], l2 = [1,3,4]
 输出：[1,1,2,3,4,4]
 */

/*
 案例2:
 输入：l1 = [], l2 = []
 输出：[]
 */

/*
 案例3:
 输入：l1 = [], l2 = [0]
 输出：[0]
 */

/*
 提示:
 两个链表的节点数目范围是 [0, 50]
 -100 <= Node.val <= 100
 l1 和 l2 均按 非递减顺序 排列
 */




public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}



func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    // 持有l1 , 并修改为可变链表
    var minNode = l1
    // 持有l2 , 并修改为可变链表
    var maxNode = l2
    // 声明val为-1的链表
    let preNode = ListNode(-1)
    
    var head: ListNode? = preNode
    
    while minNode != nil {
        while maxNode != nil, maxNode?.val ?? 0 < minNode?.val ?? 0 {
            head?.next = maxNode
            head = head?.next
            maxNode = maxNode?.next
        }
        head?.next = minNode
        head = head?.next
        minNode = minNode?.next
    }
    head?.next = minNode ?? maxNode
    return preNode.next
}

let l1 = ListNode(1)
let l2 = ListNode(2)
let l3 = mergeTwoLists(l1, l2)
print(l3?.val as Any,l3?.next! as Any)

