#!/bin/bash

# set script directory
SCRIPT_DIR="${SCRIPT_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"

# install common packages
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y curl git tar stow tmux wget htop libfuse2t64 ripgrep

# Helper: ask yes/no before sourcing a script
# By default (including non-interactive shells) the script will SKIP installations
# unless the env var FORCE_INSTALL is set to a truthy value (yes/1/true).
ask_and_source() {
	local script_path="$1"

	# If FORCE_INSTALL is set to a truthy value, install without prompting
	case "${FORCE_INSTALL:-}" in
		1|[Yy]es|[Yy][Ee][Ss]|[Tt]rue|[Tt])
			echo "FORCE_INSTALL set; installing $(basename "$script_path")"
			source "$script_path"
			return
			;;
	esac

	# If we're not attached to a TTY (non-interactive), default to SKIP
	if [[ ! -t 0 ]]; then
		echo "Non-interactive shell detected; skipping $(basename "$script_path") (set FORCE_INSTALL=1 to override)"
		return
	fi

	while true; do
		read -rp "Install from $(basename "$script_path")? [y/N]: " ans
		case "$ans" in
			[Yy]|[Yy][Ee][Ss])
				source "$script_path"
				break
				;;
			[Nn]|[Nn][Oo]|"")
				echo "Skipping $(basename "$script_path")"
				break
				;;
			*)
				echo "Please answer y or n."
				;;
		esac
	done
}

ask_and_source "$SCRIPT_DIR/browser.sh"
ask_and_source "$SCRIPT_DIR/audioControl.sh"
ask_and_source "$SCRIPT_DIR/folderStructure.sh"
ask_and_source "$SCRIPT_DIR/code.sh"
ask_and_source "$SCRIPT_DIR/jetBrainsMonoNerdFont.sh"
ask_and_source "$SCRIPT_DIR/docker.sh"
ask_and_source "$SCRIPT_DIR/ghostty.sh"
ask_and_source "$SCRIPT_DIR/starship.sh"
ask_and_source "$SCRIPT_DIR/steam.sh"
ask_and_source "$SCRIPT_DIR/gnomeSetup.sh"
ask_and_source "$SCRIPT_DIR/discord.sh"
ask_and_source "$SCRIPT_DIR/onlyoffice.sh"
ask_and_source "$SCRIPT_DIR/zathura.sh"
ask_and_source "$SCRIPT_DIR/disableEmojiPicker.sh"
# lazygit is included in neovim.sh right now
# ask_and_source "$SCRIPT_DIR/lazygit.sh"
ask_and_source "$SCRIPT_DIR/neovim.sh"

"$SCRIPT_DIR/addToBashrc.sh" 'export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"'

# initial stow
cd ~/dev-files
stow .
