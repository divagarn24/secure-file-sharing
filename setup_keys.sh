#!/bin/bash

echo "Generating SSH key..."
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ""

echo "Keys generated."
echo "Public key:"
cat ~/.ssh/id_ed25519.pub

echo "Share this public key with recipient."
