#!/bin/bash
echo "--------------------------------------------------------"
echo "Installing nvm and Node.js..."
echo "--------------------------------------------------------"

export NVM_DIR="$HOME/.nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

nvm install 25
nvm use 25

echo "Node.js $(node --version) installed successfully."
echo "npm $(npm --version) installed successfully."