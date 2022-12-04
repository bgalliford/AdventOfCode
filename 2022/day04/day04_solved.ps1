# # Day 4 - Camp Cleanup
# Puzzle solve solution
$assignments = Get-Content ./2022/day04/input.txt
$fullCounter=$partialCounter = 0
ForEach ($assignment in $assignments) {
    $assignment1, $assignment2 = $assignment.Split(",")
    $end1, $end2 = $assignment1.Split("-")
    $end3, $end4 = $assignment2.Split("-")
    $array1 = $end1..$end2
    $array2 = $end3..$end4
    $equalArray = Compare-Object $array1 $array2 -IncludeEqual | Where-Object {$_.SideIndicator -eq "=="} | Select-Object -ExpandProperty InputObject
    If ($null -ne $equalArray -And ($null -eq (Compare-Object $array1 $equalArray) -Or $null -eq (Compare-Object $array2 $equalArray))) {
        $fullCounter += 1
    }
    If ($null -ne $equalArray) {
        $partialCounter += 1
    }
}
Write-Host "Out of 1,000 assignment pairs, $fullCounter have full overlap"
Write-Host "Out of 1,000 assignment pairs, $partialCounter have partial overlap"