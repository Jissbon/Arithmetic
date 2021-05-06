//
//  ZeroMove.swift
//  LeeCode
//
//  Created by 庞日富 on 2021/5/5.
//

import Foundation

class MoveZero {
    static func moveZeroes(_ nums:inout [Int]){
        var j = 0
        for i in 0...nums.count - 1  {
            
            if nums[i] != 0 {
                //如果i位置的数值部位0,则把它放在j的位置上
                //一开始j表示数组的开始位置
                //每循环一次,j指针往右边挪动1位,
                nums[j] = nums[i]
                if i != j {
                    nums[i] = 0
                }
                j += 1
                //如果进入循环,判断到 num[i] == 0的话,j并不会向后挪动,
                //这样子,在下一次找到非0数字的时候,才可以找到上一个0位
                //并且把它替换
            }
            
        }
    }
}
