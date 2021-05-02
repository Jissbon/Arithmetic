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
        
        
        let bbb = ValidBrackets.isValid2("{[]}")
        
        if bbb {
            print("成对")
        }else{
            print("不成对")
        }
    }
}


