#!/bin/bash
set -e

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

cd "$SCRIPT_DIR"
git submodule update --init --recursive

# Create temp directory for downloads
TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

cd "$TMPDIR"

# Source the apt installer with absolute path
. "$SCRIPT_DIR/.config/nvim/installer/apt.sh"

echo "DevPod setup complete!"
