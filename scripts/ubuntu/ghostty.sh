#!/bin/bash

sudo snap install ghostty --classic

# Register Ghostty as an alternative and set as default terminal emulator
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /snap/ghostty/current/bin/ghostty 50
sudo update-alternatives --set x-terminal-emulator /snap/ghostty/current/bin/ghostty
