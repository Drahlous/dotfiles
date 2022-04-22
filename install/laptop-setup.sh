#!/bin/bash

sudo apt install chrome -y

dconf write /org/gnome/desktop/interface/gtk-theme 1 # Yaru

dconf write /org/gnome/shell/extensions/dash-to-dock/dock-fixed  # Hide Dock
