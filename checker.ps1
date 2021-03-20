# Compile
mkdir ./build
javac -d ./build ./src/*.java
# Now run each test
$FileCounter = 1
while ($true) {
    $InputPath = -join("./in/in", $FileCounter, ".txt")
    if (![System.IO.File]::Exists($InputPath)) {
        break
    }
    Write-Host "Checking in$FileCounter.txt..."
    # Run the code and get the result
    $OutputPath = -join("./out/out", $FileCounter, ".txt")
    $OutputData = Get-Content $InputPath | java -classpath ./build Main
    $DiffData = Compare-Object ($OutputData) (Get-Content $OutputPath)
    if ($DiffData) {
        $OutputDiffPath = -join("./out-diff/out", $FileCounter, ".txt")
        $OutputData | Out-File $OutputDiffPath
    }
    $FileCounter++
}
# Cleanup
Remove-Item -Force -Recurse ./build