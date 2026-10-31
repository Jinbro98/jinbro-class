# jinbro-class class coach installer for Windows PowerShell. No git needed.
#   irm https://raw.githubusercontent.com/Jinbro98/jinbro-class/main/install.ps1 | iex
# Installs to %USERPROFILE%\.claude\skills\jinbro-class (replaces an older copy).
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
try { [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12 } catch {}

$repo = 'Jinbro98/jinbro-class'
$branch = if ($env:JINBRO_CLASS_BRANCH) { $env:JINBRO_CLASS_BRANCH } else { 'main' }
$base = if ($env:CLAUDE_CONFIG_DIR) { $env:CLAUDE_CONFIG_DIR } else { Join-Path $HOME '.claude' }
$dest = if ($env:JINBRO_CLASS_DEST) { $env:JINBRO_CLASS_DEST } else { Join-Path $base 'skills\jinbro-class' }

$tmp = Join-Path ([IO.Path]::GetTempPath()) ('jinbro-class-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $tmp | Out-Null
try {
    Write-Host 'Downloading the class coach...'
    $zip = Join-Path $tmp 'repo.zip'
    Invoke-WebRequest -UseBasicParsing -Uri "https://github.com/$repo/archive/refs/heads/$branch.zip" -OutFile $zip
    Expand-Archive -LiteralPath $zip -DestinationPath $tmp -Force
    $src = Get-ChildItem -LiteralPath $tmp -Directory -Recurse |
        Where-Object { $_.Name -eq 'jinbro-class' -and $_.Parent.Name -eq 'skills' } |
        Select-Object -First 1
    if (-not $src -or -not (Test-Path -LiteralPath (Join-Path $src.FullName 'SKILL.md'))) {
        throw 'Download failed. Check the internet connection and run again.'
    }
    $parent = Split-Path -Parent $dest
    New-Item -ItemType Directory -Force -Path $parent | Out-Null
    if (Test-Path -LiteralPath $dest) { Remove-Item -LiteralPath $dest -Recurse -Force }
    Copy-Item -LiteralPath $src.FullName -Destination $dest -Recurse
    Write-Host "Installed: $dest"
    Write-Host 'Next: in the Claude app Code tab, open a new session (+ New) and type /jinbro-class'
}
finally {
    Remove-Item -LiteralPath $tmp -Recurse -Force -ErrorAction SilentlyContinue
}
