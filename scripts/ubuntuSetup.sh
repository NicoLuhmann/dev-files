#!/bin/bash

# set script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Source utils.sh from parent directory
source "$SCRIPT_DIR/utils.sh"

# Get Ubuntu version
UBUNTU_VERSION=$(lsb_release -rs)

# install common packages
install_packages curl git tar stow timeshift tmux wget
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


source "$SCRIPT_DIR/source/docker.sh"
source "$SCRIPT_DIR/source/neovim.sh"
source "$SCRIPT_DIR/source/vscode.sh"
source "$SCRIPT_DIR/source/obsidian.sh"
source "$SCRIPT_DIR/source/nerdFonts.sh"
source "$SCRIPT_DIR/source/starship.sh"
source "$SCRIPT_DIR/source/todoist.sh"
source "$SCRIPT_DIR/source/gnomeSetup.sh"
source "$SCRIPT_DIR/source/lazygit.sh"
source "$SCRIPT_DIR/source/chrome.sh"

# initial stow
cd ~/dev-files
stow .
