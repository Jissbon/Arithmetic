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
        
        
//        let nums = [-82,-70,-66,-49,-43,-29,-29,-14,-11,-6,-3,-3,1,2,10,12,13,15,15,17,21,26,26,28,28,29,31,33,34,36,43,46,46,47,48,49,52,55,55,56,57,61,62,65,69,71,74,76,77,79,83,84,86,93,94]
        
//        let nums = [-4,-2,-2,-2,0,1,2,2,2,3,3,4,4,6,6]
        
        let nums = [0,0,0]
        let sortNums = nums.sorted()

        print("sortNums:\(sortNums)")

        let result = ThreeSum.threeSum(sortNums)

        print("result\(result)")

        print("得到结果了")
        
        
      
    }
}


