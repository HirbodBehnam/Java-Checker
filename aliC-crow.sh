#!/bin/bash
TEMP_DIR=$(mktemp -d)
COUNTER=1
while :
do
	[ ! -f "testcase_$COUNTER.zip" ] && break
	echo "Extracting testcase_$COUNTER.zip..."
	unzip "testcase_$COUNTER.zip" -d "$TEMP_DIR"
    mv "$TEMP_DIR/input.txt" "in/in$COUNTER.txt"
    mv "$TEMP_DIR/output.txt" "out/out$COUNTER.txt"
	COUNTER=$((COUNTER+1))
done
# Cleanup
rm -rf "$TEMP_DIR"