#!/bin/bash

ARCH="$(uname -m)"

if [ "$ARCH" = "x86_64" ] || [ "$ARCH" = "amd64" ]; then
  curl -L -o devpod "https://github.com/loft-sh/devpod/releases/latest/download/devpod-linux-amd64" && sudo install -c -m 0755 devpod /usr/local/bin && rm -f devpod
elif [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
  curl -L -o devpod "https://github.com/loft-sh/devpod/releases/latest/download/devpod-linux-arm64" && sudo install -c -m 0755 devpod /usr/local/bin && rm -f devpod
else
  echo "Unsupported architecture: $ARCH" >&2
  exit 1
fi
