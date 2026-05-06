// Created by ericklucioh at 2026/05/05 21:26
// leetgo: dev
// https://leetcode.com/problems/remove-duplicates-from-sorted-array/

package main

import (
	"bufio"
	"fmt"
	"os"

	. "github.com/j178/leetgo/testutils/go"
)

// @lc code=begin

func removeDuplicates(nums []int) (ans int) {

	return
}

// @lc code=end

func main() {
	stdin := bufio.NewReader(os.Stdin)
	nums := Deserialize[[]int](ReadLine(stdin))
	ans := removeDuplicates(nums)

	fmt.Println("\noutput:", Serialize(ans))
}
