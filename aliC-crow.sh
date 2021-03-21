#!/bin/bash
TEMP_DIR=$(mktemp -d)
COUNTER=1
while :
do
	[ ! -f "testcase$COUNTER.zip" ] && break
	echo "Extracting testcase$FileCounter.zip..."
	unzip "testcase$COUNTER.zip" -d "$TEMP_DIR"
    mv "$TEMP_DIR/in.txt" "in/in$COUNTER.txt"
    mv "$TEMP_DIR/output.txt" "out/out$COUNTER.txt"
	COUNTER=$((COUNTER+1))
done
# Cleanup
rm -rf $TEMP_DIR