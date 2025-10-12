#!/bin/bash

folders=("git" "tmp" "projects" "university" "work" "notes")

for folder in "${folders[@]}"; do
    dir="$HOME/$folder"
    if [ ! -d "$dir" ]; then
        mkdir -p "$dir"
        echo "Created: $dir"
    else
        echo "Exists: $dir"
    fi
done
