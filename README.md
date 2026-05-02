# Secure File Sharing Tool

## Overview
This project implements a secure file sharing system using encryption and integrity verification.

## Features
- Encryption using age
- Decryption using private key
- SHA-256 checksum verification
- Simulated secure transfer
- Logging of transfer status

## Technologies Used
- Bash scripting
- age
- sha256sum
- Git

## Setup

Install required tools:
sudo apt install age openssh-client

Generate key:
age-keygen -o agekey.txt

## Usage

Send file:
./send.sh test.txt localhost age1xxxxxxxx

Receive file:
./receive.sh receiver/test.txt.age agekey.txt CHECKSUM

## Output
- Encrypted file (.age)
- Decrypted file
- transfer.log

## Notes
- Transfer is simulated locally
- Keep private key safe

## Author
Divagar N
