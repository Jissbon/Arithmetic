//: [Previous](@previous)

import Foundation

//判断一个数是否是会问数:

func isPalindrome(_ x: Int) -> Bool {
    
    
    var temp:Int = 0 // 临时存值的容器
    var x2 = x
    
    while x2 != 0  {
        let rem = x2 % 10
        x2 = x2 / 10
        //判断新值是否会溢出
        temp = temp * 10 + rem
    }
    
    return x == temp
    
    
}

