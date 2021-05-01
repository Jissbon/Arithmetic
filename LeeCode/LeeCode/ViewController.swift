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
        
        
        let a1 = ["a","abc","cc","cba","fuck","f"]
        
        let prefix = LongPreFix.longestCommonPrefix2(a1)
        print("prefix:\(prefix)")
    }
}

