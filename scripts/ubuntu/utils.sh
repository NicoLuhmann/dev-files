#!/bin/bash

# Function to check if a package is installed
is_installed() {
  dpkg -s "$1" &> /dev/null
}

# Function to install packages if not already installed
install_packages() {
  local packages=("$@")
  local to_install=()

  for pkg in "${packages[@]}"; do
    if ! is_installed "$pkg"; then
      to_install+=("$pkg")
    fi
  done

  if [ ${#to_install[@]} -eq 0 ]; then
    echo "All packages are already installed."
    return
  fi
  sudo apt update -y

  if [ ${#to_install[@]} -ne 0 ]; then
    echo "Installing: ${to_install[*]}"
    sudo apt install -y "${to_install[@]}"
  fi
}