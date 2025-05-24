#!/bin/bash

install_packages pavucontrol
if [[ "$UBUNTU_VERSION" == "24.04" ]]; then
    install_packages qpwgraph
fi

wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
if [ $? -ne 0 ]; then
    echo "Failed to download Discord."
    exit 1
fi
sudo apt install -y ./discord.deb
sudo rm discord.deb