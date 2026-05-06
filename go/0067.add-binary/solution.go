// Created by ericklucioh at 2026/05/05 21:26
// leetgo: dev
// https://leetcode.com/problems/add-binary/

package main

import (
	"bufio"
	"fmt"
	"os"

	. "github.com/j178/leetgo/testutils/go"
)

// @lc code=begin

func addBinary(a string, b string) string {
    
}

// @lc code=end

func main() {
	stdin := bufio.NewReader(os.Stdin)
	a := Deserialize[string](ReadLine(stdin))
	b := Deserialize[string](ReadLine(stdin))
	ans := addBinary(a, b)

	fmt.Println("\noutput:", Serialize(ans))
}
