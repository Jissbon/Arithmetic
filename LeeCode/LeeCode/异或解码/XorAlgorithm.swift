//
//  XorAlgorithm.swift
//  LeeCode
//
//  Created by 庞日富 on 2021/5/6.
//

import Foundation

class XorAlgorithm {
    static func decode(_ encoded: [Int], _ first: Int) -> [Int] {
        var arr = [first]
        for i in 0...encoded.count-1{
            let c = encoded[i] ^ arr[i]
            arr.append(c)
        }
        return arr
    }
}
