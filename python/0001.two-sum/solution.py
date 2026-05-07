# Created by ericklucioh at 2026/05/05 21:24
# leetgo: dev
# https://leetcode.com/problems/two-sum/

from typing import *
from leetgo_py import *

# @lc code=begin

class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        n = len(nums)
        for num in nums:
            index = nums.index(num)
            j = index +1
            while j < n:
                if num + nums[j] == target:
                    return [index, j]
                j = j +1
                if j == n:
                    break
        return []
        

# @lc code=end

if __name__ == "__main__":
    nums: List[int] = deserialize("List[int]", read_line())
    target: int = deserialize("int", read_line())
    ans = Solution().twoSum(nums, target)
    print("\noutput:", serialize(ans, "integer[]"))
