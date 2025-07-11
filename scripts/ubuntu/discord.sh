#!/bin/bash

sudo apt-get update
sudo apt-get install -y wget

wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
if [ $? -ne 0 ]; then
    echo "Failed to download Discord."
    exit 1
fi
sudo apt install -y ./discord.deb
sudo rm discord.deb
