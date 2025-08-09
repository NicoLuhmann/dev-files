#!/bin/bash

sudo apt-get update
sudo apt-get install -y \
  curl \
  tar \
  gzip

arch=$(uname -m)

declare -A lazygit_archives=(
  ["x86_64"]="Linux_x86_64"
  ["aarch64"]="Linux_arm64"
)

if [[ -n "${lazygit_archives[$arch]}" ]]; then
  # Install latest lazygit
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": *"v\K[^"]*')
  LAZYGIT_ARCHIVE="${lazygit_archives[$arch]}"
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_${LAZYGIT_ARCHIVE}.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit -D -t /usr/local/bin/
  rm lazygit.tar.gz lazygit
  echo "Lazygit installed successfully."
else
  echo "Unsupported architecture: $arch"
  if [[ -z "${lazygit_archives[$arch]}" ]]; then
    echo "No lazygit archive available for $arch"
  fi
  exit 1
fi
