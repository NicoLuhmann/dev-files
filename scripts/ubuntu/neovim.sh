#!/bin/bash
# Install dependencies
sudo apt-get update
sudo apt-get install -y \
  curl \
  git \
  xclip \
  wl-clipboard \
  wget \
  ripgrep \
  build-essential \
  luarocks \
  gzip \
  tar \
  unzip \
  python3-pip \
  python3-venv 

# Install Neovim and lazygit
NVIM_VERSION="0.11.2"
arch=$(uname -m)

declare -A nvim_archives=(
  ["x86_64"]="nvim-linux-x86_64"
  ["aarch64"]="nvim-linux-arm64"
)

declare -A lazygit_archives=(
  ["x86_64"]="Linux_x86_64"
  ["aarch64"]="Linux_arm64"
)

if [[ -n "${nvim_archives[$arch]}" && -n "${lazygit_archives[$arch]}" ]]; then
  # Install latest lazygit
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": *"v\K[^"]*')
  LAZYGIT_ARCHIVE="${lazygit_archives[$arch]}"
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_${LAZYGIT_ARCHIVE}.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit -D -t /usr/local/bin/
  rm lazygit.tar.gz lazygit

  # Install neovim
  NVIM_ARCHIVE="${nvim_archives[$arch]}"
  curl -LO "https://github.com/neovim/neovim/releases/download/v${NVIM_VERSION}/${NVIM_ARCHIVE}.tar.gz"
  sudo rm -rf "/opt/${NVIM_ARCHIVE}"
  sudo tar -C /opt -xzf "${NVIM_ARCHIVE}.tar.gz"
  sudo ln -s "/opt/${NVIM_ARCHIVE}/bin/nvim" /usr/local/bin/nvim
  rm "${NVIM_ARCHIVE}.tar.gz"
else
  echo "Unsupported architecture: $arch"
  if [[ -z "${nvim_archives[$arch]}" ]]; then
    echo "No Neovim archive available for $arch"
  fi
  if [[ -z "${lazygit_archives[$arch]}" ]]; then
    echo "No lazygit archive available for $arch"
  fi
  exit 1
fi

echo ""
echo "--------------------------------------------------------"
echo "Setup complete! Follow instructions in /dev-files/scripts/ubuntu/README.md"
echo "--------------------------------------------------------"
