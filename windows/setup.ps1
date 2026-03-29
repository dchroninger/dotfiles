# Windows bootstrap — run in PowerShell as Administrator
# Usage: powershell -ExecutionPolicy Bypass -File setup.ps1

Write-Host "==> Windows dotfiles bootstrap" -ForegroundColor Cyan

# Check for admin rights
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "ERROR: This script must be run as Administrator." -ForegroundColor Red
    exit 1
}

# Winget apps
$apps = @(
    "DevToys-app.DevToys"
    "Microsoft.PowerToys"
    "Obsidian.Obsidian"
    "Inkscape.Inkscape"
    "HTTPie.HTTPie"
    "WinSCP.WinSCP"
    "Microsoft.VisualStudioCode"
    "GhosttyOrg.Ghostty"
)

Write-Host "`n==> Installing applications via winget..." -ForegroundColor Cyan
foreach ($app in $apps) {
    Write-Host "  Installing $app..."
    winget install --id $app --accept-package-agreements --accept-source-agreements --silent
}

# Copy Ghostty config
$repoRoot = Split-Path -Parent $PSScriptRoot
$ghosttySource = Join-Path $repoRoot "home" "dot_config" "ghostty" "config"
$ghosttyDest = Join-Path $env:LOCALAPPDATA "ghostty"

if (Test-Path $ghosttySource) {
    Write-Host "`n==> Copying Ghostty config..." -ForegroundColor Cyan
    New-Item -ItemType Directory -Path $ghosttyDest -Force | Out-Null
    Copy-Item $ghosttySource -Destination (Join-Path $ghosttyDest "config") -Force
    Write-Host "  Config copied to $ghosttyDest\config"
} else {
    Write-Host "  WARNING: Ghostty config not found at $ghosttySource" -ForegroundColor Yellow
}

# WSL setup
Write-Host "`n==> Checking WSL..." -ForegroundColor Cyan
$wslStatus = wsl --list --quiet 2>$null
if (-not $wslStatus) {
    Write-Host "  Installing WSL (Ubuntu)..."
    wsl --install -d Ubuntu
    Write-Host "  WSL installed. Restart your computer to complete setup." -ForegroundColor Yellow
} else {
    Write-Host "  WSL already installed."
}

Write-Host "`n==> Bootstrap complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "  1. Restart your computer (if WSL was just installed)"
Write-Host "  2. Open WSL (Ubuntu)"
Write-Host "  3. Install chezmoi:"
Write-Host "     sh -c '`$(curl -fsLS get.chezmoi.io)'"
Write-Host "  4. Initialize dotfiles:"
Write-Host "     chezmoi init --apply dchroninger"
Write-Host ""
