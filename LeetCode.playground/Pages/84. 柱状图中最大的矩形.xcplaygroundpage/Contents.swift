//: [Previous](@previous)

import Foundation
import UIKit
/*
 给定 n 个非负整数，用来表示柱状图中各个柱子的高度。每个柱子彼此相邻，且宽度为 1 。
 求在该柱状图中，能够勾勒出来的矩形的最大面积。 如下图:
 
 示例:
 输入: [2,1,5,6,2,3]
 输出: 10
 
 */

let image = UIImageView(image: UIImage.init(named: "leetcode_84.png"))

let heights = [2,1,5,6,2,3]
//let heights = [2,4]

class Solution {
    static func largestRectangleArea(_ heights: [Int]) -> Int {
        // res 存储结果
        var res = 0
        // left 左边指针
        var left = 0
        // right 右边指针
        var right = heights.count - 1
        // 当右边指针大于左边指针时，进行循环操作
        while right > left {
            //取左右指针对应的元素值中的小值 * 左右指针之间的距离 = 当前两个指针所能容纳的量
            let tempArea = min(heights[left], heights[right]) * (right+1 - left)
            // tempArea 与 上一次去的的最大值比，取大的值存储在res中
            res = max(res, tempArea)
            //判断此时是左边指针对应的值大还是右边指针对应的值大，
            //如果是左边指针对应的值小，则把左指针向右边移动 →
            //否则右边指针向左移动
            if (heights[right] >= heights[left]) {
                left += 1
            } else {
                right -= 1
            }
        }
        return res
    }
}

let res = Solution.largestRectangleArea(heights)
print(res)

