#!/bin/bash
TEMP_DIR=$(mktemp -d)
COUNTER=1
while :
do
	[ ! -f "in/in$COUNTER.txt" ] && break
	echo "Creating testcase$COUNTER.zip..."
    cp "in/in$COUNTER.txt" "$TEMP_DIR/in.txt"
    cp "out/out$COUNTER.txt" "$TEMP_DIR/output.txt"
    zip "testcase$COUNTER.zip" "$TEMP_DIR/in.txt" "$TEMP_DIR/output.txt"
    rm "$TEMP_DIR/in.txt" "$TEMP_DIR/output.txt"
	COUNTER=$((COUNTER+1))
done
# Cleanup
rm -rf "$TEMP_DIR"