# Memento Cursor plugin installer (Windows).
# Downloads the plugin tarball and extracts it into Cursor's local plugin directory.
# Uses only Invoke-WebRequest + tar, both preinstalled on Windows 10 (1803+) and Windows 11.
# No git dependency.
#
# Usage:
#   irm https://mementoagi.com/install-cursor-plugin.ps1 | iex
#   irm https://raw.githubusercontent.com/mementoagi/memento-cursor-plugin/main/install.ps1 | iex

$ErrorActionPreference = 'Stop'

$TarballUrl  = 'https://github.com/mementoagi/memento-cursor-plugin/archive/refs/heads/main.tar.gz'
$Dest        = Join-Path $env:USERPROFILE '.cursor\plugins\local\memento'
$TempTarball = Join-Path $env:TEMP "memento-cursor-plugin-$(Get-Random).tar.gz"

# Sanity checks: tar ships with Windows 10 1803+ and Windows 11.
if (-not (Get-Command tar -ErrorAction SilentlyContinue)) {
    Write-Host 'Error: tar is not available. Requires Windows 10 (1803+) or Windows 11.' -ForegroundColor Red
    exit 1
}

# Wipe any prior install so the new tarball lands cleanly.
if (Test-Path $Dest) {
    Write-Host "Updating Memento Cursor plugin in $Dest ..." -ForegroundColor Cyan
    Remove-Item -Recurse -Force $Dest
} else {
    Write-Host "Installing Memento Cursor plugin to $Dest ..." -ForegroundColor Cyan
}

New-Item -ItemType Directory -Force -Path $Dest | Out-Null

try {
    # Download tarball, then extract with --strip-components=1 to peel off
    # the "memento-cursor-plugin-main/" prefix.
    Invoke-WebRequest -Uri $TarballUrl -OutFile $TempTarball -UseBasicParsing
    tar -xzf $TempTarball --strip-components=1 -C $Dest
} finally {
    if (Test-Path $TempTarball) { Remove-Item $TempTarball -Force }
}

Write-Host 'Memento Cursor plugin installed.' -ForegroundColor Green
Write-Host ''
Write-Host 'Next step:' -ForegroundColor Cyan
Write-Host '  Start a new chat in Cursor and type:  /wake-up'
Write-Host ''
Write-Host '  (Cursor will match it to /mm/wake-up. If the command is not'
Write-Host '   recognized, restart Cursor and try again.)'
Write-Host ''
Write-Host 'If you have not yet installed the MCP server, visit https://mementoagi.com/getting-started'
