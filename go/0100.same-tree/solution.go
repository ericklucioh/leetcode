// Created by ericklucioh at 2026/05/05 21:26
// leetgo: dev
// https://leetcode.com/problems/same-tree/

package main

import (
	"bufio"
	"fmt"
	"os"

	. "github.com/j178/leetgo/testutils/go"
)

// @lc code=begin

func isSameTree(p *TreeNode, q *TreeNode) bool {
    
}

// @lc code=end

func main() {
	stdin := bufio.NewReader(os.Stdin)
	p := Deserialize[*TreeNode](ReadLine(stdin))
	q := Deserialize[*TreeNode](ReadLine(stdin))
	ans := isSameTree(p, q)

	fmt.Println("\noutput:", Serialize(ans))
}
