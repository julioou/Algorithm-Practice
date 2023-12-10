/*
 You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.

 Merge nums1 and nums2 into a single array sorted in non-decreasing order.

 The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.



 Example 1:

 Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
 Output: [1,2,2,3,5,6]
 Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
 The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.
 Example 2:

 Input: nums1 = [1], m = 1, nums2 = [], n = 0
 Output: [1]
 Explanation: The arrays we are merging are [1] and [].
 The result of the merge is [1].
 Example 3:

 Input: nums1 = [0], m = 0, nums2 = [1], n = 1
 Output: [1]
 Explanation: The arrays we are merging are [] and [1].
 The result of the merge is [1].
 Note that because m = 0, there are no elements in nums1. The 0 is only there to ensure the merge result can fit in nums1.

 Copyright ©️ 2023 LeetCode All rights reserved
 */

import Foundation


// MARK: - Merge Sorted Array

var t = [1,2,3,0,0,0]

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    let value = nums1[0..<m] + nums2[0..<n]
    nums1 = Array(value)
    nums1.sort()
}

merge(&t, 3, [2,5,6], 3)

print(t)


/*
 Given an integer array nums and an integer val, remove all occurrences of val in nums in-place. The order of the elements may be changed. Then return the number of elements in nums which are not equal to val.

 Consider the number of elements in nums which are not equal to val be k, to get accepted, you need to do the following things:

 Change the array nums such that the first k elements of nums contain the elements which are not equal to val. The remaining elements of nums are not important as well as the size of nums.
 Return k.
 Custom Judge:

 The judge will test your solution with the following code:

 int[] nums = [...]; // Input array
 int val = ...; // Value to remove
 int[] expectedNums = [...]; // The expected answer with correct length.
                             // It is sorted with no values equaling val.

 int k = removeElement(nums, val); // Calls your implementation

 assert k == expectedNums.length;
 sort(nums, 0, k); // Sort the first k elements of nums
 for (int i = 0; i < actualLength; i++) {
     assert nums[i] == expectedNums[i];
 }
 If all assertions pass, then your solution will be accepted.



 Example 1:

 Input: nums = [3,2,2,3], val = 3
 Output: 2, nums = [2,2,_,_]
 Explanation: Your function should return k = 2, with the first two elements of nums being 2.
 It does not matter what you leave beyond the returned k (hence they are underscores).
 Example 2:

 Input: nums = [0,1,2,2,3,0,4,2], val = 2
 Output: 5, nums = [0,1,4,0,3,_,_,_]
 Explanation: Your function should return k = 5, with the first five elements of nums containing 0, 0, 1, 3, and 4.
 Note that the five elements can be returned in any order.
 It does not matter what you leave beyond the returned k (hence they are underscores).
 */

// MARK: - Remove Element

var n = [0,1,2,2,3,0,4,2]

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    nums.removeAll(where: { $0 == val })
    return 0
}


removeElement(&n, 2)

print(n)

/*
 Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same. Then return the number of unique elements in nums.

 Consider the number of unique elements of nums to be k, to get accepted, you need to do the following things:

 Change the array nums such that the first k elements of nums contain the unique elements in the order they were present in nums initially. The remaining elements of nums are not important as well as the size of nums.
 Return k.
 Custom Judge:

 The judge will test your solution with the following code:

 int[] nums = [...]; // Input array
 int[] expectedNums = [...]; // The expected answer with correct length

 int k = removeDuplicates(nums); // Calls your implementation

 assert k == expectedNums.length;
 for (int i = 0; i < k; i++) {
     assert nums[i] == expectedNums[i];
 }
 If all assertions pass, then your solution will be accepted.



 Example 1:

 Input: nums = [1,1,2]
 Output: 2, nums = [1,2,_]
 Explanation: Your function should return k = 2, with the first two elements of nums being 1 and 2 respectively.
 It does not matter what you leave beyond the returned k (hence they are underscores).
 Example 2:

 Input: nums = [0,0,1,1,1,2,2,3,3,4]
 Output: 5, nums = [0,1,2,3,4,_,_,_,_,_]
 Explanation: Your function should return k = 5, with the first five elements of nums being 0, 1, 2, 3, and 4 respectively.
 It does not matter what you leave beyond the returned k (hence they are underscores).
 */

// MARK: - Remove Duplicates from Sorted Array

var dA = [0,0,1,1,1,2,2,3,3,4]
var ex = [0,1,2,3,4]
func removeDuplicates(_ nums: inout [Int]) -> Int {
    var newArray = Set<Int>()
    for num in nums {
        newArray.insert(num)
    }

    nums = Array(newArray)
    nums.sort()
    return newArray.count
}

removeDuplicates(&dA)

print(dA)

print(dA.count == ex.count)

print("########END")
/*
 Given an integer array nums sorted in non-decreasing order, remove some duplicates in-place such that each unique element appears at most twice. The relative order of the elements should be kept the same.

 Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the first part of the array nums. More formally, if there are k elements after removing the duplicates, then the first k elements of nums should hold the final result. It does not matter what you leave beyond the first k elements.

 Return k after placing the final result in the first k slots of nums.

 Do not allocate extra space for another array. You must do this by modifying the input array in-place with O(1) extra memory.

 Custom Judge:

 The judge will test your solution with the following code:

 int[] nums = [...]; // Input array
 int[] expectedNums = [...]; // The expected answer with correct length

 int k = removeDuplicates(nums); // Calls your implementation

 assert k == expectedNums.length;
 for (int i = 0; i < k; i++) {
     assert nums[i] == expectedNums[i];
 }
 If all assertions pass, then your solution will be accepted.



 Example 1:

 Input: nums = [1,1,1,2,2,3]
 Output: 5, nums = [1,1,2,2,3,_]
 Explanation: Your function should return k = 5, with the first five elements of nums being 1, 1, 2, 2 and 3 respectively.
 It does not matter what you leave beyond the returned k (hence they are underscores).
 Example 2:

 Input: nums = [0,0,1,1,1,1,2,3,3]
 Output: 7, nums = [0,0,1,1,2,3,3,_,_]
 Explanation: Your function should return k = 7, with the first seven elements of nums being 0, 0, 1, 1, 2, 3 and 3 respectively.
 It does not matter what you leave beyond the returned k (hence they are underscores).
 */

// MARK: - Remove Duplicates from Sorted Array II

var lv2 = [0,0,1,1,1,1,2,3,3]
let exLv2 = [0,0,1,1,2,3,3]

func removeDuplicatesMoreLV2(_ nums: inout [Int]) -> Int {
    var a2 = [Int]()
    var index = 0

    for element in nums {
        if index >= 2 {
            if element != a2[index - 2] {
                a2.append(element)
                index += 1
            }
            continue
        } else {
            a2.append(element)
            index += 1
        }
    }

    nums = a2
    return index
}

removeDuplicatesMoreLV2(&lv2)

print(lv2)
print(lv2.count == exLv2.count)

var lv22 = [1,1,1,2,2,3]
let exLv22 = [1,1,2,2,3]
removeDuplicatesMoreLV2(&lv22)

print(lv22)
print(lv22.count == exLv22.count)
print("########END")

/*
 Given an array nums of size n, return the majority element.

 The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.



 Example 1:

 Input: nums = [3,2,3]
 Output: 3
 Example 2:

 Input: nums = [2,2,1,1,1,2,2]
 Output: 2


 Constraints:

 n == nums.length
 1 <= n <= 5 * 104
 -109 <= nums[i] <= 109


 Follow-up: Could you solve the problem in linear time and in O(1) space?
 */

// MARK: - 169. Majority Element
var testM = [55,84,47,52,62,95,78,2,60,57,89,26,20,86,50,69,14,39,62,91,55,22,44,4,21,60,59,39,43,56,43,97,3,26,75,19,24,92,13,98,85,37,0,37,58,71,63,100,46,31,7,47,14,61,100,64,13,89,67,40,6,44,13,18,37,16,85,8,86,60,26,24,6,69,7,51,82,41,43,61,51,58,18,9,19,58,89,67,91,1,41,91,3,69,82,87,100,80,14,3,9,8,57,50,85,45,25,30,1,40,54,87,67,91,2,42,6,8,92,39,89,29,83,43,33,98,4,73,91,29,98,94,72,36,62,63,78,52,76,94,20,80,67,90,31,59,55,48,16,49,69,14,66,53,32,47,41,39,40,71,70,89,50,77,18,61,21,6,85,42,67,70,7,66,87,34,81,85,62,58,1,83,62,66,7,57,65,15,46,28,52,35,59,75,93,18,40,76,19,29,51,23,43,43,55,32,60,48,54,78,64,84,68,30,6,34,74,44,48,68,42,98,58,93,42,83,65,12,3,45,67,20,7,49,63,73,25,28,93,56,44,32,43,17,12,41,13,23,4,68,55,68,24,12,79,51,32,19,100,50,36,73,54,93,85,30,51,56,15,49,71,11,82,75,64,56,85,68,44,43,100,28,7,65,42,23,100,66,38,49,94,29,9,83,41,85,42,21,45,99,38,10,3,25,67,76,90,36,53,60,88,44,51,3,66,0,87,46,39,9,88,76,15,76,67,39,79,71,35,7,51,91,7,11,22,70,92,78,49,36,4,24,58,10,56,91,48,23,80,73,27,43,70,92,80,37,41,97,80,58,5,99,44,15,99,63,79,10,41,31,72,24,38,74,30,19,39,53,45,95,28,0,95,95,58,56,72,20,25,48,59,90,23,63,99,12,66,99,94,25,66,7,81,76,60,64,95,24,6,97,62,54,52,19,20,71,75,16,73,24,98,83,1,30,6,33,36,90,21,31,54,62,35,38,50,84,37,29,63,81,70,46,66,68,10,63,80,39,25,34,28,14,64,32,39,95,6,35,54,76,4,15,14,34,14,22,78,28,72,10,85,77,100,51,72,41,84,98,46,1,100,13,33,49,10,19,85,74,86,77,82,68,34,90,69,8,94,74,36,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42]

// Exceed limite time
func majorityElement2(_ nums: [Int]) -> Int {
    var m = 0

    for item in nums {
        let new = nums.filter { $0 == item }
        m = (new.count > m) ? new.count : m
    }
    return m
}

// much moerr simple
func majorityElement(_ nums: [Int]) -> Int {

    var candidate = 0, votes = 0
    nums.forEach {
        if votes == 0 {
            candidate = $0
        }
        votes += candidate == $0 ? 1 : -1
    }
    return candidate
}

let resultM = majorityElement(testM)

print(resultM)

print("########END")

/*
 Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.



 Example 1:

 Input: nums = [1,2,3,4,5,6,7], k = 3
 Output: [5,6,7,1,2,3,4]
 Explanation:
 rotate 1 steps to the right: [7,1,2,3,4,5,6]
 rotate 2 steps to the right: [6,7,1,2,3,4,5]
 rotate 3 steps to the right: [5,6,7,1,2,3,4]
 Example 2:

 Input: nums = [-1,-100,3,99], k = 2
 Output: [3,99,-1,-100]
 Explanation:
 rotate 1 steps to the right: [99,-1,-100,3]
 rotate 2 steps to the right: [3,99,-1,-100]

 */

// MARK: - 189. Rotate Array


func rotate(_ nums: inout [Int], _ k: Int) {
    var index = 1
    while index <= k {
        nums.insert(nums.last ?? 0, at: 0)
        nums.popLast()
        index += 1
    }
}
var r = [1,2,3,4,5,6,7]
var r2 = [-1,-100,3,99]
rotate(&r, 3)
print(r)
rotate(&r2, 2)
print(r2)
