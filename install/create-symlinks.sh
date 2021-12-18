#!/bin/bash

set -eu

export DOTFILES_DIR="$HOME/dotfiles"
export PATHS="$DOTFILES_DIR/zsh/paths"

[[ ! -f "$PATHS" ]] && printf "error: cannot find PATHS file!\n" && exit 1

# Source Paths
. "$PATHS"

#=============
# Start
#=============
printf "Begin Creating Symlinks...\n"

#=============
# Configuration Files
#=============

ln -sTf "$PATHS" "$HOME/.paths"

# bash
ln -sTf "$DOTFILES_DIR/bashrc" "$HOME/.bashrc"

# zsh
ln -sTf "$DOTFILES_DIR/zsh/zshrc" "$HOME/.zshrc"
ln -sTf "$DOTFILES_DIR/zsh/zsh_prompt" "$HOME/.zsh_prompt"
ln -sTf "$DOTFILES_DIR/zsh/aliases" "$HOME/.aliases"

# nvim
ln -sTf "$DOTFILES_DIR/config/nvim" "$HOME/.config/nvim"

# vim
ln -sTf "$DOTFILES_DIR/vim" "$HOME/.vim"

# Xresources
ln -sTf "$DOTFILES_DIR/Xresources" "$HOME/.Xresources"

# tmux
ln -sTf "$DOTFILES_DIR/linux-tmux" "$HOME/.tmux"
ln -sTf "$DOTFILES_DIR/linux-tmux/tmux.conf" "$HOME/.tmux.conf"
ln -sTf "$DOTFILES_DIR/linux-tmux/tmux.conf.local" "$HOME/.tmux.conf.local"


#==============
# Application Binaries
#==============

# fuz (Note-taking)
ln -sTf "$DOTFILES_DIR/scripts/fuz.sh" "$LOCAL_BIN/fuz"


#==============
# Set zsh as the default shell
#==============
sudo chsh -s /bin/zsh

printf "Finished Creating Symlinks!\n\n"

