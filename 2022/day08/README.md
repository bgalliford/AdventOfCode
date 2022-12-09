# --- Day 08: Treetop Tree House ---

### Part 1 Puzzle
* We found some cool trees! The elves want to stop to build a treehouse so badly that they send out a drone to map the height of each tree in the grove.
* With said map (our input) in hand, we are tasked with determining how many trees in the grove are visible from outside of the grove
* All trees on the edge of the grid are considered visible, as are any interior trees where trees between it and the edge of the grid are shorter than it

### Part 2 Puzzle
* Now that the elves are comfortable with tree coverage for security purposes, they want to find the most scenic tree in which to build the tree house
* "Most scenic" means the tree from which they can see the most trees in the grove
* We determine "most scenic" by counting the number of trees seen in each direction of the grid, then multiplying those numbers

### Puzzle Solution
1. Use `Get-Content` to read in the 99x99 grove grid
2. Set up an initial `$visible` value calculating the number of trees on the edge of the grove
3. Iterate through each row and column of the grid, excluding the trees on the edge of the grove
    * Find our current tree at `$grove[$y][$x]`
    * Build arrays of all trees to the left and to the right of the current tree, converting to integer in the process
    * Build arrays of all trees above and below the current tree, converting to integer in the process
    * To solve Part 1:
        * Use `Measure-Object` for each directional array and find the maximum value in each direction from the current tree
        * If any one of those maximums is less than the value of the current tree, add one to `$visible`
        * Once finished, return `$visible`
    * To solve Part 2:
        * Set empty variables to count trees seen from the vantage point of the current tree, as well as a high-score variable
        * Reverse the values of `$arrayLeft` to account for iterating in the correct order
        * Use `ForEach` to iterate through each directional array:
            * Add one to the directional variable for the array direction
            * Once a tree is discovered of greater or equal value to the current tree, `Break` to end the loop
        * Once all four directional counters are populated, multiply the values
            * If the current scenic score is higher than the high-score variable, change the high score variable
        * Once finished, return `$highScore`