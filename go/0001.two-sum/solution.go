// Created by ericklucioh at 2026/05/05 21:09
// leetgo: dev
// https://leetcode.com/problems/two-sum/

package main

import (
	"bufio"
	"fmt"
	"os"

	. "github.com/j178/leetgo/testutils/go"
)

// @lc code=begin

func twoSum(nums []int, target int) (ans []int) {
	seen := make(map[int]int)

	for i, num := range nums {
		want := target - num

		if j, ok := seen[want]; ok {
			return []int{j, i}
		}

		seen[num] = i
	}

	return
}
// @lc code=end

func main() {
	stdin := bufio.NewReader(os.Stdin)
	nums := Deserialize[[]int](ReadLine(stdin))
	target := Deserialize[int](ReadLine(stdin))
	ans := twoSum(nums, target)

	fmt.Println("\noutput:", Serialize(ans))
}
