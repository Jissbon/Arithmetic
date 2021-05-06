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
        
        let nums = [1,3,5,6]
        
        let result = SearchInser.searchInsert(nums, 2)
        
        print(result)
    }
}


