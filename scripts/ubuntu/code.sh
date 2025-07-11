#!/bin/bash
echo "Starting Visual Studio Code installation..."
echo "Installing wget, gnupg, and apt-transport-https..."
sudo apt-get update
sudo apt-get install -y wget gnupg apt-transport-https

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/packages.microsoft.gpg > /dev/null
sudo chmod 644 /etc/apt/keyrings/packages.microsoft.gpg # Ensure correct permissions

echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null

sudo apt-get update
sudo apt-get install -y code