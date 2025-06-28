#!/bin/bash
set -e

# Install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Add kitty and kitten to PATH
mkdir -p ~/.local/bin
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/bin/
ln -sf ~/.local/kitty.app/bin/kitten ~/.local/bin/

# Add .desktop entries
mkdir -p ~/.local/share/applications
cp ~/.local/kitty.app/share/applications/kitty*.desktop ~/.local/share/applications/

# Fix Exec and Icon paths in desktop files
sed -i "s|Icon=kitty|Icon=$(readlink -f ~/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png)|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=$(readlink -f ~/.local/kitty.app/bin/kitty)|g" ~/.local/share/applications/kitty*.desktop

# Set as default terminal for xdg-terminal
mkdir -p ~/.config
echo 'kitty.desktop' > ~/.config/xdg-terminals.list

# Make kitty the default terminal system-wide (x-terminal-emulator)
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator ~/.local/kitty.app/bin/kitty 50
sudo update-alternatives --set x-terminal-emulator ~/.local/kitty.app/bin/kitty

echo "✅ Kitty is installed and set as the default terminal emulator."
