// Created by ericklucioh at 2026/05/05 21:26
// leetgo: dev
// https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/

package main

import (
	"bufio"
	"fmt"
	"os"

	. "github.com/j178/leetgo/testutils/go"
)

// @lc code=begin

func strStr(haystack string, needle string) (ans int) {

	return
}

// @lc code=end

func main() {
	stdin := bufio.NewReader(os.Stdin)
	haystack := Deserialize[string](ReadLine(stdin))
	needle := Deserialize[string](ReadLine(stdin))
	ans := strStr(haystack, needle)

	fmt.Println("\noutput:", Serialize(ans))
}
