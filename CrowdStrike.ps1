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