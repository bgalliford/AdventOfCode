# --- Day 05: Supply Stacks ---

### Part 1 Puzzle
* The elves' ship is full of stacks of cargo crates. A plan has been developed to offload the supplies efficiently, with much rearranging needed.
* A master plan to free up the needed cargo has been written down (our input), and the elves want to know which will be ready to unload first.
* Knowing that the crane can only re-arrange one crate at a time, we must calculate which crates will be at the top of each cargo stack when finished.

### Part 2 Puzzle
* Whoops! We had the wrong crane. This newer crane can pick up more than one crate at a time. We must re-calculate.

### Puzzle Solution
1. Hard-code the stack portion of the puzzle input into PowerShell Stack collections, because ain't nobody got time to parse that
2. To solve Part 1:
    * Use `[Stack[string]]::new()` to build an array of PowerShell stacks, then `.Push()` to add our crate towers to the nine empty stacks
    * Use `Get-Content` to read input as array, which is now just our instruction list for re-arranging crates
    * Iterate through our instructions with `ForEach`:
        * Use `.Split(" ")` to separate our instruction numbers (# of crates to move, column to move from, column to move to)
        * For each crate to move from the first column, use `.Pop()` and `.Push()` to send the crate to the second column
        * Note that `.Pop()` goes one at a time, and so will correctly reverse the crate order as the puzzle dictates
    * Once all re-arranging is finished, use `.Peek()` to find and return the top crate in each stack
5. To solve Part 2:
    * We use the same method as in Part 1, except we need to reverse the order of `.Pop()`, since the crane is not reversing the order of stacks
    * To do this, we simply `.Pop()` the crates into a storage array, then `.Pop()` the contents of that array into the second column, which preserves the initial order