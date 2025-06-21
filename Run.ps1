# Define the source files and Temp folder
$sourceFiles = @(
    @{ Name = "icon_background.png"; Path = "PASTE/YOUR/BACKGROUND/PATH/HERE" },
    @{ Name = "icon.png"; Path = "PASTE/YOUR/BACKGROUND/PATH/HERE" }
)
$tempPath = $env:TEMP
$cutoffTime = (Get-Date).AddMinutes(-10)

foreach ($source in $sourceFiles) {
    $fileName = $source.Name
    $sourcePath = $source.Path

    Write-Host "Searching Temp folder for recent '$fileName' files..."

    # Check if the source file exists
    if (Test-Path $sourcePath) {
        # Find matching files modified within the last 10 minutes
        $foundFiles = Get-ChildItem -Path $tempPath -Recurse -Filter $fileName -ErrorAction SilentlyContinue |
            Where-Object { $_.LastWriteTime -gt $cutoffTime }

        if ($foundFiles.Count -eq 0) {
            Write-Host "No recent matching files found for '$fileName'." -ForegroundColor Yellow
        } else {
            foreach ($file in $foundFiles) {
                try {
                    Copy-Item -Path $sourcePath -Destination $file.FullName -Force
                    Write-Host "Replaced: $($file.FullName)" -ForegroundColor Green
                } catch {
                    Write-Warning "Failed to replace: $($file.FullName) - $_"
                }
            }
        }
    } else {
        Write-Host "Source file not found: $sourcePath" -ForegroundColor Red
    }

    Write-Host ""
}

Write-Host "Done. Press any key to exit..."
$x = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")