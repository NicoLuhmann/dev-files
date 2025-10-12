#!/bin/bash

sudo apt-get update
sudo apt-get install -y wget

wget "https://cdn.fastly.steamstatic.com/client/installer/steam.deb" -O steam.deb
if [ $? -ne 0 ]; then
    echo "Failed to download Steam."
    exit 1
fi
sudo apt install -y ./steam.deb
sudo rm steam.deb
