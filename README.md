# CrowdStrike
CrowdStrike BSOD Fix

use this short link for opening the repo https://rka.li/cs

Steps to Fix:
1. boot into safe mode with networking enabled.
2. execute this command

```powershell
Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/rohitkumarankam/CrowdStrike/main/CrowdStrike.ps1" -UseBasicParsing).Content
```

if script execution is blocked, then copy this and run in Powershell ISE

```powershell
$directory = "C:\Windows\System32\drivers\CrowdStrike"

# Get the list of files matching the pattern C-00000291*.sys
$files = Get-ChildItem -Path $directory -Filter "C-00000291*.sys"

# Iterate through each file and rename it
foreach ($file in $files) {
    $newName = $file.Name + ".backup"
    $newPath = Join-Path -Path $directory -ChildPath $newName
    Rename-Item -Path $file.FullName -NewName $newName -Force
    Write-Output "Renamed $($file.Name) to $newName"
}
```
