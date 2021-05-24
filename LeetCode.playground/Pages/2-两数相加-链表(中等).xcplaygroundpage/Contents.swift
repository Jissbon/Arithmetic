
//题目
/*
 给你两个 非空 的链表，
 表示两个非负的整数。
 它们每位数字都是按照 逆序 的方式存储的，
 并且每个节点只能存储 一位 数字。
 
 请你将两个数相加，并以相同形式返回一个表示和的链表。
 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-two-numbers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


//要做这道题,首先要理解神叫做链表:

/*
 链表是一种物理存储单元上非连续、非顺序的存储结构,
 数据元素的逻辑顺序是通过链表中的指针链接次序实现的
 链表由一系列结点（链表中每一个元素称为结点）组成，
 结点可以在运行时动态生成。
 每个结点包括两个部分：一个是存储数据元素的数据域，
 另一个是存储下一个结点地址的指针域。
 */


//下面我们定义一个简单的链表,这个链表结构也是力扣题目自带的.

public class ListNode {
    ///当前节点的值
    public var val: Int
    //当前节点指向的下一个节点,如果没有指向下一个节点则为nil,所以为可选值
    public var next: ListNode?
    //构造器1
    public init() { self.val = 0; self.next = nil; }
    //构造器2
    public init(_ val: Int) { self.val = val; self.next = nil; }
    //构造器3
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


class Solution {
    //两个两边相加的方法 ,返回值为一个新的链表
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        // 声明一个新链表,用来存储值 , result.val = 0 , next  = nil
        let result: ListNode = ListNode(0)
        
        var p: ListNode? = l1
        var q: ListNode? = l2
        
        var head = result
        
        //假设 l1 = 2 -> 4 -> 3
        //假设 l2 = 5 -> 6 -> 4
        
        var carry = 0
        //对链表进行循环判断
        while (p != nil)||(q != nil) {
            
            let sum = (p?.val ?? 0) + (q?.val ?? 0) + carry
            
            carry = sum / 10
            head.next = ListNode(sum%10)
            head = head.next!
            p = p?.next
            q = q?.next
        }
        
        if carry > 0 {
            head.next = ListNode(carry)
        }
        
        return result.next
    }
}
