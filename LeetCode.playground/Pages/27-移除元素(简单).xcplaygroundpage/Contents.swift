//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"


func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    
//    nums.removeAll { element in
//        element == val
//    }
//    nums.removeAll{ $0 == val }
    nums = nums.filter{$0 != val}
    return nums.count
    
}

var nums = [0,1,2,2,3,0,4,2]
let val = 2

print(removeElement(&nums, val))


