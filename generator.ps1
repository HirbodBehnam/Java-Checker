# Compile
mkdir ./build
javac -d ./build -sourcepath ./src ./src/*.java
# Now run each test
$FileCounter = 1
while ($true) {
    $InputPath = -join("./in/in", $FileCounter, ".txt")
    if (![System.IO.File]::Exists($InputPath)) {
        break
    }
    Write-Host "Generating in$FileCounter.txt..."
    # Run the code and get the result
    $OutputPath = -join("./out/out", $FileCounter, ".txt")
    Get-Content $InputPath | java -classpath ./build Main > $OutputPath
    $FileCounter++
}
# Cleanup
Remove-Item -Force -Recurse ./build