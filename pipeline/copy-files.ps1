# Inspired by:
# https://medium.com/microsoftazure/ingest-data-into-microsoft-onelake-using-azcopy-a6e0e199feee
param (
    [string]$workingDirectory,
    [string]$lakeDestination = "https://onelake.dfs.fabric.microsoft.com/orchestrate_utilities_dev/SomeLakehouse.Lakehouse/Files/PythonUtilities/"
)

# Test if AzCopy.exe exists in current folder
$WantFile = "azcopy.exe"
$AzCopyExists = Test-Path $WantFile
Write-Output ("AzCopy exists: {0}" -f $AzCopyExists)

# Download AzCopy if it doesn't exist
If ($AzCopyExists -eq $False) {
    Write-Output "AzCopy not found. Downloading..."

    #Download AzCopy
    Invoke-WebRequest -Uri "https://aka.ms/downloadazcopy-v10-windows" -OutFile AzCopy.zip -UseBasicParsing

    #Expand Archive
    Write-Output "Expanding archive...`n"
    Expand-Archive ./AzCopy.zip ./AzCopy -Force

    # Copy AzCopy to current dir
    Get-ChildItem ./AzCopy/*/azcopy.exe | Copy-Item -Destination "./azcopy.exe"
}
else {
    Write-Output "AzCopy found, skipping download.`n"
}

# Copy the storage account
Write-Host ".\azcopy.exe copy $workingDirectory/dist/*.whl  --recursive --overwrite 'ifSourceNewer'"
.\azcopy.exe copy "$workingDirectory/dist/*.whl" $lakeDestination  --trusted-microsoft-suffixes=onelake.dfs.fabric.microsoft.com --log-level=DEBUG
