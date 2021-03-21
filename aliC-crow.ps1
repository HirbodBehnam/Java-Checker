function New-TemporaryDirectory {
    $parent = [System.IO.Path]::GetTempPath()
    [string] $name = [System.Guid]::NewGuid()
    New-Item -ItemType Directory -Path (Join-Path $parent $name)
}
$TempDir = New-TemporaryDirectory
# Get each file
$FileCounter = 1
while ($true) {
    $InputPath = -join("./testcase", $FileCounter, ".zip")
    if (!(Test-Path $InputPath)) {
        break
    }
    Write-Host "Extracting testcase$FileCounter.zip..."
    Expand-Archive -LiteralPath $InputPath -DestinationPath $TempDir # extract in temp dir
    Move-Item -Path (Join-Path $TempDir "input.txt") -Destination "./in/in$FileCounter.txt"
    Move-Item -Path (Join-Path $TempDir "output.txt") -Destination "./out/out$FileCounter.txt"
    $FileCounter++
}
# Remove the temp dir
Remove-Item -Force -Recurse $TempDir