# Day 8 - Treetop Tree House
# Puzzle solve solution
$grove = Get-Content ./2022/day08/input.txt
$visible = ($grove[0].Length * 2) + (($grove.Length - 2) * 2)
$highScore = 0
For ($x = 1; $x -lt ($grove.Length - 1); $x++) {
    For ($y = 1; $y -lt ($grove[0].Length - 1); $y++) {
        $currentTree = [int]::parse($grove[$y][$x])
        $arrayLeft = $grove[$y][0..($x - 1)]
        $arrayLeft = ForEach ($number in $arrayLeft) {
            [int]::parse($number)
        }
        $arrayRight = $grove[$y][($x + 1)..($grove[0].Length - 1)]
        $arrayRight = ForEach ($number in $arrayRight) {
            [int]::parse($number)
        }
        $arrayTop = @()
        $up = $y
        Do {
            $up = $up - 1
            $arrayTop += [int]::parse($grove[$up][$x])
        } Until ($up -eq 0)
        $arrayBottom = @()
        $down = $y
        Do {
            $down = $down + 1
            $arrayBottom += [int]::parse($grove[$down][$x])
        } Until ($down -eq ($grove.Length - 1))
        If ((($arrayLeft | Measure-Object -Maximum)).Maximum -lt $currentTree -Or
            (($arrayRight | Measure-Object -Maximum)).Maximum -lt $currentTree -Or
            (($arrayTop | Measure-Object -Maximum)).Maximum -lt $currentTree -Or
            (($arrayBottom | Measure-Object -Maximum)).Maximum -lt $currentTree
            ) {
                $visible += 1
        }
        $seenLeft=$seenRight=$seenTop=$seenBottom = 0
        [array]::Reverse($arrayLeft)
        ForEach ($tree in $arrayLeft) {
            $seenLeft += 1
            If ($tree -ge $currentTree) {
                Break
            }
        }
        ForEach ($tree in $arrayRight) {
            $seenRight += 1
            If ($tree -ge $currentTree) {
                Break
            }
        }
        ForEach ($tree in $arrayTop) {
            $seenTop += 1
            If ($tree -ge $currentTree) {
                Break
            }
        }
        ForEach ($tree in $arrayBottom) {
            $seenBottom += 1
            If ($tree -ge $currentTree) {
                Break
            }
        }
        $scenicScore = $seenLeft * $seenRight * $seenTop * $seenBottom
        If ($scenicScore -gt $highScore) {
            $highScore = $scenicScore
        }
    }
}
Write-Host "Number of trees visible = $visible"
Write-Host "Highest scenic score for individual tree = $highScore"