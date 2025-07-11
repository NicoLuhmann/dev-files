#!/bin/bash

SCRIPT_DIR="${SCRIPT_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"

sudo apt-get update
sudo apt-get install -y curl

curl -sS https://starship.rs/install.sh | sh
"$SCRIPT_DIR/addToBashrc.sh" \
  'eval "$(starship init bash)"'
