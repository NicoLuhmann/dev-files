#!/bin/bash

# set script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Source utils.sh from parent directory
source "$SCRIPT_DIR/utils/utils.sh"

install_packages libfuse2t64 curl git tar stow timeshift tmux

source "$SCRIPT_DIR/source/docker.sh"
source "$SCRIPT_DIR/source/neovim.sh"
source "$SCRIPT_DIR/source/vscode.sh"
source "$SCRIPT_DIR/source/obsidian.sh"
source "$SCRIPT_DIR/source/starship.sh"
source "$SCRIPT_DIR/source/nerdFonts.sh"
source "$SCRIPT_DIR/source/wezterm.sh"
source "$SCRIPT_DIR/source/todoist.sh"
source "$SCRIPT_DIR/source/gnomeSetup.sh"
source "$SCRIPT_DIR/source/brave.sh"
source "$SCRIPT_DIR/source/lazygit.sh"


# initial stow
cd ~/dev-files
stow .
