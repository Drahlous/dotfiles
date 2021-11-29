#!/bin/bash

export DOTFILES_DIR="$HOME/dotfiles"

# Install required packages and programs
$DOTFILES_DIR/install/install-packages.sh

# Create symlinks to config files and binaries
$DOTFILES_DIR/install/create-symlinks.sh

