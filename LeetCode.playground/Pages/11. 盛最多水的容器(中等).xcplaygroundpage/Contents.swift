//: [Previous](@previous)

import Foundation
/*
 给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0) 。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
 
 说明：你不能倾斜容器。
 
 示例1:
 输入：[1,8,6,2,5,4,8,3,7]
 输出：49
 解释：图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。
 
 示例2:
 输入：height = [1,1]
 输出：1
 
 示例 3：
 输入：height = [4,3,2,1,4]
 输出：16
 
 示例4:
 输入：height = [1,2,1]
 输出：2
 
 提示:
 n = height.length
 2 <= n <= 3 * 104
 0 <= height[i] <= 3 * 104
 
 */


//解题方案:

let height = [3,34,4,5,9,10,20,332,7,68,1,5,66,76]
//方案1:
func maxArea(_ height: [Int]) -> Int {
    var result:Int = 0
    for  i in 0 ..< height.count-1 {
        for  j in i+1 ..< height.count {
            let area = (j-i) * min(height[i], height[j])
            result = max(result, area)
        }
    }
    return result
}

let num = maxArea(height)
print("打印结果")
print(num)

// 双指针
// 时间复杂度 O(n)
// 空间复杂度 O(1)
func maxArea2(_ height: [Int]) -> Int {
    // res 存储结果
    var res = 0
    // left 左边指针
    var left = 0
    // right 右边指针
    var right = height.count - 1
    // 当右边指针大于左边指针时，进行循环操作
    while right > left {
        //取左右指针对应的元素值中的小值 * 左右指针之间的距离 = 当前两个指针所能容纳的量
        let tempArea = min(height[left], height[right]) * (right - left)
        // tempArea 与 上一次去的的最大值比，取大的值存储在res中
        res = max(res, tempArea)
        //判断此时是左边指针对应的值大还是右边指针对应的值大，
        //如果是左边指针对应的值小，则把左指针向右边移动 →
        //否则右边指针向左移动
        if (height[right] >= height[left]) {
            left += 1
        } else {
            right -= 1
        }
    }
    return res
}

let num2 = maxArea2(height)
print(num2)

