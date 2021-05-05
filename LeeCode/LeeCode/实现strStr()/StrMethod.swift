//
//  StrMethod.swift
//  LeeCode
//
//  Created by 庞日富 on 2021/5/5.
//

import Foundation


class StrMethod {
    static func getNext(_ str: String, _ next: inout [Int]) {
        let count = str.count
        if count == 0 {
            return
        }
        
        let str_array = Array(str)
        var i = 0
        var j = -1
        
        //这个做法的意义是?
        //当 j = -1 d 时候 指针i向后移
        // 如: next = ["l","m","n"]
        // j = -1
        // i = 0 的时候, j = -1
        // i += 1 , j += 1
        // next[1] = 
        while i < count - 1 {
            if j == -1 || str_array[i] == str_array[j] {
                i += 1
                j += 1
                next[i] = j
            }else {
                j = next[j]
            }
        }
    }

    static func strStr(_ haystack: String, _ needle: String) -> Int {
        var haystack_count = haystack.count
        var needle_count = needle.count
        var haystack_array = Array(haystack)
        var needle_array = Array(needle)
        
        if needle_count > haystack_count {
            return -1
        }
        if needle_count == 0 {
            return 0
        }
        var next: [Int] = Array(repeating: -1, count: needle_count)
        getNext(needle, &next)
        var i = 0
        var j = 0
        while i < haystack_count && j < needle_count {
            if j == -1 || haystack_array[i] == needle_array[j] {
                if j == needle_count - 1 {
                    return i - j
                }
                i += 1
                j += 1
            }else {
                j = next[j]
            }
        }
        return -1
    }
}
