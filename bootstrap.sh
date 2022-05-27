#!/bin/bash
set -eu

printf "Begin Bootstrapping...\n"

export DOTFILES_DIR="$HOME/.dotfiles"
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

# Install required packages and programs
"$DOTFILES_DIR/install/install-packages.sh"

stow zsh
stow linux-tmux

#==============
# Set zsh as the default shell
#==============
chsh -s "$(which zsh)"

printf "\nFinished Bootstrapping!\n\n"
