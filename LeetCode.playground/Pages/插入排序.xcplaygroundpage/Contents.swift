

/*
 插入排序，一般也被称为直接插入排序。对于少量元素的排序，它是一个有效的算法,插入排序是一种最简单的排序方法;
 它的基本思想是将一个记录插入到已经排好序的有序表中，从而一个新的、记录数增1的有序表。
 在其实现过程使用双层循环，外层循环对除了第一个元素之外的所有元素，内层循环对当前元素前面有序表进行待插入位置查找，并进行移动
 */



var nums = [5,4,3,2,1];


func insertionSort( _ array: [Int]) -> [Int]{
    
    
    
    var preArray:Array<Int> = array //创建新数组等于原始数组,视作已经排序的数组
    
    let count = array.count //直接持有数组元素个数,减号个数获取方法的调用,
    
    for i in 1..<count { //从数组的第二位数字开始遍历
        
        var preIndex = i - 1 //preIndex 表示已经排序到了哪一个下标, 一开始是排序到了第0位;
        
        let current = array[i]; //取得已排序序列的右边第一位开始比较
        
        //把已排序的最右边的那位数字 和 已经排序过的序列中的数字进行对比,从右往左对比
        while preIndex >= 0 && preArray[preIndex] > current{
            
            //如果已排序序列中取出来的数字与右边的数字对比,比它大,则把这个数字的位置向右移动
            preArray[preIndex + 1] = preArray[preIndex]
            //然后再向左获取已排序序列中小一点的数字进行对比,直到发现比右边数字小的数,
            //或者直到左边已排序的序列中完全找不到比右边还小的数字
            preIndex -= 1
        }
        
        //把右边的数字插入到比它小的数的后面,或者插入在已排序序列的第一位.
        preArray[preIndex + 1] = current
    }
    
    return preArray
}


let newNums = insertionSort(nums)

print(newNums)

/*
 开始:
 nums = [5,4,3,2,1];
 i = 1
 
 创建已排序数组 preArray = [5,4,3,2,1] ,
 
 进入for循环:
 
 preIndex = i-1 = 0;
 preArray[preIndex] = 5; //视作被排序过的序列
 current = array[i] = 4

 进入 while循环:
 
 preIndex >= 0 满足 && preArray[0] = 5 > current = 4 满足
 preArray[1] = preArray[0] -> preArray = [5,5,3,2,1];
 preIndex -= 1 -> preIndex = -1
 
 while 循环第2次:
 preIndex >= 0 不满足 && preArray[-1] = 5 > current =4 不满足
 
 preArray[preIndex + 1] = current -> preArray[0] = current -> [4,5,3,2,1];
 
 //进如for循环第二次;
 ....
 
 */



