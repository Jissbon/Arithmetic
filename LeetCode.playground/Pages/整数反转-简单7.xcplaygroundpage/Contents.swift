
/*
 给你一个 32 位的有符号整数 x ，返回将 x 中的数字部分反转后的结果。

 如果反转后整数超过 32 位的有符号整数的范围 [−2^31,  2^31 − 1] ，就返回 0。


 */

import Foundation



func reverse(_ num:inout Int) -> Int {

    var temp:Int = 0 // 临时存值的容器
    
    while num != 0  {
        let rem = num % 10
        num = num / 10
        //判断新值是否会溢出
        temp = temp * 10 + rem
    }
    
    if temp > Int32.max || temp < Int32.min {
        return 0
    }
    
    return temp
}
