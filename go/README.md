# Go LeetCode Cheat Sheet

Practical reference for Go standard-library tools that show up often in LeetCode problems.
The goal here is not to teach Go from scratch. The goal is to give you the shortest path from
"I remember the package name" to "I can write the solution now".
Each example shows the input state first and the resulting state or value after the operation.

## Math

Use `math` when the problem needs floating-point helpers or numeric constants.

- `Abs`: absolute value for floats.
- `Max` and `Min`: compare two `float64` values.
- `Sqrt`: square root.
- `Pow`: power with floating-point values.
- `Ceil`, `Floor`, `Round`: rounding helpers.
- `Log`: natural logarithm.
- `Pow10`: `10^n` for decimal-related math.

```go
import "math"

func exampleMath() {
	beforeAbs := -3.5
	afterAbs := math.Abs(beforeAbs) // 3.5

	beforeMax, beforeMin := 2.0, 7.0
	afterMax := math.Max(beforeMax, beforeMin) // 7
	afterMin := math.Min(beforeMax, beforeMin) // 2

	beforeSqrt := 16.0
	afterSqrt := math.Sqrt(beforeSqrt) // 4

	beforePowBase, beforePowExp := 2.0, 5.0
	afterPow := math.Pow(beforePowBase, beforePowExp) // 32

	beforeCeil := 2.1
	afterCeil := math.Ceil(beforeCeil) // 3

	beforeFloor := 2.9
	afterFloor := math.Floor(beforeFloor) // 2

	beforeRound := 2.5
	afterRound := math.Round(beforeRound) // 3

	beforeLog := math.E
	afterLog := math.Log(beforeLog) // 1

	beforePow10 := 3
	afterPow10 := math.Pow10(beforePow10) // 1000

	_, _, _, _, _, _, _, _, _, _, _, _, _ = beforeAbs, afterAbs, afterMax, afterMin, afterSqrt, afterPow, afterCeil, afterFloor, afterRound, afterLog, afterPow10, beforeMax, beforeMin
}
```

Use `math/bits` for bit tricks, popcount, and rotations.

- `OnesCount`: number of `1` bits.
- `LeadingZeros`: leading zero count.
- `TrailingZeros`: trailing zero count.
- `Len`: bit width needed for the value.
- `RotateLeft`: rotate bits left.

```go
import "math/bits"

func exampleBits() {
	before := uint(13) // 1101
	afterOnes := bits.OnesCount(before)       // 3
	afterLeading := bits.LeadingZeros(before) // depends on word size
	afterTrailing := bits.TrailingZeros(before) // 0
	afterLen := bits.Len(before)              // 4
	afterRotate := bits.RotateLeft(before, 1) // 26 on 32/64-bit words
	_, _, _, _, _ = afterOnes, afterLeading, afterTrailing, afterLen, afterRotate
}
```

Use `math/rand` when you want quick random inputs for local debugging.

```go
import (
	"fmt"
	"math/rand"
)

func exampleRand() {
	before := "seeded RNG with unknown output"
	r := rand.New(rand.NewSource(1))
	afterInt := r.Intn(10)      // deterministic for the seed above
	afterRange := r.Intn(100)+1 // 1..100
	afterFloat := r.Float64()   // [0, 1)
	_ = before
	fmt.Println(afterInt, afterRange, afterFloat)
}
```

## Arrays and slices

In Go, most LeetCode "array" problems are solved with slices.

- Built-ins: `len`, `cap`, `append`, `copy`.
- `slices`: `Clone`, `Sort`, `SortFunc`, `BinarySearch`, `Delete`, `Insert`, `Contains`, `Index`.
- `sort`: `sort.Ints`, `sort.Strings`, `sort.Slice`.

```go
import (
	"fmt"
	"slices"
	"sort"
)

func exampleSlices() {
	before := []int{3, 1, 4}
	afterAppend := append(before, 2) // [3 1 4 2]

	tmp := make([]int, len(afterAppend))
	copy(tmp, afterAppend) // same values as afterAppend

	cloned := slices.Clone(afterAppend)
	slices.Sort(cloned)
	// before: [3 1 4 2]
	// after : [1 2 3 4]

	idx, found := slices.BinarySearch(cloned, 3) // 2, true
	containsFour := slices.Contains(cloned, 4)    // true
	indexOfTwo := slices.Index(cloned, 2)         // 1

	afterDelete := slices.Delete(cloned, 1, 2) // [1 3 4]
	afterInsert := slices.Insert(afterDelete, 1, 9, 8) // [1 9 8 3 4]

	sort.Ints(afterAppend) // [1 2 3 4]
	sort.Strings([]string{"b", "a"})
	sort.Slice(afterAppend, func(i, j int) bool {
		return afterAppend[i] < afterAppend[j]
	})

	_, _, _, _ = tmp, idx, found, containsFour
	_ = indexOfTwo
	_ = afterInsert
}
```

`slices.SortFunc` is useful when the natural order is not enough.

```go
import "slices"

func exampleSortFunc() {
	type pair struct {
		value int
		index int
	}

	before := []pair{{3, 0}, {1, 1}, {2, 2}}
	items := slices.Clone(before)
	slices.SortFunc(items, func(a, b pair) int {
		if a.value != b.value {
			return a.value - b.value
		}
		return a.index - b.index
	})
	// before: [{3 0} {1 1} {2 2}]
	// after : [{1 1} {2 2} {3 0}]
	_ = before
}
```

## Strings

- `strings`: `Contains`, `Count`, `HasPrefix`, `HasSuffix`, `Index`, `LastIndex`, `ReplaceAll`, `Split`, `Join`, `Repeat`, `TrimSpace`, `Fields`, `ToLower`, `ToUpper`, `NewReader`.
- `strconv`: `Atoi`, `Itoa`, `ParseInt`, `FormatInt`.
- `unicode`: `IsLetter`, `IsDigit`, `IsSpace`, `ToLower`, `ToUpper`.
- `bytes`: useful when building strings efficiently with `Buffer`.

```go
import (
	"bytes"
	"fmt"
	"strconv"
	"strings"
	"unicode"
)

func exampleStrings() {
	before := "  Hello, LeetCode  "
	afterContains := strings.Contains(before, "Leet") // true
	afterCount := strings.Count(before, "e")
	afterPrefix := strings.HasPrefix(before, "  He")
	afterSuffix := strings.HasSuffix(before, "de  ")
	afterIndex := strings.Index(before, "Code")
	afterLastIndex := strings.LastIndex(before, "e")
	afterReplace := strings.ReplaceAll(before, "Leet", "Go")
	afterSplit := strings.Split("a,b,c", ",")
	afterJoin := strings.Join([]string{"a", "b"}, "-")
	afterRepeat := strings.Repeat("ab", 3)
	afterTrim := strings.TrimSpace(before)
	afterFields := strings.Fields(" a  b   c ")
	afterLower := strings.ToLower("AbC")
	afterUpper := strings.ToUpper("AbC")

	beforeInt := "123"
	afterInt, _ := strconv.Atoi(beforeInt)
	afterItoa := strconv.Itoa(456)
	afterParseInt, _ := strconv.ParseInt("1010", 2, 64)
	afterFormatInt := strconv.FormatInt(255, 16)

	afterLetter := unicode.IsLetter('a')
	afterDigit := unicode.IsDigit('9')
	afterSpace := unicode.IsSpace(' ')
	afterLowerRune := unicode.ToLower('A')
	afterUpperRune := unicode.ToUpper('a')

	var b bytes.Buffer
	beforeBuilder := ""
	b.WriteString("leet")
	b.WriteString("code")
	afterBuilder := b.String()

	_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ = before, afterContains, afterCount, afterPrefix, afterSuffix, afterIndex, afterLastIndex, afterReplace, afterSplit, afterJoin, afterRepeat, afterTrim, afterFields, afterLower, afterUpper, beforeInt, afterInt, afterItoa
	_, _, _, _, _ = afterParseInt, afterFormatInt, afterLetter, afterDigit, afterSpace
	_, _, _ = afterLowerRune, afterUpperRune, beforeBuilder
	_ = afterBuilder
}
```

`strings.NewReader` is handy when a function expects an `io.Reader`.

```go
import (
	"fmt"
	"io"
	"strings"
)

func exampleNewReader() {
	before := "hello"
	r := strings.NewReader(before)
	after, _ := io.ReadAll(r)
	fmt.Println(before, string(after))
}
```

## Common LeetCode patterns

- Two pointers: use `l` and `r` indices over a slice or string.
- Sliding window: keep counts with a map or a helper array.
- Prefix sums: store running totals in a slice.
- Sorting + binary search: combine `slices.Sort` with `slices.BinarySearch`.
- String parsing: combine `strings`, `strconv`, and `unicode`.

```go
import "slices"

func twoPointers(nums []int) int {
	// before: nums = [2 3 4 8]
	// after : returns the sum of values taken from the left side while shrinking from both ends
	l, r := 0, len(nums)-1
	sum := 0
	for l < r {
		if nums[l]+nums[r] > 10 {
			r--
		} else {
			sum += nums[l]
			l++
		}
	}
	return sum
}

func slidingWindow(nums []int, k int) int {
	// before: nums = [1 2 3 4], k = 2
	// after : best = 7 from the window [3 4]
	window := 0
	best := 0
	for i := 0; i < len(nums); i++ {
		window += nums[i]
		if i >= k {
			window -= nums[i-k]
		}
		if i >= k-1 && window > best {
			best = window
		}
	}
	return best
}

func prefixSum(nums []int) []int {
	// before: nums = [2 4 1 3]
	// after : prefix = [0 2 6 7 10]
	prefix := make([]int, len(nums)+1)
	for i := range nums {
		prefix[i+1] = prefix[i] + nums[i]
	}
	return prefix
}

func binarySearchExample(nums []int, target int) bool {
	// before: nums = [4 1 3 2], target = 3
	// after : sorted nums = [1 2 3 4], found = true
	slices.Sort(nums)
	_, found := slices.BinarySearch(nums, target)
	return found
}
```

## Must know for LeetCode

### `container/heap`

Priority queue / min-heap / max-heap patterns.

```go
import "container/heap"

type IntHeap []int

func (h IntHeap) Len() int            { return len(h) }
func (h IntHeap) Less(i, j int) bool  { return h[i] < h[j] }
func (h IntHeap) Swap(i, j int)       { h[i], h[j] = h[j], h[i] }
func (h *IntHeap) Push(x any)         { *h = append(*h, x.(int)) }
func (h *IntHeap) Pop() any {
	old := *h
	n := len(old)
	x := old[n-1]
	*h = old[:n-1]
	return x
}

func exampleHeap() int {
	// before: [3 1 2]
	h := &IntHeap{3, 1, 2}
	heap.Init(h)
	heap.Push(h, 0)
	after := heap.Pop(h).(int) // 0
	return after
}
```

### `container/list`

Rare, but useful for deque-like behavior or linked structures.

```go
import "container/list"

func exampleList() int {
	// before: empty list
	l := list.New()
	l.PushBack(1)
	l.PushFront(0)
	after := l.Front().Value.(int) // 0
	return after
}
```

### `slices`

- `Delete`: remove a range.
- `DeleteFunc`: remove values matching a predicate.
- `Compact`: remove consecutive duplicates.
- `Compare`: compare two slices lexicographically.
- `Equal`: test element-by-element equality.
- `SortFunc`: custom ordering.

```go
import (
	"fmt"
	"slices"
)

func exampleMoreSlices() {
	// before: [1 2 2 3 4]
	nums := []int{1, 2, 2, 3, 4}
	nums = slices.Delete(nums, 1, 2) // after: [1 2 3 4]
	nums = slices.DeleteFunc(nums, func(v int) bool {
		return v == 4
	}) // after: [1 2 3]
	nums = slices.Compact([]int{1, 1, 2, 2, 3}) // after: [1 2 3]
	fmt.Println(slices.Compare([]int{1, 2}, []int{1, 3})) // -1
	fmt.Println(slices.Equal([]int{1, 2}, []int{1, 2}))   // true
}
```

### `sort`

- `Search`: binary search with a custom comparator.
- `SearchInts`: search sorted ints.

```go
import "sort"

func exampleSortSearch(nums []int) int {
	// before: nums = [4 1 3 2]
	sort.Ints(nums) // after: [1 2 3 4]
	i := sort.SearchInts(nums, 3) // 2
	j := sort.Search(len(nums), func(k int) bool {
		return nums[k] >= 3
	}) // 2
	_, _ = i, j
	return j
}
```

### `strings.Builder`

Efficient string construction.

```go
import (
	"fmt"
	"strings"
)

func exampleBuilder() string {
	// before: "" + "" + ""
	var b strings.Builder
	b.WriteString("leet")
	b.WriteString("code")
	after := b.String() // leetcode
	return after
}
```

### `bytes.Buffer`

Another option for building strings or buffered text.

```go
import (
	"bytes"
	"fmt"
)

func exampleBuffer() string {
	// before: "" + "" + ""
	var b bytes.Buffer
	b.WriteString("leet")
	b.WriteByte('-')
	b.WriteString("code")
	after := b.String() // leet-code
	return after
}
```

### `unicode/utf8`

Rune-aware string iteration and validation.

```go
import (
	"fmt"
	"unicode/utf8"
)

func exampleUTF8(s string) {
	// before: s = "hé"
	// after : valid = true, first rune = 'h', rune count = 2
	fmt.Println(utf8.ValidString(s))
	r, size := utf8.DecodeRuneInString(s)
	fmt.Println(r, size)
	fmt.Println(utf8.RuneCountInString(s))
}
```

### `strconv`

- `ParseBool`: parse boolean text.
- `FormatBool`: format boolean text.
- Integer helpers are also common when converting between numbers and strings.

```go
import (
	"fmt"
	"strconv"
)

func exampleStrconv() {
	beforeBool := "true"
	b, _ := strconv.ParseBool(beforeBool) // after: true
	fmt.Println(b)
	fmt.Println(strconv.FormatBool(false)) // before: false -> after: "false"
	beforeInt := "42"
	n, _ := strconv.Atoi(beforeInt) // after: 42
	fmt.Println(n)
	fmt.Println(strconv.Itoa(42)) // before: 42 -> after: "42"
}
```

### `math/big`

Use it when the problem involves arbitrarily large integers.

```go
import (
	"fmt"
	"math/big"
)

func exampleBig() {
	// before: 123 + 456
	a := big.NewInt(123)
	b := big.NewInt(456)
	sum := new(big.Int).Add(a, b)
	fmt.Println(sum.String()) // after: 579
}
```

### `bufio`

Fast input/output for local runs.

```go
import (
	"bufio"
	"fmt"
	"os"
)

func exampleBufio() {
	// before: stdin contains one token
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var s string
	fmt.Fscan(in, &s)
	fmt.Fprintln(out, s)
	// after: the same token is written back to stdout
}
```

## Nice to know

### `math/rand`

Quick random generation for debugging.

```go
import (
	"fmt"
	"math/rand"
	"time"
)

func exampleDebugRandom() {
	rand.Seed(time.Now().UnixNano())
	before := "unknown"
	after := rand.Intn(100)
	fmt.Println(before, after)
}
```

### `reflect`

Usually avoid unless the problem explicitly benefits from it.

```go
import (
	"fmt"
	"reflect"
)

func exampleReflect(v any) {
	before := v
	after := reflect.TypeOf(v)
	fmt.Println(before, after)
}
```

### `sync`

Rarely needed in LeetCode, but sometimes useful in interview-style extensions.

```go
import (
	"fmt"
	"sync"
)

func exampleSync() {
	// before: value = 0
	var mu sync.Mutex
	value := 0

	mu.Lock()
	value++
	mu.Unlock()

	after := value // 1
	fmt.Println(after)
}
```
