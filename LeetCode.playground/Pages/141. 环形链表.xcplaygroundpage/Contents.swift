//: [Previous](@previous)

import Foundation

/*
 给定一个链表，判断链表中是否有环。

 如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。
 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。
 如果 pos 是 -1，则在该链表中没有环。
 注意：pos 不作为参数进行传递，仅仅是为了标识链表的实际情况。
 
 进阶：
 你能用 O(1)（即，常量）内存解决此问题吗？


 示例 1：
 输入：head = [3,2,0,-4], pos = 1
 输出：true
 解释：链表中有一个环，其尾部连接到第二个节点。
 
 示例 2：
 输入：head = [1,2], pos = 0
 输出：true
 解释：链表中有一个环，其尾部连接到第一个节点。
 
 示例 3：输入：head = [1], pos = -1
 输出：false
 解释：链表中没有环。
 
 提示：
 链表中节点的数目范围是 [0, 104]
 -105 <= Node.val <= 105
 pos 为 -1 或者链表中的一个 有效索引 。
 */


//定义一个简单的链表
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        // 链表为空，或者节点指向的下一个节点为空的时候，返回false
        if head == nil || head?.next == nil {
            return false
        }

        // 定义一个
        var fast = head?.next?.next

        var slow = head?.next

        while fast != nil {
            if fast === slow  {
                return true
            }
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        return false
    }
}
