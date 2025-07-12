#!/bin/bash

# Disable emoji picker shortcut (Super + .) in IBus
gsettings set org.freedesktop.ibus.panel.emoji hotkey "[]"

# Restart IBus to apply changes
ibus restart

echo "Emoji picker shortcut disabled and IBus restarted."