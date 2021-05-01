
/*
 希尔排序(Shell's Sort)在插入排序算法的基础上进行了改进，算法的时间复杂度与前面几种算法相比有较大的改进。
 
 其算法的基本思想是：先将待排记录序列分割成为若干子序列分别进行插入排序，待整个序列中的记录"基本有序"时，再对全体记录进行一次直接插入排序。*/



var nums = [4,2,8,0,5,1,9,6,11]

func shellSort(unsortedArray: inout [Int]) -> [Int] {
    
    //排除数组元素为0的情况
    guard unsortedArray.count > 1 else {
        return []
    }
    
    //将数组分割成两半.左边是 0... unsortedArray.count/2,右边是  unsortedArray.count/2...unsortedArray.count-1
    var gap = unsortedArray.count / 2
    while gap > 0 {
        for i in gap ..< unsortedArray.count {
            
            var formerIndex = i - gap
            
            while formerIndex >= 0 {
                print("formerIndex = \(formerIndex),满足formerIndex > 0 ,gap = \(gap)")
                if unsortedArray[formerIndex] > unsortedArray[formerIndex+gap] {
                    unsortedArray.swapAt(formerIndex, formerIndex+gap)
                    print("i=\(i),nums[\(formerIndex)] > nums[\(formerIndex+gap)],成立,交换位置:nums\(unsortedArray)")
                }
                print("i=\(i),nums[\(formerIndex)] > nums[\(formerIndex+gap)],不成立,不交换位置:nums\(unsortedArray)")
                formerIndex -= gap
            }
        }
        gap = gap / 2
    }
    return unsortedArray
}


let sortArray = shellSort(unsortedArray: &nums)


print(sortArray)

/*
 formerIndex = 0,满足formerIndex > 0 ,gap = 3
 i=3,nums[0] > nums[3],成立,交换位置:nums[0, 2, 8, 4, 5, 1, 9]
 i=3,nums[0] > nums[3],不成立,不交换位置:nums[0, 2, 8, 4, 5, 1, 9]
 formerIndex = 1,满足formerIndex > 0 ,gap = 3
 i=4,nums[1] > nums[4],不成立,不交换位置:nums[0, 2, 8, 4, 5, 1, 9]
 formerIndex = 2,满足formerIndex > 0 ,gap = 3
 i=5,nums[2] > nums[5],成立,交换位置:nums[0, 2, 1, 4, 5, 8, 9]
 i=5,nums[2] > nums[5],不成立,不交换位置:nums[0, 2, 1, 4, 5, 8, 9]
 formerIndex = 3,满足formerIndex > 0 ,gap = 3
 i=6,nums[3] > nums[6],不成立,不交换位置:nums[0, 2, 1, 4, 5, 8, 9]
 formerIndex = 0,满足formerIndex > 0 ,gap = 3
 i=6,nums[0] > nums[3],不成立,不交换位置:nums[0, 2, 1, 4, 5, 8, 9]
 formerIndex = 0,满足formerIndex > 0 ,gap = 1
 i=1,nums[0] > nums[1],不成立,不交换位置:nums[0, 2, 1, 4, 5, 8, 9]
 formerIndex = 1,满足formerIndex > 0 ,gap = 1
 i=2,nums[1] > nums[2],成立,交换位置:nums[0, 1, 2, 4, 5, 8, 9]
 i=2,nums[1] > nums[2],不成立,不交换位置:nums[0, 1, 2, 4, 5, 8, 9]
 formerIndex = 0,满足formerIndex > 0 ,gap = 1
 i=2,nums[0] > nums[1],不成立,不交换位置:nums[0, 1, 2, 4, 5, 8, 9]
 formerIndex = 2,满足formerIndex > 0 ,gap = 1
 i=3,nums[2] > nums[3],不成立,不交换位置:nums[0, 1, 2, 4, 5, 8, 9]
 formerIndex = 1,满足formerIndex > 0 ,gap = 1
 i=3,nums[1] > nums[2],不成立,不交换位置:nums[0, 1, 2, 4, 5, 8, 9]
 formerIndex = 0,满足formerIndex > 0 ,gap = 1
 i=3,nums[0] > nums[1],不成立,不交换位置:nums[0, 1, 2, 4, 5, 8, 9]
 formerIndex = 3,满足formerIndex > 0 ,gap = 1
 i=4,nums[3] > nums[4],不成立,不交换位置:nums[0, 1, 2, 4, 5, 8, 9]
 formerIndex = 2,满足formerIndex > 0 ,gap = 1
 i=4,nums[2] > nums[3],不成立,不交换位置:nums[0, 1, 2, 4, 5, 8, 9]
 formerIndex = 1,满足formerIndex > 0 ,gap = 1
 i=4,nums[1] > nums[2],不成立,不交换位置:nums[0, 1, 2, 4, 5, 8, 9]
 formerIndex = 0,满足formerIndex > 0 ,gap = 1
 i=4,nums[0] > nums[1],不成立,不交换位置:nums[0, 1, 2, 4, 5, 8, 9]
 formerIndex = 4,满足formerIndex > 0 ,gap = 1
 i=5,nums[4] > nums[5],不成立,不交换位置:nums[0, 1, 2, 4, 5, 8, 9]
 formerIndex = 3,满足formerIndex > 0 ,gap = 1
 i=5,nums[3] > nums[4],不成立,不交换位置:nums[0, 1, 2, 4, 5, 8, 9]
 formerIndex = 2,满足formerIndex > 0 ,gap = 1
 i=5,nums[2] > nums[3],不成立,不交换位置:nums[0, 1, 2, 4, 5, 8, 9]
 formerIndex = 1,满足formerIndex > 0 ,gap = 1
 i=5,nums[1] > nums[2],不成立,不交换位置:nums[0, 1, 2, 4, 5, 8, 9]
 formerIndex = 0,满足formerIndex > 0 ,gap = 1
 i=5,nums[0] > nums[1],不成立,不交换位置:nums[0, 1, 2, 4, 5, 8, 9]
 formerIndex = 5,满足formerIndex > 0 ,gap = 1
 i=6,nums[5] > nums[6],不成立,不交换位置:nums[0, 1, 2, 4, 5, 8, 9]
 formerIndex = 4,满足formerIndex > 0 ,gap = 1
 i=6,nums[4] > nums[5],不成立,不交换位置:nums[0, 1, 2, 4, 5, 8, 9]
 formerIndex = 3,满足formerIndex > 0 ,gap = 1
 i=6,nums[3] > nums[4],不成立,不交换位置:nums[0, 1, 2, 4, 5, 8, 9]
 formerIndex = 2,满足formerIndex > 0 ,gap = 1
 i=6,nums[2] > nums[3],不成立,不交换位置:nums[0, 1, 2, 4, 5, 8, 9]
 formerIndex = 1,满足formerIndex > 0 ,gap = 1
 i=6,nums[1] > nums[2],不成立,不交换位置:nums[0, 1, 2, 4, 5, 8, 9]
 formerIndex = 0,满足formerIndex > 0 ,gap = 1
 i=6,nums[0] > nums[1],不成立,不交换位置:nums[0, 1, 2, 4, 5, 8, 9]
 */

//总结 : 希尔排序的时间复杂度:O(n^(1.3—2))
