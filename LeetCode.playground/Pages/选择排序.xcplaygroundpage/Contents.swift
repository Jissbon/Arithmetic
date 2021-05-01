

/*
 选择排序法是一种不稳定的排序算法。
 它的工作原理是每一次从待排序的数据元素中选出最小（或最大）的一个元素，
 存放在序列的起始位置，然后，再从剩余未排序元素中继续寻找最小（大）元素，
 然后放到已排序序列的末尾。以此类推，直到全部待排序的数据元素排完。
 */



//var nums = [5,4,3,2,1];
var nums = [5 ,8 ,5 ,2 ,9];

func p_selectSort(array: inout [Int]) {

    
    for i in 0..<(array.count - 1) {
    
        var min = i // 表示有序区排了多少个元素了,
        
        //注意边界,是遍历到最后一个
        for j in (i + 1)...(array.count - 1) {

            if array[min] > array[j] {
                min = j;
            }
        }
        // 如果 i 与 min 不相等,
        // 说明 当前遍历到的那个位置的数字,在与后段数字对比的时候,不是最小的,那么记录到的后端最小数字与i位调换.
        if i != min { //防止相同位置交换操作
            array.swapAt(min, i)
        }

    }
}

 p_selectSort(array: &nums)

print(nums)



/*
 开始:
 nums = [5,4,3,2,1];
 i = 0
 记录 min = i = 0
 
 j = 0 ,
 判断 nums[min] = 5 ,满足大于 nums[j] = 5 , 不满足
 则记 min = 0
 
 j++ = 1;
 判断 nums[min] = 5 ,满足大于 nums[j] = 4 , 满足
 则记 min = j = 1
 
 j++ = 2;
 判断 nums[min] = 4 ,满足大于 nums[j] = 3 , 满足
 则记 min = j = 2
 
 j++ = 3;
 判断 nums[min] = 3 ,满足大于 nums[j] = 2 , 满足
 则记 min = j = 3
 
 j++ = 4;
 判断 nums[min] = 2 ,满足大于 nums[j] = 1 , 满足
 则记 min = j = 1
 
 j++ = 5;
 因为 j = 5 > array.count - 1 ,所以结束 j的次轮循环
 
 此时 i = 0, j = 4;
 
 数组对调 0 位 与 4 位的数字;
 
 i循环进入 i++ 操作
 
 ....
 
 */

//结论:选择排序算法的时间复杂度是:O(n^2)
