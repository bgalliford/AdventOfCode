# Day 6 - Tuning Trouble
# Puzzle solve solution
$datastream = (Get-Content ./2022/day06/input.txt).ToCharArray()
For ($i = 0; $i -lt $datastream.Length; $i++) {
    $j = $i + 3
    $currentGroup = $datastream[$i..$j] | Group-Object
    If ($currentGroup.Length -eq 4) {
        $answer = $j + 1
        Write-Host "Start-of-packet buffer ends at position $answer"
        Break
    }
}
For ($i = 0; $i -lt $datastream.Length; $i++) {
    $j = $i + 13
    $currentGroup = $datastream[$i..$j] | Group-Object
    If ($currentGroup.Length -eq 14) {
        $answer = $j + 1
        Write-Host "Start-of-message buffer ends at position $answer"
        Break
    }
}