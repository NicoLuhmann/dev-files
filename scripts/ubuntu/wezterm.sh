#!/bin/bash

curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
sudo chmod 644 /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list

sudo apt-get update
sudo apt-get install -y wezterm

# sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/wezterm 50
# sudo update-alternatives --set x-terminal-emulator /usr/bin/wezterm

gsettings set org.gnome.desktop.default-applications.terminal exec '/usr/bin/wezterm'
