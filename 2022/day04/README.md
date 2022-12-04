# --- Day 04: Camp Cleanup ---

### Part 1 Puzzle
* The elves need to clear space in camp to finish unloading the ship, and have been assigned sections of camp to clear
* In their obsessive list-making, they notice that some of their assignments overlap, for reasons unexplained
* We are asked to identify how many pairs of assignments overlap in such a way that one is completely part of the other

### Part 2 Puzzle
* The elves, still concerned about duplication of effort, now want to know how many assignments overlap *at all*

### Puzzle Solution
1. Use `Get-Content` to read input as array
2. Set counters for pairs with partial overlap and pairs with full overlap to 0
3. Use `For-Each` to iterate through each assignment pair:
    * Split the pair up into individual assignments
    * Split the individual assignments into start and end, and then explode those into arrays
    * Compare the two individual assignment arrays to create an array of equal sections
4. To solve Part 1, return the count where the equal assignments array is not null, and a comparison of it to either the first or second assignment *is* null (i.e. the comparison is exact)
5. To solve Part 2, return the count where the equal assignments array is not null