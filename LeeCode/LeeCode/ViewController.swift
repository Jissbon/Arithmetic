//
//  ViewController.swift
//  LeeCode
//
//  Created by 庞日富 on 2021/5/1.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        let location = StrMethod.strStr("abcdefgjijklmnopqrst", "lmn")
//
//        print(location)
        
        var next = [-1,-1,-1,-1,-1,-1,-1]
        let str = "abcdefg"
        getNext(str, &next)
        
        
    }
    
    func getNext(_ str: String, _ next: inout [Int]) {
        let count = str.count
        if count == 0 {
            return
        }
        
        let str_array = Array(str)
        print(str_array)
        print(next)
        
        var i = 0
        var j = -1
        
        //这个做法的意义是?
        while i < count - 1 {
            if j == -1 || str_array[i] == str_array[j] {
                i += 1
                j += 1
                print(next)
                
                next[i] = j
                print(next)
            }else {
                j = next[j]
                print(next)
            }
        }
    }
    
}


