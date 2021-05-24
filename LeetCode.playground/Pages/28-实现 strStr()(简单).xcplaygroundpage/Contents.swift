//: [Previous](@previous)

import Foundation

/*
 题目:
 实现 strStr() 函数。
 给你两个字符串 haystack 和 needle ，请你在 haystack 字符串中找出 needle 字符串出现的第一个位置（下标从 0 开始）。如果不存在，则返回  -1 。
 
 说明：
 
 当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。
 
 对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与 C 语言的 strstr() 以及 Java 的 indexOf() 定义相符。
 
  
 
 示例 1：
 
 输入：haystack = "hello", needle = "ll"
 输出：2
 示例 2：
 
 输入：haystack = "aaaaa", needle = "bba"
 输出：-1
 示例 3：
 
 输入：haystack = "", needle = ""
 输出：0
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/implement-strstr
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

//方案1
//func strStr(_ haystack: String, _ needle: String) -> Int {
//    if needle.count < 1 {
//        return 0
//    }
//
//    if needle.count > haystack.count  {
//        return -1
//    }
//
//    let ocString = haystack as NSString
//
//    if ocString.contains(needle) {
//        let range =  ocString.range(of: needle)
//        return range.location
//    }else{
//        return -1
//    }
//}
//
//let location = strStr("abcd", "cd")


//方案2
//func getNext(_ str: String, _ next: inout [Int]) {
//    let count = str.count
//    if count == 0 {
//        return
//    }
//
//    let str_array = Array(str)
//    var i = 0
//    var j = -1
//    while i < count - 1 {
//        if j == -1 || str_array[i] == str_array[j] {
//            i += 1
//            j += 1
//            next[i] = j
//        }else {
//            j = next[j]
//        }
//    }
//}
//
//func strStr(_ haystack: String, _ needle: String) -> Int {
//    var haystack_count = haystack.count
//    var needle_count = needle.count
//    var haystack_array = Array(haystack)
//    var needle_array = Array(needle)
//
//    if needle_count > haystack_count {
//        return -1
//    }
//    if needle_count == 0 {
//        return 0
//    }
//    var next: [Int] = Array(repeating: -1, count: needle_count)
//    getNext(needle, &next)
//    var i = 0
//    var j = 0
//    while i < haystack_count && j < needle_count {
//        if j == -1 || haystack_array[i] == needle_array[j] {
//            if j == needle_count - 1 {
//                return i - j
//            }
//            i += 1
//            j += 1
//        }else {
//            j = next[j]
//        }
//    }
//    return -1
//}
//
//let location = strStr("abcdefgeadef", "abcdegadef")


//方案3

func strStr(_ haystack: String, _ needle: String) -> Int {
    if haystack == needle{
        return 0
    }
    if haystack.count < needle.count{
        return -1
    }
    var a:String=haystack
    for i in 0...(a.count-needle.count){
        if a.hasPrefix(needle){
            return i
        }
        a.remove(at:a.startIndex)
    }
    return -1
}
