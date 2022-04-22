#!/bin/bash

# Set default terminal: Kitty
gsettings set org.gnome.desktop.default-applications.terminal exec $(which kitty)
gsettings set org.gnome.desktop.default-applications.terminal exec-arg "-x"

