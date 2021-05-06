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
        
        var nums = [0,1,12,3,12]
        MoveZero.moveZeroes(&nums)
        print(nums)
    }
}


