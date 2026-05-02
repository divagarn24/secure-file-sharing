#!/bin/bash

FILE=$1
PRIVATE_KEY=$2
ORIGINAL_CHECKSUM=$3

if [ ! -f "$FILE" ]; then
    echo "Encrypted file not found!"
    exit 1
fi

# Step 1: decrypt
age -d -i "$PRIVATE_KEY" -o "decrypted_$FILE" "$FILE"
if [ $? -ne 0 ]; then
    echo "Decryption failed!"
    exit 1
fi

# Step 2: verify checksum
NEW_CHECKSUM=$(sha256sum "decrypted_$FILE" | awk '{print $1}')

echo "Original: $ORIGINAL_CHECKSUM"
echo "New: $NEW_CHECKSUM"

if [ "$NEW_CHECKSUM" == "$ORIGINAL_CHECKSUM" ]; then
    echo "Integrity Verified "
else
    echo "File Tampered "
fi
