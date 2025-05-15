import random, strutils, strformat

const
  Rows = 23
  Cols = 28

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
    let roll = rand(1..6)
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

stdout.write("\n##### Cells #####\n")
let cols = 10
let rows = int((ones.len + cols - 1) / cols)
for row in 0..rows:
  for col in 0..cols:
    let index = row + col * rows
    if index < ones.len:
      let (c,r) = ones[index]
      # stdout.write "(", c, ", ", r, ") \t"
      stdout.write fmt"({c:>2},{r:>2})  "
    else: 
      stdout.write " ".repeat(10)
  echo ""