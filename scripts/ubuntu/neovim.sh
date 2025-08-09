#!/bin/bash
# Install dependencies
sudo apt-get update
sudo apt-get install -y \
  curl \
  git \
  xclip \
  wl-clipboard \
  ripgrep \
  build-essential \
  gzip \
  tar

# Install Neovim
NVIM_VERSION="0.11.3"
arch=$(uname -m)

declare -A nvim_archives=(
  ["x86_64"]="nvim-linux-x86_64"
  ["aarch64"]="nvim-linux-arm64"
)

if [[ -n "${nvim_archives[$arch]}" ]]; then
  # Install neovim
  NVIM_ARCHIVE="${nvim_archives[$arch]}"
  curl -LO "https://github.com/neovim/neovim/releases/download/v${NVIM_VERSION}/${NVIM_ARCHIVE}.tar.gz"
  sudo rm -rf "/opt/${NVIM_ARCHIVE}"
  sudo tar -C /opt -xzf "${NVIM_ARCHIVE}.tar.gz"
  sudo ln -sf "/opt/${NVIM_ARCHIVE}/bin/nvim" /usr/local/bin/nvim
  rm "${NVIM_ARCHIVE}.tar.gz"
else
  echo "Unsupported architecture: $arch"
  if [[ -z "${nvim_archives[$arch]}" ]]; then
    echo "No Neovim archive available for $arch"
  fi
  exit 1
fi

echo ""
echo "--------------------------------------------------------"
echo "Neovim setup complete!"
echo "--------------------------------------------------------"
