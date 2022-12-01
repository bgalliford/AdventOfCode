# Day 1 - Calorie Counting
# A failed attempt at an optimized solution
$calorieList = Get-Content ./2022/day01/input.txt | Out-String
$backpacks = $calorieList.Split("`n`n")
$backpackSums = @()
ForEach ($backpack in $backpacks) {
    $backpackSums += (($backpack.Split("`n") | Measure-Object -Sum).Sum)
}
$topBackpack = $backpackSums | Sort-Object -Descending | Select-Object -First 1
$topThree = ($backpackSums | Sort-Object -Descending | Select-Object -First 3 | Measure-Object -Sum).Sum
Write-Host "Top backpack calories: $topBackpack"
Write-Host "Top 3 backpack calories: $topThree"