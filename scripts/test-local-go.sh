#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
go_root="$repo_root/go"

problem_id="${1:-${ID:-last}}"

resolve_problem_dir() {
  local id="$1"

  if [ -z "$id" ] || [ "$id" = "last" ]; then
    find "$go_root" -maxdepth 1 -mindepth 1 -type d -printf '%f\n' \
      | awk '/^[0-9]{4}\./ { print }' \
      | sort \
      | tail -n1
    return
  fi

  if [ -d "$go_root/$id" ]; then
    printf '%s\n' "$id"
    return
  fi

  if [ -d "$repo_root/$id" ]; then
    printf '%s\n' "${id#"$repo_root/"}"
    return
  fi

  printf '%s\n' "$id"
}

problem_dir=$(resolve_problem_dir "$problem_id")
test_file="$go_root/$problem_dir/testcases.txt"
solution_file="$go_root/$problem_dir/solution.go"

if [ ! -f "$test_file" ]; then
  printf 'testcases file not found: %s\n' "$test_file" >&2
  exit 1
fi

if [ ! -f "$solution_file" ]; then
  printf 'solution file not found: %s\n' "$solution_file" >&2
  exit 1
fi

workdir=$(mktemp -d)
trap 'rm -rf "$workdir"' EXIT

export GOWORK=off
export GOPROXY=off
export GOSUMDB=off

(cd "$go_root" && go build -o "$workdir/solution" "./$problem_dir/solution.go")

awk -v outdir="$workdir" '
function save_case(    in_file, out_file) {
  if (!have_case) {
    return
  }

  in_file = sprintf("%s/case-%03d.in", outdir, case_idx)
  out_file = sprintf("%s/case-%03d.out", outdir, case_idx)

  printf "%s", input > in_file
  printf "%s", output > out_file
  close(in_file)
  close(out_file)

  case_idx++
  input = ""
  output = ""
  have_case = 0
}

BEGIN {
  case_idx = 0
  input = ""
  output = ""
  mode = ""
  have_case = 0
}

/^input:$/ {
  save_case()
  mode = "input"
  have_case = 1
  next
}

/^output:$/ {
  mode = "output"
  next
}

{
  if (mode == "input") {
    input = input $0 ORS
  } else if (mode == "output") {
    output = output $0 ORS
  }
}

END {
  save_case()
}
' "$test_file"

shopt -s nullglob
case_files=("$workdir"/case-*.in)

if [ ${#case_files[@]} -eq 0 ]; then
  printf 'no test cases found in %s\n' "$test_file" >&2
  exit 1
fi

for input_file in "${case_files[@]}"; do
  expected_file="${input_file%.in}.out"
  case_name=$(basename "$input_file" .in)
  actual=$("$workdir/solution" < "$input_file" | sed -n 's/^output: //p' | tail -n1)
  expected=$(tr -d '\r\n' < "$expected_file")

  if [ "$actual" != "$expected" ]; then
    printf '%s: mismatch\n' "$case_name" >&2
    printf 'expected: %s\n' "$expected" >&2
    printf 'actual:   %s\n' "$actual" >&2
    exit 1
  fi

  printf '%s: ok\n' "$case_name"
done

