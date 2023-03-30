Copy-Item -Path "D:\Desktop\fullbackup\NFO\*" -Destination "D:\Desktop\sync\NFO\" -Recurse

# Set the folder path where the files are located
$folderPath = "D:\Desktop\sync\NFO\"

# Get all files in the folder sorted by creation time
$files = Get-ChildItem $folderPath | Sort-Object CreationTime

# Delete all files except for the last one
for ($i = 0; $i -lt ($files.Count - 1); $i++) {
    Remove-Item $files[$i].FullName
}

scp -r D:\Desktop\sync\NFO\ root@10.0.1.237:/tmp/sync/
