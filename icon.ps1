$fileName = "icon_background.png"
$sourcePath = "C:\Users\brina\Desktop\RustSkinsBackgrounds\icon_background.png"
$tempPath = $env:TEMP

Write-Host "Checking for source file..."
if (-not (Test-Path $sourcePath)) {
    Write-Host "Source file not found: $sourcePath"
    return
}

$replaced = $false

while (-not $replaced) {
    Write-Host "Scanning for '$fileName'..."

    $foundFiles = Get-ChildItem -Path $tempPath -Recurse -Filter $fileName -ErrorAction SilentlyContinue

    if ($foundFiles.Count -gt 0) {
        foreach ($file in $foundFiles) {
            try {
                Copy-Item -Path $sourcePath -Destination $file.FullName -Force
                Write-Host "Replaced: $($file.FullName)"
                $replaced = $true
            } catch {
                Write-Host "Failed to replace: $($file.FullName) - $_"
            }
        }
    } else {
        Start-Sleep -Seconds 2
    }
}

Write-Host "Done. Press any key to exit..."
$x = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")