# --- Day 01: Calorie Counting ---

### Part 1 Puzzle
* Each of Santa's elves has a backpack; in the backpack are various food items
* The elves have composed a single list of all of their individual food items' calories (our puzzle input)
* We must ascertain which elf is carrying the most calories, and how many calories they have

### Part 2 Puzzle
* The elves are now concerned that the elf with the most calories may run out of snacks too quickly if they need to share
* We must now ascertain which *three* elves are carrying the most calories, and how many calories they have

### Puzzle Solution
1. Use `Get-Content` to read input as array
2. Set variables for summed calories of a given backpack, and total calories for current top three backpacks, to 0
3. Use `For-Each` to iterate through each line of our calorie list
    * `$null` lines are the end of a backpack
    * Until `$null` append each line to the backpack sum variable
    * Use an `If-ElseIf` approach to determine if each backpack is a Top 3 contender
    * Reset our backpack sum variable between each loop
4. To solve Part 1, output the current top backpack variable
5. To solve Part 2, sum the top three backpacks, then return it