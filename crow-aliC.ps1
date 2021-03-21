function New-TemporaryDirectory {
    $parent = [System.IO.Path]::GetTempPath()
    [string] $name = [System.Guid]::NewGuid()
    New-Item -ItemType Directory -Path (Join-Path $parent $name)
}
$TempDir = New-TemporaryDirectory
# Get each file
$FileCounter = 1
while ($true) {
    $InputPath = -join("./in/in", $FileCounter, ".txt")
    if (!(Test-Path $InputPath)) {
        break
    }
    Write-Host "Creating testcase$FileCounter.zip..."
    Copy-Item -Path "./in/in$FileCounter.txt" -Destination (Join-Path $TempDir "input.txt")
    Copy-Item -Path "./out/out$FileCounter.txt" -Destination (Join-Path $TempDir "output.txt")
    $compress = @{
        Path = "$TempDir/*.txt"
        CompressionLevel = "Fastest"
        DestinationPath = "testcase$FileCounter.Zip"
    }
    Compress-Archive @compress
    Remove-Item -Force -Recurse "$TempDir/*" # clear the files in temp dir
    $FileCounter++
}
# Remove the temp dir
Remove-Item -Force -Recurse $TempDir