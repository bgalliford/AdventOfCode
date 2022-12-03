# Day 1 - Calorie Counting
# Puzzle solve solution
$calorieList = Get-Content ./2022/day01/input.txt
$backpackSum=$currentNo1=$currentNo2=$currentNo3 = 0
ForEach ($foodItem in $calorieList) {
    If ($foodItem.Length -gt 0) {
        $backpackSum = $backpackSum + $foodItem
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
Write-Host "Top backpack calories: $currentNo1"
Write-Host "Top 3 backpack calories: $top3Total"