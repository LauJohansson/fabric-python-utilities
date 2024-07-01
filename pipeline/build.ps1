$srcDir = "$PSScriptRoot/.."

Write-Host "Navigating to the source directory: $srcDir"
Push-Location -Path $srcDir

# We want a really clean build (even locally)
Write-Host "Cleaning previous build artifacts..."

if (Test-Path -Path dist)
{
    Write-Host "Removing 'dist' directory..."
    Remove-Item -Force -Recurse dist
}
else
{
    Write-Host "'dist' directory does not exist."
}

if (Test-Path -Path build)
{
    Write-Host "Removing 'build' directory..."
    Remove-Item -Force -Recurse build
}
else
{
    Write-Host "'build' directory does not exist."
}

if (Test-Path -Path src\fabricutilities.egg-info)
{
    Write-Host "Removing 'src\fabricutilities.egg-info' directory..."
    Remove-Item -Force -Recurse src\fabricutilities.egg-info
}
else
{
    Write-Host "'src\fabricutilities.egg-info' directory does not exist."
}

Write-Host "Cleaning Python cache files with pyclean..."
pyclean -v .

Write-Host "Building the Python package..."
python -m build

Write-Host "Returning to the original directory"
Pop-Location
