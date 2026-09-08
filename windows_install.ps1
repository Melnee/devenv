#Requires -Version 5.1
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repoRoot = $PSScriptRoot

function Install-WingetPackage {
    param([string]$Id, [string]$Name)
    Write-Host "Installing $Name..."
    winget install --id $Id --silent --accept-package-agreements --accept-source-agreements
    $global:LASTEXITCODE = 0
}

# Check for winget
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Error "winget is not available. Install the App Installer from the Microsoft Store and re-run."
    exit 1
}

# Install dependencies
Install-WingetPackage 'Git.Git'            'Git'
Install-WingetPackage 'Neovim.Neovim'      'Neovim'
Install-WingetPackage 'BurntSushi.ripgrep.MSVC' 'ripgrep'
Install-WingetPackage 'sharkdp.fd'         'fd'
Install-WingetPackage 'OpenJS.NodeJS.LTS'  'Node.js'

# Refresh PATH so npm is available immediately
$env:PATH = [System.Environment]::GetEnvironmentVariable('PATH', 'Machine') + ';' +
            [System.Environment]::GetEnvironmentVariable('PATH', 'User')

# Install PSMux from GitHub releases
Write-Host "Installing PSMux..."
try {
    $release = Invoke-RestMethod 'https://api.github.com/repos/psmux/psmux/releases/latest'
    $asset = $release.assets | Where-Object { $_.name -match 'windows' -and $_.name -match 'x86_64' -and $_.name -match '\.zip$' } | Select-Object -First 1
    if (-not $asset) {
        # fallback: grab the first zip
        $asset = $release.assets | Where-Object { $_.name -match '\.zip$' } | Select-Object -First 1
    }
    if ($asset) {
        $tmpZip = "$env:TEMP\psmux.zip"
        Write-Host "  Downloading $($asset.name)..."
        Invoke-WebRequest $asset.browser_download_url -OutFile $tmpZip
        $psmuxDir = "$env:LOCALAPPDATA\psmux"
        Expand-Archive $tmpZip -DestinationPath $psmuxDir -Force
        Remove-Item $tmpZip
        $userPath = [Environment]::GetEnvironmentVariable('PATH', 'User')
        if ($userPath -notlike "*$psmuxDir*") {
            [Environment]::SetEnvironmentVariable('PATH', "$userPath;$psmuxDir", 'User')
        }
        Write-Host "  PSMux installed to $psmuxDir"
    } else {
        Write-Warning "No zip asset found in the latest PSMux release. Install manually: https://github.com/psmux/psmux/releases"
    }
} catch {
    Write-Warning "Could not fetch PSMux release: $_`nInstall manually: https://github.com/psmux/psmux/releases"
}

# Install tree-sitter-cli
Write-Host "Installing tree-sitter-cli..."
npm install -g tree-sitter-cli

# Deploy nvim config to %LOCALAPPDATA%\nvim (where nvim looks on Windows)
$nvimSource = Join-Path $repoRoot 'nvim\.config\nvim'
$nvimTarget = "$env:LOCALAPPDATA\nvim"
Write-Host "Copying nvim config to $nvimTarget..."
if (Test-Path $nvimTarget) {
    Remove-Item $nvimTarget -Recurse -Force
}
Copy-Item $nvimSource -Destination $nvimTarget -Recurse

# Deploy Windows tmux config
Write-Host "Copying tmux config..."
Copy-Item (Join-Path $repoRoot 'tmux\.tmux.conf.windows') "$HOME\.tmux.conf" -Force

$installCopilot = Read-Host "Install GitHub Copilot? [y/N]"
if ($installCopilot -match '^[Yy]') {
    New-Item -ItemType File -Path "$HOME\.copilot_enabled" -Force | Out-Null
}

Write-Host ""
Write-Host "Done!"
Write-Host "Open a new terminal, run: tmux"
Write-Host "Remember to set JetBrainsMono Nerd Font in your Windows Terminal settings!"
