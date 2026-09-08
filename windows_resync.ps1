#Requires -Version 5.1
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repoRoot = $PSScriptRoot

# Re-copy nvim config
$nvimSource = Join-Path $repoRoot 'nvim\.config\nvim'
$nvimTarget = "$env:LOCALAPPDATA\nvim"
Write-Host "Syncing nvim config..."
if (Test-Path $nvimTarget) {
    Remove-Item $nvimTarget -Recurse -Force
}
Copy-Item $nvimSource -Destination $nvimTarget -Recurse

# Re-copy tmux config
Write-Host "Syncing tmux config..."
Copy-Item (Join-Path $repoRoot 'tmux\.tmux.conf.windows') "$HOME\.tmux.conf" -Force

# Sync lazy.nvim plugins
Write-Host "Syncing lazy.nvim plugins..."
nvim --headless "+Lazy! clean" +qa
nvim --headless "+Lazy! sync" +qa

Write-Host ""
Write-Host "Done!"
