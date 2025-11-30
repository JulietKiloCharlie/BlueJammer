# PowerShell script to push to GitHub
# Run this after creating your GitHub repository

Write-Host "ESP32-BlueJammer GitHub Push Script" -ForegroundColor Cyan
Write-Host "====================================" -ForegroundColor Cyan
Write-Host ""

# Get GitHub username
$username = Read-Host "Enter your GitHub username"

# Get repository name (default: bluejammer)
$repoName = Read-Host "Enter repository name (default: bluejammer)"
if ([string]::IsNullOrWhiteSpace($repoName)) {
    $repoName = "bluejammer"
}

$repoUrl = "https://github.com/$username/$repoName.git"

Write-Host ""
Write-Host "Repository URL: $repoUrl" -ForegroundColor Yellow
Write-Host ""

# Add remote
Write-Host "Adding remote origin..." -ForegroundColor Green
git remote add origin $repoUrl 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "Remote might already exist. Updating..." -ForegroundColor Yellow
    git remote set-url origin $repoUrl
}

# Push to GitHub
Write-Host "Pushing to GitHub..." -ForegroundColor Green
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✓ Successfully pushed to GitHub!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "1. Go to: https://github.com/$username/$repoName/settings/pages" -ForegroundColor White
    Write-Host "2. Under 'Source', select 'Deploy from a branch'" -ForegroundColor White
    Write-Host "3. Branch: main, Folder: / (root)" -ForegroundColor White
    Write-Host "4. Click Save" -ForegroundColor White
    Write-Host ""
    Write-Host "Your site will be live at:" -ForegroundColor Cyan
    Write-Host "https://$username.github.io/$repoName/ESP32_BlueJammer_Visual_Guide.html" -ForegroundColor Yellow
} else {
    Write-Host ""
    Write-Host "✗ Error pushing to GitHub" -ForegroundColor Red
    Write-Host "Make sure you've created the repository on GitHub first!" -ForegroundColor Yellow
    Write-Host "Create it at: https://github.com/new" -ForegroundColor Yellow
}

