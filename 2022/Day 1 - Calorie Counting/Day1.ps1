# Day 1 - Calorie Counting

$calorieList = Get-Content '/Users/galliford/AdventOfCode/2022/Day 1 - Calorie Counting/input.txt'
$backpackSum=$currentNo1=$currentNo2=$currentNo3 = 0
ForEach ($foodItem in $calorieList) {
    If ($foodItem.Length -gt 0) {
        $backPackSum = $backPackSum + $foodItem
    } Else {
        If ($backpackSum -gt $currentNo1) {
            $currentNo3 = $currentNo2
            $currentNo2 = $currentNo1
            $currentNo1 = $backpackSum
        } ElseIf ($backpackSum -gt $currentNo2 -And $backpackSum -lt $currentNo1) {
            $currentNo3 = $currentNo2
            $currentNo2 = $backpackSum
        } ElseIf ($backpackSum -gt $currentNo3 -And $backpackSum -lt $currentNo2) {
            $currentNo3 = $backpackSum
        }
        $backpackSum = 0
    }
}
$top3Total = $currentNo1 + $currentNo2 + $currentNo3
Write-Host "Top 3: #1 $currentNo1, #2 $currentNo2, #3 $currentNo3 (total of $top3Total)"