//
//  SearchInsert.swift
//  LeeCode
//
//  Created by 庞日富 on 2021/5/6.
//

import Foundation

class SearchInser {
    static func searchInsert(_ nums: [Int], _ target: Int) -> Int {
            var index = 0
            for i in 0...nums.count-1 {
                print(nums[i])
                if nums[i] < target {
                    index+=1
                }else if nums[i] == target {
                    return i
                }
            }
            return index
    }
}
