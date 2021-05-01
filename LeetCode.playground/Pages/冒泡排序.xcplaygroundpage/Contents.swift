//: [Previous](@previous)

import Foundation


// 冒泡排序的基础写啊
//var times1 = 0
//func bubbleSort(_ nums:inout [Int]){
//
//    for i in 0...nums.count-1{
//        for j in 0...nums.count-1-i {
//            times1 += 1
//            if j+1 < nums.count-1-i {
//                if nums[j] > nums[j+1] {
//                    nums.swapAt(j, j+1)
//                }
//            }
//        }
//    }
//}


//冒泡排序的的优化思路1
/*
 假设我们现在排序ar[]=[1,2,3,4,5,6,7,8,10,9]这组数据,
 按照上面的排序方式,第一趟排序后将10和9交换已经有序,
 接下来的8趟排序就是多余的,什么也没做。
 所以我们可以在交换的地方加一个标记,如果那一趟排序没有交换元素,
 说明这组数据已经有序,不用再继续下去。
 */

//var times2 = 0
//func bubbleSort2(_ nums:inout [Int]){
//
//
//    for i in 0...nums.count-1{
//
//        var hasSwap = false
//
//        for j in 0...nums.count-1-i {
//            times2 += 1
//            if j+1 < nums.count-1-i {
//                if nums[j] > nums[j+1] {
//                    nums.swapAt(j, j+1)
//                    hasSwap = true
//                }
//            }
//        }
//
//        if !hasSwap {
//            return
//        }
//    }
//}
//
//
//var nums = [1,2,3,4,5,6,7,8,10,9]
//bubbleSort2(&nums)
//print(nums)
//print(times2)


// 冒泡排序优化思路2

/*
 优化一仅仅适用于连片有序而整体无序的数据(例如：1, 2,3 ,4 ,7,6,5)。
 但是对于前面大部分是无序而后边小半部分有序的数据(1,2,5,7,4,3,6,8,9,10)
 排序效率也不可观,对于种类型数据,我们可以继续优化。
 既我们可以记下最后一次交换的位置,后边没有交换,必然是有序的,
 然后下一次排序从第一个比较到上次记录的位置结束即可。
 */




var times3 = 0
func bubbleSort3(_ nums:inout [Int]){
    
    var lastSwapIndex = 0 //记录最后一次交换的下标位置j
    var k = nums.count-1 // 默认开始时,内循环需要遍历到最后一位,
    for i in 0...nums.count-1{
        
        var hasSwap = false //标记接下来的这一次内循环是否有数字交换操作
        lastSwapIndex = 0
        
        for j in 0...k {
            times3 += 1
            
            if j+1 <= nums.count-1-i { //需要做边界处理
                if nums[j] > nums[j+1] {
                    nums.swapAt(j, j+1)
                    hasSwap = true
                    lastSwapIndex = j // 如果lastSwapIndex 不再被修改,说明它后面的数字已经是有序的了
                    k = lastSwapIndex
                }
            }
        }
        
        //如果没有交换操作,说明已经排序好了
        if !hasSwap {
            return
        }
    }
}

//var nums3 = [1,2,5,7,4,3,6,8,9,10]
//bubbleSort3(&nums3)
//print(nums3)
//print(times3)

// 冒泡排序优化思路3
/*
 优化二的效率有很大的提升,还有一种优化方法可以继续提高效率。
 大致思想就是一次排序可以确定两个值,正向扫描找到最大值交换到最后,
 反向扫描找到最小值交换到最前面。例如：排序数据1,2,3,4,5,6,0
 */


var times4 = 0
func bubbleSort4(_ nums:inout [Int]){
    
    var lastSwapIndex = 0 //记录最后一次交换的下标位置j
    
    var k = nums.count-1  // 默认开始时,内循环需要遍历到最后一位,
    var n = 0 //同时找最大值的最小需要两个下标遍历 ,且默认开始时需要遍历到最左边
    
    for i in 0...nums.count-1{
        
        var hasSwap = false //标记接下来的这一次内循环是否有数字交换操作
        lastSwapIndex = 0 //进入内循环前,需要充值最后一次交换的角标位置;
        
        //正向寻找最大值
        for j in n...k { 
            times4 += 1
            if j+1 <= nums.count-1-i { //做数组边界判断处理
                if nums[j] > nums[j+1] {
                    nums.swapAt(j, j+1)
                    hasSwap = true
                    lastSwapIndex = j // 如果lastSwapIndex 不再被修改,说明它后面的数字已经是有序的了
                }
            }
        }
        
        //如果没有交换操作,说明已经排序好了
        if !hasSwap {
            return
        }
        k = lastSwapIndex
        
        
        //反向遍历寻找最小值
        for j in (n...k).reversed() {
            times4 += 1
            if j-1 >= 0 { //做数组边界判断处理
                if nums[j] < nums[j-1] {
                    nums.swapAt(j, j-1)
                    hasSwap = true
                }
            }
        }
        
        if !hasSwap {
            return
        }
        n += 1
    }
}


var testArray = [1,2,3,4,5,6,0,9,7,8]

var testArray2 = [1,2,3,4,5,6,0,9,7,8]

bubbleSort3(&testArray)
bubbleSort4(&testArray2)
print(testArray)
print(testArray2)

print(times3)
print(times4)
