// Created by ericklucioh at 2026/05/05 21:26
// leetgo: dev
// https://leetcode.com/problems/plus-one/

package main

import (
	"bufio"
	"fmt"
	"os"

	. "github.com/j178/leetgo/testutils/go"
)

// @lc code=begin

func plusOne(digits []int) (ans []int) {

	return
}

// @lc code=end

func main() {
	stdin := bufio.NewReader(os.Stdin)
	digits := Deserialize[[]int](ReadLine(stdin))
	ans := plusOne(digits)

	fmt.Println("\noutput:", Serialize(ans))
}
