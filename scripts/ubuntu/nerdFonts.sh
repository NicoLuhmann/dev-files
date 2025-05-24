#!/bin/bash

# Define Nerd Font variables
FONT_NAME="FiraCode"
FONT_VERSION="v3.4.0"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/${FONT_VERSION}/${FONT_NAME}.tar.xz"
FONT_DIR="$HOME/.local/share/fonts/${FONT_NAME}"

# Create the font directory if it doesn't exist
mkdir -p "$FONT_DIR"

# Download and extract the font archive directly into the font directory
echo "Downloading and installing ${FONT_NAME} Nerd Font..."
curl -L "$FONT_URL" | tar -xJ -C "$FONT_DIR"

# Refresh the font cache
fc-cache -fv "$FONT_DIR"

echo "${FONT_NAME} Nerd Font installed successfully."