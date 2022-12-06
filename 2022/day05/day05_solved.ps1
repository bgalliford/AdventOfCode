# Day 5 - Supply Stacks
# Puzzle solve solution
using namespace System.Collections.Generic
$stacks = @([Stack[string]]::new(),[Stack[string]]::new(),[Stack[string]]::new(),[Stack[string]]::new(),[Stack[string]]::new(),[Stack[string]]::new(),[Stack[string]]::new(),[Stack[string]]::new(),[Stack[string]]::new())
$stacks[0].Push("Z")
$stacks[0].Push("J")
$stacks[0].Push("N")
$stacks[0].Push("W")
$stacks[0].Push("P")
$stacks[0].Push("S")
$stacks[1].Push("G")
$stacks[1].Push("S")
$stacks[1].Push("T")
$stacks[2].Push("V")
$stacks[2].Push("Q")
$stacks[2].Push("R")
$stacks[2].Push("L")
$stacks[2].Push("H")
$stacks[3].Push("V")
$stacks[3].Push("S")
$stacks[3].Push("T")
$stacks[3].Push("D")
$stacks[4].Push("Q")
$stacks[4].Push("Z")
$stacks[4].Push("T")
$stacks[4].Push("D")
$stacks[4].Push("B")
$stacks[4].Push("M")
$stacks[4].Push("J")
$stacks[5].Push("M")
$stacks[5].Push("W")
$stacks[5].Push("T")
$stacks[5].Push("J")
$stacks[5].Push("D")
$stacks[5].Push("C")
$stacks[5].Push("Z")
$stacks[5].Push("L")
$stacks[6].Push("L")
$stacks[6].Push("P")
$stacks[6].Push("M")
$stacks[6].Push("W")
$stacks[6].Push("G")
$stacks[6].Push("T")
$stacks[6].Push("J")
$stacks[7].Push("N")
$stacks[7].Push("G")
$stacks[7].Push("M")
$stacks[7].Push("T")
$stacks[7].Push("B")
$stacks[7].Push("F")
$stacks[7].Push("Q")
$stacks[7].Push("H")
$stacks[8].Push("R")
$stacks[8].Push("D")
$stacks[8].Push("G")
$stacks[8].Push("C")
$stacks[8].Push("P")
$stacks[8].Push("B")
$stacks[8].Push("Q")
$stacks[8].Push("W")
$moves = Get-Content ./2022/day05/input.txt
ForEach ($move in $moves) {
    $split1, [int]$numToMove, $split2, [int]$stackSubtracting, $split3, [int]$stackAdding = $move.Split(" ")
    For ($i = 0; $i -lt $numToMove; $i++) {
        $stacks[($stackAdding - 1)].Push($stacks[($stackSubtracting - 1)].Pop()) | Out-Null
    }
}
$answer = ""
ForEach ($stack in $stacks) {
    $answer += $stack.Peek()
}
Write-Host "The top crates, assuming old crane capability, are: $answer"
$stacks = @([Stack[string]]::new(),[Stack[string]]::new(),[Stack[string]]::new(),[Stack[string]]::new(),[Stack[string]]::new(),[Stack[string]]::new(),[Stack[string]]::new(),[Stack[string]]::new(),[Stack[string]]::new())
$stacks[0].Push("Z")
$stacks[0].Push("J")
$stacks[0].Push("N")
$stacks[0].Push("W")
$stacks[0].Push("P")
$stacks[0].Push("S")
$stacks[1].Push("G")
$stacks[1].Push("S")
$stacks[1].Push("T")
$stacks[2].Push("V")
$stacks[2].Push("Q")
$stacks[2].Push("R")
$stacks[2].Push("L")
$stacks[2].Push("H")
$stacks[3].Push("V")
$stacks[3].Push("S")
$stacks[3].Push("T")
$stacks[3].Push("D")
$stacks[4].Push("Q")
$stacks[4].Push("Z")
$stacks[4].Push("T")
$stacks[4].Push("D")
$stacks[4].Push("B")
$stacks[4].Push("M")
$stacks[4].Push("J")
$stacks[5].Push("M")
$stacks[5].Push("W")
$stacks[5].Push("T")
$stacks[5].Push("J")
$stacks[5].Push("D")
$stacks[5].Push("C")
$stacks[5].Push("Z")
$stacks[5].Push("L")
$stacks[6].Push("L")
$stacks[6].Push("P")
$stacks[6].Push("M")
$stacks[6].Push("W")
$stacks[6].Push("G")
$stacks[6].Push("T")
$stacks[6].Push("J")
$stacks[7].Push("N")
$stacks[7].Push("G")
$stacks[7].Push("M")
$stacks[7].Push("T")
$stacks[7].Push("B")
$stacks[7].Push("F")
$stacks[7].Push("Q")
$stacks[7].Push("H")
$stacks[8].Push("R")
$stacks[8].Push("D")
$stacks[8].Push("G")
$stacks[8].Push("C")
$stacks[8].Push("P")
$stacks[8].Push("B")
$stacks[8].Push("Q")
$stacks[8].Push("W")
$stackToPop = [Stack[string]]::new()
ForEach ($move in $moves) {
    $split1, [int]$numToMove, $split2, [int]$stackSubtracting, $split3, [int]$stackAdding = $move.Split(" ")
    For ($i = 0; $i -lt $numToMove; $i++) {
        $stackToPop.Push($stacks[($stackSubtracting - 1)].Pop()) | Out-Null
    }
    While ($stackToPop.Count -gt 0) {
        $stacks[($stackAdding - 1)].Push($stackToPop.Pop()) | Out-Null
    }
}
$answer = ""
ForEach ($stack in $stacks) {
    $answer += $stack.Peek()
}
Write-Host "The top crates, acknowledging new crane capability, are: $answer"