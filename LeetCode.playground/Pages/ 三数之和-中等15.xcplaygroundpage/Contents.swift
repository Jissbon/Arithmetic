//: [Previous](@previous)

import Foundation

//题目:
/*
 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，
 使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。

 注意：答案中不可以包含重复的三元组。
 
 示例:
 输入：nums = [-1,0,1,2,-1,-4]
 输出：[[-1,-1,2],[-1,0,1]]
 
 示例2:
 输入：nums = []
 输出：[]
 
 示例3:
 输入：nums = [0]
 输出：[]

 提示:
 0 <= nums.length <= 3000
 -105 <= nums[i] <= 105
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/3sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


func threeSum(_ nums: [Int]) -> [[Int]] {
    
    //数组元素小于3的返回空
    if nums.count < 3 {
        return []
    }
    
    //把数组重排,左边小右边大
    let sortedNums = nums.sorted()
    
    //声明空数组装结果
    var result = [[Int]]()
    
    
    for i in 0...sortedNums.count-1 {
        
        //如果判断到了大于零的数,说明后面的数字相加不可能等于0
        if sortedNums[i] > 0 {
            return result
        }
        
        //去重
        if i > 0  && sortedNums[i] == sortedNums[i-1] {
          continue
        }
        
        //取i的下一位
        var L = i+1
        //取数组右侧第一位;
        var R = sortedNums.count-1
            
        while L < R {
            if sortedNums[i] + sortedNums[L] + sortedNums[R] == 0 {
                result.append([sortedNums[i],sortedNums[L],sortedNums[R]])
//                print("i:\(i),L\(L),R:\(R)")
//                print("\([sortedNums[i],sortedNums[L],sortedNums[R]])")
                
                //[i:2,L14,R:39,[-66, 10, 56]
                while L < R  &&  sortedNums[L] == sortedNums[L+1]{
                    L=L+1
                }
                
                while L < R && sortedNums[R] == sortedNums[R-1] {
                    R-=1
                }
                L += 1
                
            }else if sortedNums[i] + sortedNums[L] + sortedNums[R] > 0 {
                R -= 1
            }else{
                L += 1
            }
        }
    }
    
    return result
}



