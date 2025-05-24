#!/bin/bash

install_packages jq xclip ripgrep build-essential luarocks 

curl -s https://api.github.com/repos/neovim/neovim/releases/latest | jq -r '.assets[] | select(.name == "nvim-linux-x86_64.appimage") | .browser_download_url' | xargs curl -LO
chmod u+x nvim-linux-x86_64.appimage
sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim