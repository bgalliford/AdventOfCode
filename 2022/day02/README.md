# --- Day 02: Rock Paper Scissors ---

### Part 1 Puzzle
* The elves organize a Rock Paper Scissors tournament to determine who can set up camp closest to the snacks
* An enterprising elf gives you a strategy guide with which to cheat your way to tournament victory
* They explain that the guide (your input) contains two columns; the first represents what your opponent plays
* They leave before explaining the second column, so you assume it's what you should play
* We must determine what our total score (6 points for win, 3 for lose, 0 for draw) will be based on the guide
    * Points are also awarded based on which option you play (1 for Rock, 2 for Paper, 3 for Scissors)

### Part 2 Puzzle
* Your mysterious elf benefactor returns and explains that the second column actually represents how the round should end
* We must calculate our total score again, factoring in both the round outcome and by determining which option we played

### Puzzle Solution
1. Use `Get-Content` to read input as array, sort it with `Sort-Object`, and group it with `Group-Object`
    * We are left with the nine possible Rock-Paper-Scissors patterns and the number of times each is played
2. Set a score-summing variable to 0
3. To solve Part 1:
    * Use `For-Each` to loop through the nine RPS patterns, then `Switch` to multiply that pattern's score by its count
    * The scores are hard-coded, and add our play (second character in pattern) with the game's outcome
    * Append the output to our score-summing variable, then return it
4. To solve Part 2:
    * Use the same approach as in Part 1, but change the hard-coded scores based on the corrected criteria