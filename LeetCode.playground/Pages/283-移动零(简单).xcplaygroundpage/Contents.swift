//: [Previous](@previous)

import Foundation

/*
 题目:
 
 给定一个数组 nums，编写一个函数将所有 0
 移动到数组的末尾，同时保持非零元素的相对顺序。
 
 示例:
 
 输入: [0,1,0,3,12]
 输出: [1,3,12,0,0]
 说明:
 
 必须在原数组上操作，不能拷贝额外的数组。
 尽量减少操作次数。
 
 */

//方案1
//func moveZeroes(_ nums:inout [Int]){
//    var j = 0
//    for i in 0...nums.count - 1  {
//
//        if nums[i] != 0 {
//            //如果i位置的数值部位0,则把它放在j的位置上
//            //一开始j表示数组的开始位置
//            //每循环一次,j指针往右边挪动1位,
//            nums[j] = nums[i]
//            if i != j {
//                nums[i] = 0
//            }
//            j += 1
//            //如果进入循环,判断到 num[i] == 0的话,j并不会向后挪动,
//            //这样子,在下一次找到非0数字的时候,才可以找到上一个0位
//            //并且把它替换
//        }
//
//    }
//}
//
//var nums = [0,1,12,3,12]
//
//
//moveZeroes(&nums)
//
//print(nums)


//方案2
func moveZeroes(_ nums:inout [Int]){
    var j = 0
    for i in 0...nums.count - 1  {
        
        if nums[i] != 0 {
            nums.swapAt(i, j)
            j += 1
        }
    }
}
