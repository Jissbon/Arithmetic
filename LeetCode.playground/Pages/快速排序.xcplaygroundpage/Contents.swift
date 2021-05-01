

//快速排序算法的基本思路:
//1.从排序数组中,取出一个数作为基准数
//2.将数组中,比这个数小的数放在数组的左边,比这个数打的数放在右边
//3.再对基准数的左右两边进行上述操作.

//快速排序,也称为分治法,
import UIKit

var numbers = [7,6,5,4,3,2,1]
var changes = 0
//快速排序
func quick_sort( s: inout [Int], l:Int, r:Int)
{
    if (l < r)
    {
        //定位数组的左边,右边,还有基准数,
        var i = l, j = r, x = s[l];
        
        while (i < j)
        {
            while(i < j && s[j] >= x) {
                j-=1;
            }
            s[i] = s[j] //此时 s[i] 被 x持有,所以不怕被替换掉.
            changes += 1
            
            while(i < j && s[i] < x){
                i+=1;
            }
            s[j] = s[i];
            changes += 1
        }
        s[i] = x;
        changes += 1
        print("Cchange\(changes): i=\(i),j=\(j),numbers=\(s),temp=\(x)")
        
        quick_sort(s: &s, l: l, r: i - 1); // 递归调用
        quick_sort(s: &s, l: i + 1, r: r);
    }
}



quick_sort(s: &numbers, l: 0, r: numbers.count-1)

print(numbers)


/*对数组的操作次数如下:
 Achange1: i=0,j=6,numbers=[1, 6, 5, 4, 3, 2, 1],temp=7
 Bchange2: i=6,j=6,numbers=[1, 6, 5, 4, 3, 2, 1],temp=7
 Cchange3: i=6,j=6,numbers=[1, 6, 5, 4, 3, 2, 7],temp=7
 Achange4: i=0,j=0,numbers=[1, 6, 5, 4, 3, 2, 7],temp=1
 Bchange5: i=0,j=0,numbers=[1, 6, 5, 4, 3, 2, 7],temp=1
 Cchange6: i=0,j=0,numbers=[1, 6, 5, 4, 3, 2, 7],temp=1
 Achange7: i=1,j=5,numbers=[1, 2, 5, 4, 3, 2, 7],temp=6
 Bchange8: i=5,j=5,numbers=[1, 2, 5, 4, 3, 2, 7],temp=6
 Cchange9: i=5,j=5,numbers=[1, 2, 5, 4, 3, 6, 7],temp=6
 Achange10: i=1,j=1,numbers=[1, 2, 5, 4, 3, 6, 7],temp=2
 Bchange11: i=1,j=1,numbers=[1, 2, 5, 4, 3, 6, 7],temp=2
 Cchange12: i=1,j=1,numbers=[1, 2, 5, 4, 3, 6, 7],temp=2
 Achange13: i=2,j=4,numbers=[1, 2, 3, 4, 3, 6, 7],temp=5
 Bchange14: i=4,j=4,numbers=[1, 2, 3, 4, 3, 6, 7],temp=5
 Cchange15: i=4,j=4,numbers=[1, 2, 3, 4, 5, 6, 7],temp=5
 Achange16: i=2,j=2,numbers=[1, 2, 3, 4, 5, 6, 7],temp=3
 Bchange17: i=2,j=2,numbers=[1, 2, 3, 4, 5, 6, 7],temp=3
 Cchange18: i=2,j=2,numbers=[1, 2, 3, 4, 5, 6, 7],temp=3
 */

//结论:快速排序的最坏运行情况是 O(n²)，比如说顺序数列的快排。但它的平摊期望时间是 O(nlogn)，且 O(nlogn) 记号中隐含的常数因子很小，比复杂度稳定等于 O(nlogn) 的归并排序要小很多。所以，对绝大多数顺序性较弱的随机数列而言，快速排序总是优于归并排序。
