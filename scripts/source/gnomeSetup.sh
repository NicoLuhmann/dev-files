#!/bin/bash

install_packages pipx gnome-shell-extensions gnome-shell-extension-manager

# Use 8 fixed workspaces instead of dynamic mode
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 8

# Unset super+number
gsettings set org.gnome.shell.keybindings switch-to-application-1 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-2 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-3 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-4 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-5 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-6 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-7 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-8 "[]"
gsettings set org.gnome.shell.keybindings switch-to-application-9 "[]"

# disable activate window menu keybind - maybe rebind 
gsettings set org.gnome.desktop.wm.keybindings activate-window-menu "[]"

# Disable ubuntu dock
gnome-extensions disable ubuntu-dock@ubuntu.com

# theme and wallpaper
gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
gsettings set org.gnome.desktop.background picture-uri "file://${SCRIPT_DIR}/utils/mango.png"
gsettings set org.gnome.desktop.background picture-options "scaled"


# Install gnome-extensions-cli only if not already installed
if ! command -v ~/.local/bin/gext &> /dev/null; then
  pipx install gnome-extensions-cli --system-site-packages
fi

EXTENSIONS=(
  "tactile@lundal.io"
  "space-bar@luchrioh"
  "tophat@fflewddur.github.io"
  "switcher@landau.fi"
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
dconf load /org/gnome/shell/extensions/ < "$SCRIPT_DIR/utils/extensionSettings.dconf"