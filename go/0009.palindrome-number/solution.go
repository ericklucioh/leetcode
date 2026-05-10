// Created by ericklucioh at 2026/05/05 21:26
// leetgo: dev
// https://leetcode.com/problems/palindrome-number/

package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	. "github.com/j178/leetgo/testutils/go"
)

// @lc code=begin

func isPalindrome(x int) bool {
    strings := strconv.Itoa(x)
	fmt.Println(strings)
	
	return false
}

// @lc code=end

func main() {
	stdin := bufio.NewReader(os.Stdin)
	x := Deserialize[int](ReadLine(stdin))
	ans := isPalindrome(x)

	fmt.Println("\noutput:", Serialize(ans))
}
