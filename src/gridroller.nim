import random, strutils

const
  Rows = 23
  Cols = 28

randomize()

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
    else:
      stdout.write("   ")
  echo "|"
