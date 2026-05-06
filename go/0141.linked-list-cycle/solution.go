// Created by ericklucioh at 2026/05/05 21:27
// leetgo: dev
// https://leetcode.com/problems/linked-list-cycle/

package main

import (
	"bufio"
	"fmt"
	"os"

	. "github.com/j178/leetgo/testutils/go"
)

// @lc code=begin

func hasCycle(head *ListNode) bool {
    
}

// @lc code=end

// Warning: this is a manual question, the generated test code may be incorrect.
func main() {
	stdin := bufio.NewReader(os.Stdin)
	head := Deserialize[*ListNode](ReadLine(stdin))
	pos := Deserialize[int](ReadLine(stdin))
	ans := hasCycle(head, pos)

	fmt.Println("\noutput:", Serialize(ans))
}
