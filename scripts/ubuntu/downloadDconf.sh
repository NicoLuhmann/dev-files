#!/bin/bash

# set script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Source utils.sh from parent directory
source "$SCRIPT_DIR/utils.sh"

dconf load /org/gnome/shell/ < "$SCRIPT_DIR/../dconf/shell.dconf"
dconf load /org/gnome/terminal/legacy/ < "$SCRIPT_DIR/../dconf/terminal.dconf"