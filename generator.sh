#!/bin/bash
# Compile
mkdir build
javac -d build -sourcepath ./src src/*.java
# Loop tests
COUNTER=1
while :
do
	[ ! -f "in/in$COUNTER.txt" ] && break
	echo "Generating in$COUNTER.txt..."
	java -classpath ./build Main < "in/in$COUNTER.txt" > "out/out$COUNTER.txt"
	COUNTER=$((COUNTER+1))
done
# Cleanup
rm -rf build