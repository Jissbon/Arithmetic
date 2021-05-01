//: [Previous](@previous)

import Foundation


//题目:
/*
 编写一个函数来查找字符串数组中的最长公共前缀。
 如果不存在公共前缀，返回空字符串 ""。
 
 输入：strs = ["flower","flow","flight"]
 输出："fl"
 
 输入：strs = ["dog","racecar","car"]
 输出：""
 解释：输入不存在公共前缀。
 
 提示:
 0 <= strs.length <= 200
 0 <= strs[i].length <= 200
 strs[i] 仅由小写英文字母组成
 
 */

//解题思路:1
/*
 思路
 标签：链表
 当字符串数组长度为 0 时则公共前缀为空，直接返回
 令最长公共前缀 ans 的值为第一个字符串，进行初始化
 遍历后面的字符串，依次将其与 ans 进行比较，两两找出公共前缀，最终结果即为最长公共前缀
 如果查找过程中出现了 ans 为空的情况，则公共前缀不存在直接返回
 时间复杂度：O(s),s 为所有字符串的长度之和

*/


func longestCommonPrefix(_ strs: [String]) -> String {
    
    //1.当字符串数组长度为 0 时则公共前缀为空，直接返回
    if strs.count == 1 {
        return strs[0]
    }
    
    if strs.count < 1 {
        return ""
    }
    
    var ans = strs[0]
    
    for i in 1...strs.count - 1 {
        let str = strs[i]
        print(str)
        if str.count >= 1 && ans.count >= 1 {
            
            //取两个字符串中较短的那一个的count作为遍历的边界
            let sortCount = ans.count < str.count ? ans.count : str.count
            
            var prefix = "" //声明一个临时存储空间
            
            for j in 0...sortCount-1 {
                
                //逐步取位
                let character1 = ans[ans.index(ans.startIndex, offsetBy: j)]
                let character2 = str[str.index(str.startIndex, offsetBy: j)]
                
                if character1 == character2 {
                    prefix = prefix + "\(character1)"
                }
            }
            
            if prefix == "" {
                return prefix
            }else{
                ans = prefix
            }
        }else{
            return ""
        }
    }
    
    return ans
}


let strs = ["","flow","flight","fuck"]


let prefix = longestCommonPrefix(strs)
print(prefix)




//解题思路2:
/*
 1.把数组重拍,按短到长的排法
 */

func longestCommonPrefix2(_ strs: [String]) -> String {
    
    //1.按字符的先后顺序排序了一次
    let sortedStrs = strs.sorted()
    //2.取数组第一位元素,如果没有,则取 ""
    let firstStr = sortedStrs.first ?? ""
    //3.取数组最后一位元素,如果没有,则取 ""
    let lastStr = sortedStrs.last ?? ""
    //4.把最后一个元素的字符遍历字符成为数组
    let lastArr = Array(lastStr)

    //5.声明容器存储prefix
    var result = ""
    //6.用第一个字符串和最后一个字符串进行遍历字符对比
    for (index, char) in firstStr.enumerated() {
        guard char == lastArr[index] else { break }
        result.append(char)
    }
    
    return result
}

