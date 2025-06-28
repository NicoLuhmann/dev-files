#!/bin/bash

# set script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Source utils.sh from parent directory
source "$SCRIPT_DIR/utils.sh"

# Get Ubuntu version
UBUNTU_VERSION=$(lsb_release -rs)

# install common packages
install_packages curl git tar stow timeshift tmux wget htop
if [[ "$UBUNTU_VERSION" == "22.04" ]]; then
  echo "Detected Ubuntu 22.04"
  install_packages libfuse2
elif [[ "$UBUNTU_VERSION" == "24.04" ]]; then
  echo "Detected Ubuntu 24.04"
  install_packages libfuse2t64
else
  echo "Unsupported Ubuntu version: $UBUNTU_VERSION"
  exit 1
fi

source "$SCRIPT_DIR/docker.sh"
source "$SCRIPT_DIR/wezterm.sh"
source "$SCRIPT_DIR/neovim.sh"
source "$SCRIPT_DIR/vscode.sh"
source "$SCRIPT_DIR/obsidian.sh"
source "$SCRIPT_DIR/nerdFonts.sh"
source "$SCRIPT_DIR/starship.sh"
source "$SCRIPT_DIR/todoist.sh"
source "$SCRIPT_DIR/gnomeSetup.sh"
source "$SCRIPT_DIR/chrome.sh"
source "$SCRIPT_DIR/discord.sh"

# initial stow
cd ~/dev-files
stow .
