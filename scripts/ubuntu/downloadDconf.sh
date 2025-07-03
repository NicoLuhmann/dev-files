#!/bin/bash

# set script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

dconf load /org/gnome/shell/ < "$SCRIPT_DIR/../dconf/shell.dconf"
