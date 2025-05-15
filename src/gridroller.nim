import random, strutils, strformat

const
  Rows = 23
  Cols = 28
  Max = 6
  DisplayCols = 10

randomize()

var ones: seq[(int,int)] = @[] # col, row

# Print column headers
stdout.write("     ")  # space for row labels
for col in 0..<Cols:
  stdout.write align($col, 2) & " "
echo ""

# Print horizontal divider
stdout.write("    +")
for _ in 0..<Cols:
  stdout.write("---")
echo "+"

# Generate and print the grid
for row in 0..<Rows:
  stdout.write align($row, 3) & " |"
  for col in 0..<Cols:
    let roll = rand(1..Max)
    if roll == 1:
      stdout.write(" X ")
      ones.add((col, row))
    else:
      stdout.write("   ")
  echo "|"

# Print horizontal divider
stdout.write("    +")
for _ in 0..<Cols:
  stdout.write("---")
echo "+"

let rows = int((ones.len + DisplayCols - 1) / DisplayCols)
for row in 0..rows:
  for col in 0..DisplayCols:
    let index = row + col * rows
    if index < ones.len:
      let (c,r) = ones[index]
      stdout.write fmt"({c:>2},{r:>2})  "
    else: 
      stdout.write " ".repeat(10)
  echo ""