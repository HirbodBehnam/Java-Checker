#!/bin/bash
# Compile
mkdir build
javac -d build src/*.java
# Loop tests
COUNTER=1
while :
do
	[ ! -f "in/in$COUNTER.txt" ] && break
	echo "Checking in$COUNTER.txt..."
	OUTPUT=$(java -classpath ./build Main < "in$COUNTER.txt")
	DIFF=$(diff <(cat "out/out$COUNTER.txt") <(printf "$OUTPUT"))
    [[ DIFF != "" ]] && echo "$OUTPUT" > "out-diff/out$COUNTER.txt..."
	COUNTER=$((COUNTER+1))
done
# Cleanup
rm -rf build