#!/bin/bash

# Set up OnlyOffice Desktop Editors repository and install the application on Ubuntu.
# This script:
# 1. Creates a secure GnuPG directory for key management.
# 2. Downloads and imports the OnlyOffice GPG key.
# 3. Sets appropriate permissions and moves the key to the system keyring.
# 4. Adds the OnlyOffice repository to the system sources list.
# 5. Updates package lists and installs OnlyOffice Desktop Editors.

mkdir -p -m 700 ~/.gnupg
gpg --no-default-keyring --keyring gnupg-ring:/tmp/onlyoffice.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5
chmod 644 /tmp/onlyoffice.gpg
sudo chown root:root /tmp/onlyoffice.gpg
sudo mv /tmp/onlyoffice.gpg /usr/share/keyrings/onlyoffice.gpg

echo 'deb [signed-by=/usr/share/keyrings/onlyoffice.gpg] https://download.onlyoffice.com/repo/debian squeeze main' | sudo tee -a /etc/apt/sources.list.d/onlyoffice.list

sudo apt-get update

sudo apt-get install -y onlyoffice-desktopeditors
