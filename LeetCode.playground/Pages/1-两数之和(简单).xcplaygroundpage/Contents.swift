

import Foundation

let nums = [2,7,11,15];
let target = 9;

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

    

    let count = nums.count-1;
    for i in 0...count {
        for j in i+1 ... count {
            
            let sum = nums[i] + nums[j];
            
            if sum == target {
                return [i,j];
            }
        }
       
    }
    
    return [0];
    
}

let nums2 = twoSum(nums, target);

print(nums2);


