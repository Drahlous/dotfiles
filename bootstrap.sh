#!/bin/bash

export DOTFILES_DIR="$HOME/dotfiles"
export BACKUPS_DIR="$HOME/backups"
export TMP_DIR="$HOME/tmp"

export OH_MY_ZSH="$HOME/.oh-my-zsh"
export DRACULA_THEME="$HOME/zsh"

# Install required packages and programs
$DOTFILES_DIR/install/install-packages.sh

# Create symlinks to config files and binaries
$DOTFILES_DIR/install/create-symlinks.sh

