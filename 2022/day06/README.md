# --- Day 06: Tuning Trouble ---

### Part 1 Puzzle
* We're beginning our jungle expedition, and because the elves think I'm smart, they gave me a broken comm system to fix
* We are given a datastream buffer (our input) and are tasked with finding where in the string the buffer ends and the packet begins
* To do this, we need to find the character position where the first group of four distinct, successive characters ends

### Part 2 Puzzle
* Now we need to find where the start-of-*message* buffer ends, which is where the first group of 14 distinct, successive characters ends

### Puzzle Solution
1. Use `Get-Content` to read in text input, and `.ToCharArray()` to explode this into a character-by-character array
2. To solve Part 1:
    * Use `For` to iterate through the array in four-element (`$j = $i + 3`) chunks
    * Use `Group-Object` to reduce the group to unique characters
    * As soon as the resulting group equals four (i.e. there are four unique characters), record `$j + 1` as our answer, and `Break`
3. To solve Part 2:
    * We use the same method as in Part 1, except we iterate in 14-element (`$j = $i + 13`) chunks