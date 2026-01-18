# AutoPush.ps1

# Set repo path
$repo = "C:\Users\kannan\Desktop\kannan"

# Change directory to repo
Set-Location $repo

while ($true) {
    # Stage all changes
    git add .

    # Commit changes (skip if no changes)
    $status = git status --porcelain
    if ($status) {
        git commit -m "Auto commit $(Get-Date -Format 'HH:mm:ss')"
        git push origin main
        Write-Host "Pushed at $(Get-Date)"
    } else {
        Write-Host "No changes to push at $(Get-Date)"
    }

    # Wait 30 seconds before next check
    Start-Sleep -Seconds 30
}
