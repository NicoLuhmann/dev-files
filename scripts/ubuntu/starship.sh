#!/bin/bash

sudo apt update
sudo apt install -y curl

curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init bash)"' >> ~/.bashrc
source ~/.bashrc
