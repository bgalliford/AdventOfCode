# Day 2 - Rock Paper Scissors
# Part 1 solve solution
$guide = Get-Content ./2022/day02/input.txt | Out-String
$games = $guide.Split("`n")
$scores = @()
ForEach ($game in $games) {
    $plays = $game.split(" ")
    $theirPlay = $plays[0]
    $myPlay = $plays[1]
    $playScore = Switch ($myPlay) {
        "X" {1}
        "Y" {2}
        "Z" {3}
    }
    $scores += $playScore
    If (($theirPlay -eq "A" -And $myPlay -eq "X") -Or ($theirPlay -eq "B" -And $myPlay -eq "Y") -Or ($theirPlay -eq "C" -And $myPlay -eq "Z")) {
        $scores += 3
    } ElseIf (($theirPlay -eq "A" -And $myPlay -eq "Y") -Or ($theirPlay -eq "B" -And $myPlay -eq "Z") -Or ($theirPlay -eq "C" -And $myPlay -eq "X")) {
        $scores += 6
    }
}
$totalScore = ($scores | Measure-Object -Sum).Sum
Write-Host "My total score, calculated incorrectly, is $totalScore"
# Part 2 solve solution
$scores = @()
ForEach ($game in $games) {
    $plays = $game.split(" ")
    $theirPlay = $plays[0]
    $endResult = $plays[1]
    $resultScore = Switch ($endResult) {
        "X" {0}
        "Y" {3}
        "Z" {6}
    }
    $scores += $resultScore
    If (($endResult -eq "X" -And $theirPlay -eq "A") -Or ($endResult -eq "Y" -And $theirPlay -eq "C") -Or ($endResult -eq "Z" -And $theirPlay -eq "B")) {
        $scores += 3
    } ElseIf (($endResult -eq "X" -And $theirPlay -eq "C") -Or ($endResult -eq "Y" -And $theirPlay -eq "B") -Or ($endResult -eq "Z" -And $theirPlay -eq "A")) {
        $scores += 2
    } ElseIf (($endResult -eq "X" -And $theirPlay -eq "B") -Or ($endResult -eq "Y" -And $theirPlay -eq "A") -Or ($endResult -eq "Z" -And $theirPlay -eq "C")) {
        $scores += 1
    }
}
$totalScore = ($scores | Measure-Object -Sum).Sum
Write-Host "My total score, calculated correctly, is $totalScore"