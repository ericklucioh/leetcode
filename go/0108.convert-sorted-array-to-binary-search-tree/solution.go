// Created by ericklucioh at 2026/05/05 21:26
// leetgo: dev
// https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/

package main

import (
	"bufio"
	"fmt"
	"os"

	. "github.com/j178/leetgo/testutils/go"
)

// @lc code=begin

func sortedArrayToBST(nums []int) (ans *TreeNode) {

	return
}

// @lc code=end

func main() {
	stdin := bufio.NewReader(os.Stdin)
	nums := Deserialize[[]int](ReadLine(stdin))
	ans := sortedArrayToBST(nums)

	fmt.Println("\noutput:", Serialize(ans))
}
