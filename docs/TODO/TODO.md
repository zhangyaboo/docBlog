```
//You are given a 0-indexed array of positive integers nums. 
//
// A subarray of nums is called incremovable if nums becomes strictly 
//increasing on removing the subarray. For example, the subarray [3, 4] is an incremovable 
//subarray of [5, 3, 4, 6, 7] because removing this subarray changes the array [5, 
//3, 4, 6, 7] to [5, 6, 7] which is strictly increasing. 
//
// Return the total number of incremovable subarrays of nums. 
//
// Note that an empty array is considered strictly increasing. 
//
// A subarray is a contiguous non-empty sequence of elements within an array. 
//
// 
// Example 1: 
//
// 
//Input: nums = [1,2,3,4]
//Output: 10
//Explanation: The 10 incremovable subarrays are: [1], [2], [3], [4], [1,2], [2,
//3], [3,4], [1,2,3], [2,3,4], and [1,2,3,4], because on removing any one of 
//these subarrays nums becomes strictly increasing. Note that you cannot select an 
//empty subarray.
// 
//
// Example 2: 
//
// 
//Input: nums = [6,5,7,8]
//Output: 7
//Explanation: The 7 incremovable subarrays are: [5], [6], [5,7], [6,5], [5,7,8]
//, [6,5,7] and [6,5,7,8].
//It can be shown that there are only 7 incremovable subarrays in nums.
// 
//
// Example 3: 
//
// 
//Input: nums = [8,7,6,6]
//Output: 3
//Explanation: The 3 incremovable subarrays are: [8,7,6], [7,6,6], and [8,7,6,6]
//. Note that [8,7] is not an incremovable subarray because after removing [8,7] 
//nums becomes [6,6], which is sorted in ascending order but not strictly 
//increasing.
// 
//
// 
// Constraints: 
//
// 
// 1 <= nums.length <= 50 
// 1 <= nums[i] <= 50 
// 
//
// Related Topics 数组 双指针 二分查找 枚举 👍 13 👎 0


//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public int incremovableSubarrayCount(int[] nums) {
        int len=nums.length;
        for (int i = 0; i < len; i++) {
            for (int j = i; j <len ; j++) {
                if(i==0){
                    return isIncreasing(nums,j,len-1);
                }

            }
        }
    }
    private boolean isIncreasing(int[] ints,int begin ,int end){
        for (int i = begin; i < end+1; i++) {
            if(ints[i]>=ints[i+1])return false;
        }
        return true;
    }
}
//leetcode submit region end(Prohibit modification and deletion)
```





You are given a **0-indexed** integer array `nums` of **even** length and there is also an empty array `arr`. Alice and Bob decided to play a game where in every round Alice and Bob will do one move. The rules of the game are as follows:

- Every round, first Alice will remove the **minimum** element from `nums`, and then Bob does the same.
- Now, first Bob will append the removed element in the array `arr`, and then Alice does the same.
- The game continues until `nums` becomes empty.

Return *the resulting array* `arr`.



**Example 1:**

```
Input: nums = [5,4,2,3]
Output: [3,2,5,4]
Explanation: In round one, first Alice removes 2 and then Bob removes 3. Then in arr firstly Bob appends 3 and then Alice appends 2. So arr = [3,2].
At the begining of round two, nums = [5,4]. Now, first Alice removes 4 and then Bob removes 5. Then both append in arr which becomes [3,2,5,4].
```

**Example 2:**

```
Input: nums = [2,5]
Output: [5,2]
Explanation: In round one, first Alice removes 2 and then Bob removes 5. Then in arr firstly Bob appends and then Alice appends. So arr = [5,2].
```



**Constraints:**

- `2 <= nums.length <= 100`
- `1 <= nums[i] <= 100`
- `nums.length % 2 == 0`

Related Topics

数组

排序

模拟

堆（优先队列）

👍 12

👎 0
