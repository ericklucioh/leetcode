# Created by ericklucioh at 2026/05/05 21:24
# leetgo: dev
# https://leetcode.com/problems/two-sum/

from typing import *
from leetgo_py import *

# @lc code=begin

class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        len = len(nums)
        for num in nums:
            index = nums.index(num)
            j = index +1
            while True:
                if num + nums[j + 1] == target:
                    return [nums[index], nums[j]]
                j = j +1
                if j == len:
                    break
        return []
        

# @lc code=end

if __name__ == "__main__":
    nums: List[int] = deserialize("List[int]", read_line())
    target: int = deserialize("int", read_line())
    ans = Solution().twoSum(nums, target)
    print("\noutput:", serialize(ans, "integer[]"))
