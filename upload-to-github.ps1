<#
Simple PowerShell script to initialize a git repo and push to a remote GitHub repo.
Run this from an elevated PowerShell or a developer PowerShell with git installed.
#>
param(
  [string]$RemoteUrl = "https://github.com/kanekirinookami159-coder/Mucahubv2.git",
  [string]$Branch = "main"
)

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
  Write-Error "git is not installed or not found in PATH. Install Git and try again."
  exit 1
}

Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Path) -ErrorAction SilentlyContinue

if (-not (Test-Path .git)) {
  git init
}

git add .
try {
  git commit -m "Initial import" -q
} catch {
  Write-Host "No changes to commit or commit failed: $_"
}

# Add or set remote
$existing = git remote get-url origin 2>$null
if ($LASTEXITCODE -eq 0) {
  Write-Host "Remote 'origin' already exists: $existing"
  Write-Host "To change remote, run: git remote set-url origin <url>"
} else {
  git remote add origin $RemoteUrl
}

# Ensure branch
git branch -M $Branch

Write-Host "Pushing to $RemoteUrl (branch $Branch). You may be prompted for credentials."

git push -u origin $Branch
