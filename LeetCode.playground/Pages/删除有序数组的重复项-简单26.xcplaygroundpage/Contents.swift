//: [Previous](@previous)

import Foundation

/*
 题目:
 给你一个有序数组 nums ，请你 原地 删除重复出现的元素，使每个元素 只出现一次 ，返回删除后数组的新长度。
 (有序的数组,这个信息很重要)
 
 不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。
 
 
 示例:
 输入：nums = [1,1,2]
 输出：2, nums = [1,2]
 解释：函数应该返回新的长度 2 ，并且原数组 nums 的前两个元素被修改为 1, 2 。不需要考虑数组中超出新长度后面的元素。
 
 */

//func removeDuplicates(_ nums: inout [Int]) -> Int {
//
//    if nums.count < 1 {
//        return 0
//    }
//
//    var valueMap = [Int:Int]()
//
//    for i in (0...nums.count-1).reversed() {
//        let num = nums[i]
//
//        if valueMap[num] != nil {
//            nums.remove(at: i)
//        }else{
//            valueMap[num] = num;
//        }
//    }
//
//    return nums.count
//}

func removeDuplicates(_ nums:inout  [Int])->Int{

        if nums.count == 0{
            return 0;
        }

        var i = 0;
        
        for index  in 0 ..< nums.count {
            if nums[index] != nums[i]{
                i+=1 //因为数组是有序的,所有数组每一次发现不重复数字的手,它必然是和前面的都不一样的.
                nums[i] = nums[index]
            }
        }
        return i + 1
    }


var nums = [0,0,1,1,1,2,2,3,3,4]
print(removeDuplicates(&nums))
print(nums)

