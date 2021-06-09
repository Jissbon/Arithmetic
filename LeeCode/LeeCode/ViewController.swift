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
        
        let heights = [2,1,5,6,2,3]
        //let heights = [2,4]
        
        let res =  LargestRectangleArea.largestRectangleArea(heights)
        print(res)
        
    }
}




