# Day 2 - Rock Paper Scissors
# Combining powers with https://github.com/jtrucken
function Get-Score {
    Param (
        [Parameter(Mandatory)][object]$inputObject,
        [Parameter(Mandatory)][int]$solveForPart
    )
    Switch ($solveForPart) {
        1 { $scoreValues = @(4, 8, 3, 1, 5, 9, 7, 2, 6) }
        2 { $scoreValues = @(3, 4, 8, 1, 5, 9, 2, 6, 7) }
    }
    Switch ($inputObject.Name) {
        "A X" { return ($scoreValues[0] * $inputObject.Count) }
        "A Y" { return ($scoreValues[1] * $inputObject.Count) }
        "A Z" { return ($scoreValues[2] * $inputObject.Count) }
        "B X" { return ($scoreValues[3] * $inputObject.Count) }
        "B Y" { return ($scoreValues[4] * $inputObject.Count) }
        "B Z" { return ($scoreValues[5] * $inputObject.Count) }
        "C X" { return ($scoreValues[6] * $inputObject.Count) }
        "C Y" { return ($scoreValues[7] * $inputObject.Count) }
        "C Z" { return ($scoreValues[8] * $inputObject.Count) }
    }
}
$patterns = Get-Content ./2022/day02/input.txt | Group-Object | Select-Object Count,Name
# Part 1 (incorrect guide interpretation)
$score = 0
ForEach ($pattern in $patterns) {
    $score += Get-Score -inputObject $pattern -solveForPart 1
}
Write-Host "My total score, calculated incorrectly, is $score"
# Part 2 (correct guide interpretation)
$score = 0
ForEach ($pattern in $patterns) {
    $score += Get-Score -inputObject $pattern -solveForPart 2
}
Write-Host "My total score, calculated correctly, is $score"