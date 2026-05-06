# Go LeetCode Cheat Sheet

Quick reference for Go standard library tools that show up often in LeetCode problems.

## Math

- `math`: `Abs`, `Max`, `Min`, `Sqrt`, `Pow`, `Ceil`, `Floor`, `Round`, `Log`, `Pow10`
- `math/bits`: `OnesCount`, `LeadingZeros`, `TrailingZeros`, `Len`, `RotateLeft`
- `math/rand`: random tests or quick generation when needed

```go
import "math"

x := math.Abs(-3.5)
y := int(math.Sqrt(16))
```

## Arrays and slices

In Go, most LeetCode "array" problems are solved with slices.

- `len`, `cap`, `append`, `copy`
- `slices` package: `Clone`, `Sort`, `SortFunc`, `BinarySearch`, `Delete`, `Insert`, `Contains`, `Index`
- `sort` package: `sort.Ints`, `sort.Strings`, `sort.Slice`

```go
import "slices"

nums = slices.Clone(nums)
slices.Sort(nums)
idx, found := slices.BinarySearch(nums, target)
```

```go
import "sort"

sort.Slice(nums, func(i, j int) bool {
	return nums[i] < nums[j]
})
```

## Strings

- `strings`: `Contains`, `Count`, `HasPrefix`, `HasSuffix`, `Index`, `LastIndex`, `ReplaceAll`, `Split`, `Join`, `Repeat`, `TrimSpace`, `Fields`, `ToLower`, `ToUpper`, `NewReader`
- `strconv`: `Atoi`, `Itoa`, `ParseInt`, `FormatInt`
- `unicode`: `IsLetter`, `IsDigit`, `IsSpace`, `ToLower`, `ToUpper`
- `bytes`: useful when building strings efficiently with `Buffer`

```go
import (
	"strconv"
	"strings"
)

n, _ := strconv.Atoi("123")
s := strconv.Itoa(123)
parts := strings.Split("a,b,c", ",")
joined := strings.Join(parts, "-")
```

## Common LeetCode patterns

- Two pointers: `l`, `r` indices over a slice or string.
- Sliding window: use counters plus `strings` or `map`.
- Prefix sums: store running totals in a slice.
- Sorting + binary search: `slices.Sort` plus `slices.BinarySearch`.
- String parsing: combine `strings`, `strconv`, and `unicode`.

## Must know for LeetCode

- `container/heap`: priority queue / min-heap / max-heap patterns
- `container/list`: rare, but useful for deque-like behavior or linked structures
- `slices`: `Delete`, `DeleteFunc`, `Compact`, `Compare`, `Equal`, `SortFunc`
- `sort`: `Search`, `SearchInts`
- `strings.Builder`: efficient string construction
- `bytes.Buffer`: another option for building strings or buffered text
- `unicode/utf8`: rune-aware string iteration and validation
- `strconv`: `ParseBool`, `FormatBool`, plus the common integer helpers
- `math/big`: when the problem involves arbitrarily large integers
- `bufio`: fast input/output for local runs

## Nice to know

- `math/rand`: quick random generation for debugging
- `reflect`: usually avoid unless a problem explicitly benefits from it
- `sync`: rarely needed in LeetCode, but sometimes appears in interview-style extensions
