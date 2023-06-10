#!/bin/bash
# shellcheck disable=1090
set -eu

printf "Begin Bootstrapping...\n"

export DOTFILES_DIR="$HOME/dotfiles"
export PATHS="$DOTFILES_DIR/zsh/.paths"

[[ ! -f "$PATHS" ]] && printf "error: cannot find PATHS file!\n" && exit 1

# Source Paths
. "$PATHS"

# Create Missing Directories
[[ ! -d "$LOCAL_BIN" ]] && mkdir -p "$LOCAL_BIN"
[[ ! -d "$BACKUPS_DIR" ]] && mkdir -p "$BACKUPS_DIR"
[[ ! -d "$NOTES_DIR" ]] && mkdir -p "$NOTES_DIR"

[[ ! -d "$TMP_DIR" ]] && mkdir -p "$TMP_DIR"

[[ ! -d "$XDG_RUNTIME_DIR" ]] && mkdir -p "$XDG_RUNTIME_DIR"
[[ ! -d "$XDG_CONFIG_HOME" ]] && mkdir -p "$XDG_CONFIG_HOME"

[[ ! -d "$HOME/.cargo" ]] && mkdir -p "$HOME/.cargo"
[[ ! -f "$HOME/.cargo/env" ]] && touch "$HOME/.cargo/env"

# Install GNU Stow to manage Symlinks
sudo apt update
sudo apt install stow

# Create Symlinks
[[ -f "$HOME/.zshrc" ]] && rm -if "$HOME/.zshrc"
stow zsh
stow linux-tmux

# Install required packages and programs
sudo apt install -y python3 python3-pip
python3 -m pip install --user ansible
ansible-playbook --ask-become-pass bootstrap.yml

#=============
# Configuration Files
#=============

# bash
ln -sTfv "$DOTFILES_DIR/bashrc" "$HOME/.bashrc"

# VSCode
mkdir -p "$XDG_CONFIG_HOME"/Code/User/
ln -sTfv "$DOTFILES_DIR/config/Code/User/settings.json" "$XDG_CONFIG_HOME/Code/User/settings.json"

#==============
# Application Binaries
#==============

# fuz (Note-taking)
ln -sTfv "$DOTFILES_DIR/scripts/fuz.sh" "$LOCAL_BIN/fuz"

#==============
# Set zsh as the default shell
#==============
chsh -s "$(command -v zsh)"

printf "\nFinished Bootstrapping!\n\n"
