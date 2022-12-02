# Day 2 - Rock Paper Scissors
# A stab at the most efficient solution with https://github.com/jtrucken
function Get-Score {
    Param (
        [Parameter(Mandatory)][object]$inputName,
        [Parameter(Mandatory)][int]$solveForPart
    )
    Switch ($solveForPart) {
        1 { $scoreValues = @(4, 8, 3, 1, 5, 9, 7, 2, 6) }
        2 { $scoreValues = @(3, 4, 8, 1, 5, 9, 2, 6, 7) }
    }
    Switch ($inputName.Name) {
        "A X" { return ($scoreValues[0] * $inputName.Count) }
        "A Y" { return ($scoreValues[1] * $inputName.Count) }
        "A Z" { return ($scoreValues[2] * $inputName.Count) }
        "B X" { return ($scoreValues[3] * $inputName.Count) }
        "B Y" { return ($scoreValues[4] * $inputName.Count) }
        "B Z" { return ($scoreValues[5] * $inputName.Count) }
        "C X" { return ($scoreValues[6] * $inputName.Count) }
        "C Y" { return ($scoreValues[7] * $inputName.Count) }
        "C Z" { return ($scoreValues[8] * $inputName.Count) }
    }
}
$patterns = Get-Content ./2022/day02/input.txt | Sort-Object -Descending | Group-Object | Select-Object Count,Name
# Part 1 (incorrect guide interpretation)
$score = 0
ForEach ($pattern in $patterns) {
    $score += Get-Score -inputName $pattern -solveForPart 1
}
Write-Host "My total score, calculated incorrectly, is $score"
# Part 2 (correct guide interpretation)
$score = 0
ForEach ($pattern in $patterns) {
    $score += Get-Score -inputName $pattern -solveForPart 2
}
Write-Host "My total score, calculated correctly, is $score"