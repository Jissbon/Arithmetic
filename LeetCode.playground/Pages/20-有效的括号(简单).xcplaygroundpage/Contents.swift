//: [Previous](@previous)

import Foundation

//题目:
/*
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。

 */

//方案1
 func isValid0(_ str:String) -> Bool{
    
    //1判断如果字符串长度为单数,不可能有效,因为括号必须成对出现
    if str.count % 2 != 0 || str.count < 2 {
        return false
    }
    
    //2.第一个字符不能是右边的括号类型:[")","]","}"]
    let first = str.first!
    if [")","]","}"].contains("\(first)") {
        return false
    }
    
    let leftBrackets = ["(","[","{"]
    var leftBracketsValid = [String]()
    let keyValue = [")":"(","]":"[","}":"{"]
    
    for i in 0...str.count-1 {
        let charecter = "\(str[str.index(str.startIndex, offsetBy: i)])"
        
        if leftBrackets.contains(charecter) {
            leftBracketsValid.append(charecter)
        }else{
            let lastBracket = leftBracketsValid.last ?? ""
            
            if keyValue[charecter] == lastBracket {
                leftBracketsValid.removeLast()
            }else{
                return false
            }
        }
    }
    
    if leftBracketsValid.count > 0 {
        return false
    }else {
        return true
    }
}


//方案2
 func isValid1(_ s: String) -> Bool {
    //声明一个栈
    var stack = [Character]();
    //遍历字符
    for c:Character in s {
        
        if (c == "{") || (c == "(") || (c == "[") {
            stack.append(c);
        } else {
            if stack.isEmpty {
                return false;
            }
            let left:Character = stack.removeLast();
            
            if left == "{" && c != "}" {
                return false;
            }
            if left == "[" && c != "]" {
                return false;
            }
            if left == "(" && c != ")" {
                return false;
            }
        }
    }
    return stack.isEmpty;
    }


 func isValid2(_ str:String) -> Bool{
    
    //1判断如果字符串长度为单数,不可能有效,因为括号必须成对出现
    if str.count % 2 != 0 || str.count < 2 {
        return false
    }
    
    //2.第一个字符不能是右边的括号类型:[")","]","}"]
    let first = str.first!
    
    if (first==")") || (first == "]") || (first == "}") {
        return false
    }
    
    var stack = [Character]()
    let keyMap:[Character:Character] = [")":"(","]":"[","}":"{"]
    
    for c:Character in str {
        
        if (c == "{") || (c == "(") || (c == "[") {
            stack.append(c);
        }else{
            if stack.isEmpty {
                return false
            }else{
                
                let left:Character = stack.removeLast();
                
                if keyMap[c] != left {
                    return false
                }
            }
        }
    }
    if stack.count > 0 {
        return false
    }else {
        return true
    }
}
