// Created by ericklucioh at 2026/05/05 21:26
// leetgo: dev
// https://leetcode.com/problems/pascals-triangle/

package main

import (
	"bufio"
	"fmt"
	"os"

	. "github.com/j178/leetgo/testutils/go"
)

// @lc code=begin

func generate(numRows int) (ans [][]int) {

	return
}

// @lc code=end

func main() {
	stdin := bufio.NewReader(os.Stdin)
	numRows := Deserialize[int](ReadLine(stdin))
	ans := generate(numRows)

	fmt.Println("\noutput:", Serialize(ans))
}
