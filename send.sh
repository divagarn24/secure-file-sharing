#!/bin/bash

FILE=$1
RECIPIENT=$2   # example: user@ip
AGE_KEY=$3     # recipient public key file

if [ ! -f "$FILE" ]; then
    echo "Error: File not found!"
    exit 1
fi

# Step 1: checksum
CHECKSUM=$(sha256sum "$FILE" | awk '{print $1}')
echo "Checksum: $CHECKSUM"

# Step 2: encrypt
age -r "$AGE_KEY" -o "$FILE.age" "$FILE"
if [ $? -ne 0 ]; then
    echo "Encryption failed!"
    exit 1
fi

# Step 3: transfer
cp "$FILE.age" receiver/
if [ $? -ne 0 ]; then
    STATUS="FAILED"
    echo "Transfer failed!"
else
    STATUS="SUCCESS"
    echo "Transfer successful!"
fi

# Step 4: log
echo "$(date -Iseconds) | sender | $RECIPIENT | $FILE | sha256:$CHECKSUM | $STATUS" >> transfer.log
