#!/bin/bash

sudo apt update
sudo apt install -y pipx gnome-shell-extensions gnome-shell-extension-manager

# Use 8 fixed workspaces instead of dynamic mode
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 3

# Disable ubuntu desktop icons
gnome-extensions disable ding@rastersoft.com

# Install gnome-extensions-cli only if not already installed
if ! command -v ~/.local/bin/gext &> /dev/null; then
  pipx install gnome-extensions-cli --system-site-packages
fi

EXTENSIONS=(
  "caffeine@patapon.info"
  "switcher@landau.fi"
  "paperwm@paperwm.github.com"
)

for ext in "${EXTENSIONS[@]}"; do
  if ! ~/.local/bin/gext list | grep "$ext" &> /dev/null; then
    echo "Installing extension: $ext"
    ~/.local/bin/gext install "$ext"
  else
    echo "Extension already installed: $ext"
  fi
done

# Now load settings from dconf file
dconf load /org/gnome/shell/ < "$SCRIPT_DIR/../dconf/shell.dconf"
