// Created by ericklucioh at 2026/05/05 21:27
// leetgo: dev
// https://leetcode.com/problems/pascals-triangle-ii/

package main

import (
	"bufio"
	"fmt"
	"os"

	. "github.com/j178/leetgo/testutils/go"
)

// @lc code=begin

func getRow(rowIndex int) (ans []int) {

	return
}

// @lc code=end

func main() {
	stdin := bufio.NewReader(os.Stdin)
	rowIndex := Deserialize[int](ReadLine(stdin))
	ans := getRow(rowIndex)

	fmt.Println("\noutput:", Serialize(ans))
}
