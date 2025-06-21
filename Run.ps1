# Define the source file and Temp folder
$sourceFile = "PASTE/WHERE/YOUR/BACKGROUND/IS"
$tempPath = $env:TEMP
$cutoffTime = (Get-Date).AddMinutes(-10)

Write-Host "Searching Temp folder for recent 'icon_background.png' files..."

# Check if the source icon exists
if (Test-Path $sourceFile) {
    # Find matching files modified within the last 10 minutes
    $foundFiles = Get-ChildItem -Path $tempPath -Recurse -Filter "icon_background.png" -ErrorAction SilentlyContinue |
        Where-Object { $_.LastWriteTime -gt $cutoffTime }

    if ($foundFiles.Count -eq 0) {
        Write-Host "No recent matching files found." -ForegroundColor Yellow
    } else {
        foreach ($file in $foundFiles) {
            try {
                Copy-Item -Path $sourceFile -Destination $file.FullName -Force
                Write-Host "Replaced: $($file.FullName)" -ForegroundColor Green
            } catch {
                Write-Warning "Failed to replace: $($file.FullName) - $_"
            }
        }
    }
} else {
    Write-Host "Source file not found: $sourceFile" -ForegroundColor Red
}

Write-Host ""
Write-Host "Done. Press any key to exit..."
$x = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
