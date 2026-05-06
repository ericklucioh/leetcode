# Python LeetCode Cheat Sheet

Quick reference for Python standard-library tools that show up often in LeetCode problems.

## Math

- `math`: `abs`, `sqrt`, `ceil`, `floor`, `pow`, `gcd`, `inf`, `isfinite`
- `operator`: handy for small helpers like `itemgetter`
- `functools`: `reduce`, `lru_cache`

```python
import math

x = abs(-3.5)
y = math.sqrt(16)
z = math.gcd(12, 18)
```

## Arrays and lists

In Python, LeetCode "array" problems are usually plain `list`.

- Built-ins: `len`, `sum`, `min`, `max`, `sorted`, `reversed`, `enumerate`, `zip`, `range`
- `list` methods: `append`, `extend`, `insert`, `pop`, `remove`, `sort`, `reverse`
- `bisect`: `bisect_left`, `bisect_right`
- `heapq`: `heapify`, `heappush`, `heappop`, `nlargest`, `nsmallest`
- `itertools`: `accumulate`, `product`, `permutations`, `combinations`
- `collections`: `Counter`, `defaultdict`, `deque`

```python
from bisect import bisect_left

nums.sort()
idx = bisect_left(nums, target)
```

```python
from collections import Counter

freq = Counter(nums)
```

## Strings

- Built-ins: `str.join`, `str.split`, `str.strip`, `str.lower`, `str.upper`, `str.startswith`, `str.endswith`, `str.find`, `str.count`
- `string`: `ascii_lowercase`, `ascii_letters`, `digits`, `punctuation`
- `re`: regular expressions for parsing when simple methods are not enough
- `ord`, `chr`: convert between characters and integer codes

```python
s = "  hello world  "
parts = s.strip().split()
joined = "-".join(parts)
```

```python
code = ord("a")
ch = chr(code + 1)
```

## Common LeetCode patterns

- Two pointers: `l`, `r` indices on lists or strings.
- Sliding window: use `Counter`, `defaultdict`, or simple integers.
- Prefix sums: store cumulative totals in a list.
- Binary search: use `bisect_left` / `bisect_right`.
- String parsing: combine `split`, `strip`, `isdigit`, `ord`, and `Counter`.

## Must know for LeetCode

- `heapq`: priority queue / min-heap / max-heap patterns
- `collections.deque`: BFS, monotonic queue, sliding window
- `collections.Counter`: frequency counting
- `collections.defaultdict`: grouped counts, adjacency lists, missing keys
- `functools.lru_cache`: recursion memoization and DP
- `bisect`: `bisect_left`, `bisect_right`, `insort_left`, `insort_right`
- `itertools`: `groupby`, `chain`, `islice`, plus the common combinatorics helpers
- `math`: `gcd`, `inf`, `isfinite`, and the core numeric helpers
- `re`: regular expressions for difficult parsing tasks
- `string`: `ascii_lowercase`, `ascii_letters`, `digits`, `punctuation`

## Nice to know

- `operator`: small helpers like `itemgetter`
- `pathlib`: not common in LeetCode, but useful in local scripts
- `typing`: helps keep your own solution templates readable
- `dataclasses`: handy for cleaner custom nodes or states, though not required
