# Python LeetCode Cheat Sheet

Practical reference for Python standard-library tools that show up often in LeetCode problems.
The goal is to make the next solution easier to write, not to teach the whole language.
Every example shows an input state first and the result after the operation.

## Math

- `abs`: built-in absolute-value helper.
- `math.sqrt`: square root.
- `math.ceil`, `math.floor`: rounding up and down.
- `math.pow`: floating-point exponentiation.
- `math.gcd`: greatest common divisor.
- `math.inf`: positive infinity sentinel.
- `math.isfinite`: check for finite numbers.
- `operator.itemgetter`: compact key function for sorting.
- `functools.reduce`: fold a sequence into one value.
- `functools.lru_cache`: memoization for recursion and DP.

```python
import math
from functools import lru_cache, reduce
from operator import itemgetter

def example_math():
    before_abs = -3.5
    after_abs = abs(before_abs)  # 3.5

    before_sqrt = 16
    after_sqrt = math.sqrt(before_sqrt)  # 4.0

    before_ceil = 2.1
    after_ceil = math.ceil(before_ceil)  # 3

    before_floor = 2.9
    after_floor = math.floor(before_floor)  # 2

    before_pow = (2, 5)
    after_pow = math.pow(*before_pow)  # 32.0

    before_gcd = (12, 18)
    after_gcd = math.gcd(*before_gcd)  # 6

    before_inf = 999999
    after_inf = math.inf
    after_isfinite = math.isfinite(before_inf)  # True
    after_isfinite_inf = math.isfinite(after_inf)  # False

    values_before = [(2, "b"), (1, "a")]
    values_after = sorted(values_before, key=itemgetter(0))
    # before: [(2, "b"), (1, "a")]
    # after : [(1, "a"), (2, "b")]

    nums_before = [1, 2, 3]
    nums_after = reduce(lambda acc, n: acc + n, nums_before, 0)  # 6

    @lru_cache(None)
    def fib(n):
        if n < 2:
            return n
        return fib(n - 1) + fib(n - 2)

    first_call = fib(10)   # computes and caches
    second_call = fib(10)  # reuses cache, same result

    return (
        after_abs, after_sqrt, after_ceil, after_floor, after_pow, after_gcd,
        after_inf, after_isfinite, after_isfinite_inf, values_after,
        nums_after, first_call, second_call,
    )
```

## Arrays and lists

In Python, LeetCode "array" problems are usually plain `list`.

- Built-ins: `len`, `sum`, `min`, `max`, `sorted`, `reversed`, `enumerate`, `zip`, `range`.
- `list` methods: `append`, `extend`, `insert`, `pop`, `remove`, `sort`, `reverse`.
- `bisect`: `bisect_left`, `bisect_right`.
- `heapq`: `heapify`, `heappush`, `heappop`, `nlargest`, `nsmallest`.
- `itertools`: `accumulate`, `product`, `permutations`, `combinations`.
- `collections`: `Counter`, `defaultdict`, `deque`.

```python
from collections import Counter, defaultdict, deque
from itertools import accumulate, combinations, permutations, product
from bisect import bisect_left, bisect_right
import heapq

def example_lists(nums, words):
    before = [3, 1, 4]
    after_len = len(before)  # 3
    after_sum = sum(before)  # 8
    after_min = min(before)  # 1
    after_max = max(before)  # 4
    after_sorted = sorted(before)  # [1, 3, 4]

    after_reversed = list(reversed(before))  # [4, 1, 3]
    after_enumerate = list(enumerate(before))  # [(0, 3), (1, 1), (2, 4)]
    after_zip = list(zip(words, before))
    after_range = list(range(3))  # [0, 1, 2]

    append_before = [1, 2]
    append_after = append_before + [10]  # [1, 2, 10]

    extend_before = [1]
    extend_after = extend_before + [2, 3]  # [1, 2, 3]

    insert_before = [2, 3]
    insert_after = insert_before[:1] + [99] + insert_before[1:]  # [2, 99, 3]

    pop_before = [1, 2, 3]
    popped = pop_before[-1]  # 3
    pop_after = pop_before[:-1]  # [1, 2]

    remove_before = [1, 99, 2]
    remove_after = [v for v in remove_before if v != 99]  # [1, 2]

    sort_before = [3, 1, 4]
    sort_after = sorted(sort_before)  # [1, 3, 4]

    reverse_before = [1, 2, 3]
    reverse_after = reverse_before[::-1]  # [3, 2, 1]

    ordered = [1, 2, 4, 5]
    left = bisect_left(ordered, 4)   # 2
    right = bisect_right(ordered, 4) # 3

    heap = [3, 1, 4]
    heapq.heapify(heap)          # after: [1, 3, 4]
    heapq.heappush(heap, 2)      # after: [1, 2, 4, 3]
    popped_heap = heapq.heappop(heap)  # 1
    top_two = heapq.nlargest(2, before)  # [4, 3]
    low_two = heapq.nsmallest(2, before) # [1, 3]

    prefix = list(accumulate(before))  # [3, 4, 8]
    prod = list(product([1, 2], ["a", "b"]))
    perms = list(permutations([1, 2, 3], 2))
    combs = list(combinations([1, 2, 3], 2))

    freq = Counter(before)  # Counter({3: 1, 1: 1, 4: 1})
    groups = defaultdict(list)
    groups["odd"].append(1)
    groups["odd"].append(3)  # {'odd': [1, 3]}

    queue = deque([1, 2, 3])
    queue.appendleft(0)  # deque([0, 1, 2, 3])
    queue.append(4)      # deque([0, 1, 2, 3, 4])

    return (
        after_len, after_sum, after_min, after_max, after_sorted,
        after_reversed, after_enumerate, after_zip, after_range,
        append_after, extend_after, insert_after, popped, pop_after,
        remove_after, sort_after, reverse_after, left, right, popped_heap,
        top_two, low_two, prefix, prod, perms, combs, freq, groups, queue,
    )
```

## Strings

- Built-ins: `str.join`, `str.split`, `str.strip`, `str.lower`, `str.upper`, `str.startswith`, `str.endswith`, `str.find`, `str.count`.
- `string`: `ascii_lowercase`, `ascii_letters`, `digits`, `punctuation`.
- `re`: regular expressions when simple parsing is not enough.
- `ord`, `chr`: convert between characters and integer codes.

```python
import re
import string

def example_strings():
    before = "  Hello, LeetCode  "
    after_join = "-".join(["a", "b", "c"])         # "a-b-c"
    after_split = "a,b,c".split(",")               # ["a", "b", "c"]
    after_strip = before.strip()                    # "Hello, LeetCode"
    after_lower = before.lower()                    # "  hello, leetcode  "
    after_upper = before.upper()                    # "  HELLO, LEETCODE  "
    after_starts = before.startswith("  He")        # True
    after_ends = before.endswith("de  ")            # True
    after_find = before.find("Code")                # 11
    after_count = before.count("e")                 # 3

    letters_before = "alphabet"
    letters_after = string.ascii_lowercase
    all_letters_after = string.ascii_letters
    digits_after = string.digits
    punctuation_after = string.punctuation

    regex_before = "a12b34"
    digits_only = re.findall(r"\d+", regex_before)   # ["12", "34"]
    words_only = re.findall(r"[A-Za-z]+", "leet code 123")

    code_before = "a"
    code_after = ord(code_before)                    # 97
    char_after = chr(code_after + 1)                 # "b"

    return (
        after_join, after_split, after_strip, after_lower, after_upper,
        after_starts, after_ends, after_find, after_count,
        letters_before, letters_after, all_letters_after, digits_after,
        punctuation_after, digits_only, words_only, code_after, char_after,
    )
```

## Common LeetCode patterns

- Two pointers: `l` and `r` indices on lists or strings.
- Sliding window: use `Counter`, `defaultdict`, or simple integers.
- Prefix sums: store cumulative totals in a list.
- Binary search: use `bisect_left` / `bisect_right`.
- String parsing: combine `split`, `strip`, `isdigit`, `ord`, and `Counter`.

```python
from collections import Counter
from bisect import bisect_left

def two_pointers(nums):
    # before: nums = [2, 3, 4, 8]
    # after : returns 9 from the values consumed on the left side
    l, r = 0, len(nums) - 1
    ans = 0
    while l < r:
        if nums[l] + nums[r] > 10:
            r -= 1
        else:
            ans += nums[l]
            l += 1
    return ans

def sliding_window(nums, k):
    # before: nums = [1, 2, 3, 4], k = 2
    # after : best = 7 from window [3, 4]
    window = 0
    best = 0
    for i, value in enumerate(nums):
        window += value
        if i >= k:
            window -= nums[i - k]
        if i >= k - 1:
            best = max(best, window)
    return best

def prefix_sum(nums):
    # before: nums = [2, 4, 1, 3]
    # after : prefix = [0, 2, 6, 7, 10]
    prefix = [0]
    for value in nums:
        prefix.append(prefix[-1] + value)
    return prefix

def binary_search_example(nums, target):
    # before: nums = [4, 1, 3, 2], target = 3
    # after : sorted nums = [1, 2, 3, 4], idx = 2, found = True
    nums = sorted(nums)
    idx = bisect_left(nums, target)
    return idx < len(nums) and nums[idx] == target

def string_parse_example(s):
    # before: s = "  a1 b2  "
    # after : cleaned = ["a1", "b2"], digits = ["1", "2"], freq counts characters
    cleaned = s.strip().split()
    digits = [c for c in s if c.isdigit()]
    freq = Counter(s)
    return cleaned, digits, freq
```

## Must know for LeetCode

- `heapq`: priority queue / min-heap / max-heap patterns.
- `collections.deque`: BFS, monotonic queue, sliding window.
- `collections.Counter`: frequency counting.
- `collections.defaultdict`: grouped counts, adjacency lists, missing keys.
- `functools.lru_cache`: recursion memoization and DP.
- `bisect`: `bisect_left`, `bisect_right`, `insort_left`, `insort_right`.
- `itertools`: `groupby`, `chain`, `islice`, plus the common combinatorics helpers.
- `math`: `gcd`, `inf`, `isfinite`, and the core numeric helpers.
- `re`: regular expressions for difficult parsing tasks.
- `string`: `ascii_lowercase`, `ascii_letters`, `digits`, `punctuation`.

```python
from collections import Counter, defaultdict, deque
from functools import lru_cache
from bisect import bisect_left, bisect_right, insort_left, insort_right
from itertools import chain, groupby, islice
import heapq
import math
import re
import string

def example_must_know(nums):
    heap_before = nums[:]
    heapq.heapify(heap_before)       # after: min-heap
    heapq.heappush(heap_before, 0)    # after: 0 becomes the new root
    heap_after = heapq.heappop(heap_before)

    dq_before = deque(nums)
    dq_before.appendleft(-1)         # after: -1 at the front
    dq_before.append(99)             # after: 99 at the back

    freq_before = Counter(nums)
    freq_after = freq_before["x"]    # missing key returns 0

    groups = defaultdict(list)
    groups[0].append(nums[0])        # before: empty defaultdict
    groups_after = groups[0]         # after: first bucket has one value

    @lru_cache(None)
    def dp(i):
        if i <= 1:
            return i
        return dp(i - 1) + dp(i - 2)

    fib_first = dp(10)   # first call computes
    fib_second = dp(10)  # second call reuses cache

    sorted_nums = sorted(nums)
    left = bisect_left(sorted_nums, 3)    # before: [1, 2, 3, 4]
    right = bisect_right(sorted_nums, 3)  # after: left=2, right=3
    insort_left(sorted_nums, 3)           # before: [1, 2, 3, 4]
    insort_right(sorted_nums, 3)          # after: [1, 2, 3, 3, 3, 4]

    joined = list(chain([1, 2], [3, 4]))  # before two iterables, after one list
    grouped = [(k, list(g)) for k, g in groupby("aaabbc")]
    sliced = list(islice(range(10), 3))    # before: 0..9, after: [0, 1, 2]

    has_letters = any(ch in string.ascii_letters for ch in "abc")
    gcd_after = math.gcd(12, 18)
    finite_after = math.isfinite(1.5)
    match_after = re.findall(r"\d+", "a12b34")

    return (
        heap_after, dq_before, freq_before, freq_after, groups_after,
        fib_first, fib_second, left, right, joined, grouped, sliced,
        has_letters, gcd_after, finite_after, match_after,
    )
```

## Nice to know

- `operator`: small helpers like `itemgetter`.
- `pathlib`: not common in LeetCode, but useful in local scripts.
- `typing`: helps keep your own solution templates readable.
- `dataclasses`: handy for cleaner custom nodes or states, though not required.

```python
from dataclasses import dataclass
from operator import itemgetter
from pathlib import Path
from typing import List, Optional, Tuple

def example_nice_to_know():
    pairs_before = [(2, "b"), (1, "a")]
    pairs_after = sorted(pairs_before, key=itemgetter(0))
    # before: [(2, "b"), (1, "a")]
    # after : [(1, "a"), (2, "b")]

    path_before = "input.txt"
    path_after = Path(path_before)
    name_after = path_after.name
    suffix_after = path_after.suffix

    nums: List[int] = [1, 2, 3]
    maybe: Optional[int] = None
    point: Tuple[int, int] = (1, 2)

    @dataclass
    class Node:
        val: int
        next: Optional["Node"] = None

    node = Node(1)
    next_before = node.next
    node.next = Node(2)
    next_after = node.next.val

    return pairs_after, name_after, suffix_after, nums, maybe, point, next_before, next_after
```
