#!/bin/bash

# set script directory
SCRIPT_DIR="${SCRIPT_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"

# install common packages
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y curl git tar stow timeshift tmux wget htop libfuse2t64 webp

source "$SCRIPT_DIR/browser.sh"
source "$SCRIPT_DIR/code.sh"
source "$SCRIPT_DIR/docker.sh"
source "$SCRIPT_DIR/ghostty.sh"
source "$SCRIPT_DIR/starship.sh"
source "$SCRIPT_DIR/todoist.sh"
source "$SCRIPT_DIR/gnomeSetup.sh"
source "$SCRIPT_DIR/discord.sh"
source "$SCRIPT_DIR/onlyoffice.sh"
source "$SCRIPT_DIR/zathura.sh"
source "$SCRIPT_DIR/disableEmojiPicker.sh"
source "$SCRIPT_DIR/lazygit.sh"
source "$SCRIPT_DIR/neovim.sh"

"$SCRIPT_DIR/addToBashrc.sh" 'export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"'

# initial stow
cd ~/dev-files
stow .
