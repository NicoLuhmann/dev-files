#!/bin/bash

DEFAULT_BASHRC="$HOME/.bashrc"
BASHRC="$DEFAULT_BASHRC"

if [ "$1" == "--file" ]; then
    BASHRC="$2"
    shift 2
fi

echo "Updating: $BASHRC"

for LINE in "$@"; do
    if ! grep -Fxq "$LINE" "$BASHRC"; then
        echo "Adding: $LINE"
        echo -e "\n$LINE" >> "$BASHRC"
    fi
done
