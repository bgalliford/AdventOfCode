# Day 2 - Rock Paper Scissors
# A far more sensible/elegant/efficient solution
$guide = Get-Content ./2022/day02/input.txt
$patterns = $guide | Sort-Object -Descending | Group-Object
# Part 1 (incorrect guide interpretation)
$scores = @()
ForEach ($pattern in $patterns) {
    $patternScore = Switch ($pattern.Name) {
        "A X" {4 * $pattern.Count}
        "A Y" {8 * $pattern.Count}
        "A Z" {3 * $pattern.Count}
        "B X" {1 * $pattern.Count}
        "B Y" {5 * $pattern.Count}
        "B Z" {9 * $pattern.Count}
        "C X" {7 * $pattern.Count}
        "C Y" {2 * $pattern.Count}
        "C Z" {6 * $pattern.Count}
    }
    $scores += $patternScore
}
$totalScore = ($scores | Measure-Object -Sum).Sum
Write-Host "My total score, calculated incorrectly, is $totalScore"
# Part 2 (correct guide interpretation)
$scores = @()
ForEach ($pattern in $patterns) {
    $patternScore = Switch ($pattern.Name) {
        "A X" {3 * $pattern.Count}
        "A Y" {4 * $pattern.Count}
        "A Z" {8 * $pattern.Count}
        "B X" {1 * $pattern.Count}
        "B Y" {5 * $pattern.Count}
        "B Z" {9 * $pattern.Count}
        "C X" {2 * $pattern.Count}
        "C Y" {6 * $pattern.Count}
        "C Z" {7 * $pattern.Count}
    }
    $scores += $patternScore
}
$totalScore = ($scores | Measure-Object -Sum).Sum
Write-Host "My total score, calculated correctly, is $totalScore"