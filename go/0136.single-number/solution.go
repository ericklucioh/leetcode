// Created by ericklucioh at 2026/05/05 21:27
// leetgo: dev
// https://leetcode.com/problems/single-number/

package main

import (
	"bufio"
	"fmt"
	"os"

	. "github.com/j178/leetgo/testutils/go"
)

// @lc code=begin

func singleNumber(nums []int) (ans int) {

	return
}

// @lc code=end

func main() {
	stdin := bufio.NewReader(os.Stdin)
	nums := Deserialize[[]int](ReadLine(stdin))
	ans := singleNumber(nums)

	fmt.Println("\noutput:", Serialize(ans))
}
