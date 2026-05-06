// Created by ericklucioh at 2026/05/05 21:27
// leetgo: dev
// https://leetcode.com/problems/valid-palindrome/

package main

import (
	"bufio"
	"fmt"
	"os"

	. "github.com/j178/leetgo/testutils/go"
)

// @lc code=begin

func isPalindrome(s string) bool {
    
}

// @lc code=end

func main() {
	stdin := bufio.NewReader(os.Stdin)
	s := Deserialize[string](ReadLine(stdin))
	ans := isPalindrome(s)

	fmt.Println("\noutput:", Serialize(ans))
}
