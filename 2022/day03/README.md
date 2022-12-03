# --- Day 03: Rucksack Organization ---

### Part 1 Puzzle
* An elf charged with organizing everyone's rucksacks for the journey has messed up precisely one thing in each rucksack
* Another list of items in each rucksack has been assembled (our input)
* We are tasked with determining which item type (represented by an upper or lowercase letter) is in both of a rucksack's compartments
* We then assign a priority score to that item type and sum up those priority scores for all rucksacks

### Part 2 Puzzle
* Elves are members of three-elf groups with identical badges, identified as a shared item type in their rucksacks
* The badges need to be retrieved so that their authenticity stickers can be updated, but they are different types group-to-group
* We are tasked with determining the item type for the badge in each three-elf group, assigning it a priority score, and summing those up

### Puzzle Solution
1. Use `Get-Content` to read input as array
2. Set an alphabet variable with all 52 lower and uppercase alpha characters in it
3. To solve Part 1:
    * Set a variable summing common item priority scores to 0
    * Use `ForEach` to iterate through each rucksack:
        * Use `.Substring()` and `.Length` to separate each rucksack into two compartments, setting each as a variable
        * Use `Compare-Object` to compare the compartments (case-sensitively!), and `Where-Object` and `Select-Object` to determine the shared character
        * Get the index of the character from the alphabet variable, add one, and append that priority score to our common item priority summer
    * When all rucksacks are processed, return the final priority score sum
4. To solve Part 2:
    * Set a variable summing group badge priority scores to 0
    * Use `For` and `$i + 2` to loop through our rucksacks three at a time (each elf group)
        * Use `Compare-Object`, `Where-Object`, and `Select-Object` to compare Rucksack 1 to Rucksack 2 to find all common characters, and set this as a variable
        * Compare Rucksack 3 to the first compare variable to find the lone common character
        * Get the index of the character from the alphabet variable, add one, and append that priority score to our group badge priority summer
    * When all groups are processed, return the final priority score sum