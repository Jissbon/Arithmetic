//
//  LongPrefix.swift
//  LeeCode
//
//  Created by 庞日富 on 2021/5/1.
//

import Foundation

class LongPreFix {
    
    //解题思路1
    static func longestCommonPrefix(_ strs: [String]) -> String {
        
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
                    }else{
                        break
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
    
    
    
    //解题思路2:
    static func longestCommonPrefix2(_ strs: [String]) -> String {
        
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
    

}
