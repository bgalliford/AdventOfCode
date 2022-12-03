# Day 3 - Rucksack Organization
# Puzzle solve solution
$rucksacks = Get-Content ./2022/day03/input.txt
$alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
$commonItemsPriority = 0
ForEach ($rucksack in $rucksacks) {
    $compartment1, $compartment2 = ($rucksack.SubString(0,($rucksack.Length/2))).ToCharArray(), ($rucksack.SubString(($rucksack.Length/2),($rucksack.Length/2))).ToCharArray()
    $commonItemsPriority += ($alphabet.IndexOf((Compare-Object $compartment1 $compartment2 -CaseSensitive -IncludeEqual | Where-Object {$_.SideIndicator -eq "=="} | Select-Object -ExpandProperty InputObject -First 1)) + 1)
}
Write-Host "Priority score for all misplaced items is $commonItemsPriority"
$groupBadgePriority = 0
For ($i = 0; $i -lt $rucksacks.Length; $i+=3) {
    $j = $i + 2
    $currentGroup = $rucksacks[$i..$j]
    $rucksack1, $rucksack2, $rucksack3 = $currentGroup.Split("\n")
    $compare1 = Compare-Object $rucksack1.ToCharArray() $rucksack2.ToCharArray() -CaseSensitive -IncludeEqual | Where-object {$_.SideIndicator -eq "=="} | Select-Object -ExpandProperty InputObject
    $groupBadgePriority += ($alphabet.IndexOf((Compare-Object $rucksack3.ToCharArray() $compare1 -CaseSensitive -IncludeEqual | Where-Object {$_.SideIndicator -eq "=="} | Select-Object -ExpandProperty InputObject -First 1)) + 1)
}
Write-Host "Priority score for all group badges is $groupBadgePriority"