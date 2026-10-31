# Install the morning practice files into the practice folder (Windows PowerShell).
#   powershell -NoProfile -ExecutionPolicy Bypass -File <skill folder>\scripts\setup.ps1 [target folder]
# Existing files are kept. Only the coach copy folder (...\jinbro-class) is replaced.
# Korean file names are built from character codes so this file stays ASCII.
param([string]$Target = (Get-Location).Path)
$ErrorActionPreference = 'Stop'
function K([int[]]$c) { -join ($c | ForEach-Object { [char]$_ }) }
$S = Split-Path -Parent $PSScriptRoot
New-Item -ItemType Directory -Force -Path $Target | Out-Null
$T = (Resolve-Path -LiteralPath $Target).Path
function Put($from, $to) {
    $dst = Join-Path $T $to
    if (Test-Path -LiteralPath $dst) { Write-Host "kept (exists): $to" }
    else { Copy-Item -LiteralPath (Join-Path $S $from) -Destination $dst; Write-Host "created: $to" }
}
$DIR = (K 51088,47308)
$BRO = (K 51088,47308,92,50500,52840,44208,95,49548,44060,49436,46,109,100)
$REV = (K 51088,47308,92,44256,44061,54980,44592,46,109,100)
$INT = (K 51088,47308,92,44256,44061,51064,53552,48624,46,109,100)
$PACK = (K 54532,47212,54532,53944,54057,46,109,100)
$GUIDE = (K 49892,49845,50504,45236,46,109,100)
$COACHDIR = (K 49688,50629,53076,52824)
New-Item -ItemType Directory -Force -Path (Join-Path $T $DIR), (Join-Path $T '.claude') | Out-Null
Put 'assets\sample\brochure.md' $BRO
Put 'assets\sample\reviews.md' $REV
Put 'assets\sample\interviews.md' $INT
Put 'references\prompt-pack.md' $PACK
Put 'assets\practice\README.md' $GUIDE
Put 'assets\practice\settings.json' '.claude\settings.json'
$coach = Join-Path (Join-Path $T $COACHDIR) 'jinbro-class'
if ((Resolve-Path -LiteralPath $S).Path -ne $coach) {
    New-Item -ItemType Directory -Force -Path (Join-Path $T $COACHDIR) | Out-Null
    if (Test-Path -LiteralPath $coach) { Remove-Item -LiteralPath $coach -Recurse -Force }
    Copy-Item -LiteralPath $S -Destination $coach -Recurse
    Write-Host "created: $COACHDIR\jinbro-class (coach copy)"
}
Write-Host "Done: morning practice files are in $T"
