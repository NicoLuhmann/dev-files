#!/bin/bash

curl -L -o code_latest_amd64.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo apt install ./code_latest_amd64.deb -y
rm code_latest_amd64.deb