// Created by ericklucioh at 2026/05/05 21:27
// leetgo: dev
// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

package main

import (
	"bufio"
	"fmt"
	"os"

	. "github.com/j178/leetgo/testutils/go"
)

// @lc code=begin

func maxProfit(prices []int) (ans int) {

	return
}

// @lc code=end

func main() {
	stdin := bufio.NewReader(os.Stdin)
	prices := Deserialize[[]int](ReadLine(stdin))
	ans := maxProfit(prices)

	fmt.Println("\noutput:", Serialize(ans))
}
