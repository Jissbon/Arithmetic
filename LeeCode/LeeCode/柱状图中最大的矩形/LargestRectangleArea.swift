//
//  LargestRectangleArea.swift
//  LeeCode
//
//  Created by 庞日富 on 2021/6/8.
//

import Foundation

class LargestRectangleArea {
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
            print(left,right,tempArea)
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
