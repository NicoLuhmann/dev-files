#!/bin/bash

# Update package lists to ensure latest versions
sudo apt update

# Install curl if not already installed
sudo apt install -y curl

# Download and run the Ghostty installer script for Ubuntu (installs via .deb)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"

# Register Ghostty as an alternative for the system terminal emulator
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/ghostty 50

# Set Ghostty as the default terminal emulator
sudo update-alternatives --set x-terminal-emulator /usr/bin/ghostty
