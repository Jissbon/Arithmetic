//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
func romanToInt(_ s: String) -> Int {
    
    let numMap = [
        "I":1,
        "V":5,
        "X":10,
        "L":50,
        "C":100,
        "D":500,
        "M":1000,
    ]
    
    
    var temp = 0
    
    if s.count < 1 {
        return 0
    }
    if s.count < 2 {
        return numMap[s]!
    }
    
    
    for index in s.indices {
        let key = s[index]
        let n1 = numMap["\(key)"]!
        
        let index2 = s.index(after: index)
        
        if s.indices.contains(index2) {
            let key2 = s[index2]
            let n2 = numMap["\(key2)"]!
            if  n1 >= n2 {
                temp += n1
            }else{
                temp -= n1
            }
        }else{
            temp += n1
        }
    }
    
    return temp
}
