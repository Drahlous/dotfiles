#!/bin/bash

set -eu

export DOTFILES_DIR="$HOME/dotfiles"
export PATHS="$DOTFILES_DIR/zsh/paths"

[[ ! -f "$PATHS" ]] && printf "error: cannot find PATHS file!\n" && exit 1

# Source Paths
. "$PATHS"

# @brief  Backup the old file/dir to BACKUPS
#         Replace with a symlink to the file in "dotfiles" dir
#
# @param old_path   path of the existing file
#                   this will be overwritten with a symbolic link
#
# @param new_path   path to the new dotfile
#                   this file will be pointed to with a symbolic link at old_path
#
# @return    0 on success
#            1 on failure
safer_symlink() {
  old_path=$1
  new_path=$2

  printf "linking %-40s %-40s\n" "$old_path" "$new_path"
  
  [[ '' = "$old_path" ]] && printf "error: old_path is empty!\n" && return 1
  [[ '' = "$new_path" ]] && printf "error: new_path is empty!\n" && return 1


  [[ '/' = "$old_path" ]] && printf "error: old_path is root!\n" && return 1
  [[ '/' = "$new_path" ]] && printf "error: new_path is root!\n" && return 1

  # Create link from old_path to new_path
  ln -nsf $new_path $old_path

}

#=============
# Start
#=============
printf "Begin Creating Symlinks...\n"

#=============
# Configuration Files
#=============

safer_symlink ~/.paths       "$PATHS"

# bash
safer_symlink ~/.bashrc      "$DOTFILES_DIR/bashrc"

# zsh
safer_symlink ~/.zshrc       "$DOTFILES_DIR/zsh/zshrc"
safer_symlink ~/.zsh_prompt  "$DOTFILES_DIR/zsh/zsh_prompt"
safer_symlink ~/.aliases     "$DOTFILES_DIR/zsh/aliases"

# nvim
[[ ! -d ~/.config/nvim/lua ]] && mkdir -p ~/.config/nvim/lua
safer_symlink ~/.config/nvim/init.vim      "$DOTFILES_DIR/config/nvim/init.vim"
safer_symlink ~/.config/nvim/lua           "$DOTFILES_DIR/config/nvim/lua"

# vim
safer_symlink ~/.vim         "$DOTFILES_DIR/vim"

# Xresources
safer_symlink ~/.Xresources  "$DOTFILES_DIR/Xresources"

# tmux
safer_symlink ~/.tmux              "$DOTFILES_DIR/linux-tmux"
safer_symlink ~/.tmux.conf         "$DOTFILES_DIR/linux-tmux/tmux.conf"
safer_symlink ~/.tmux.conf.local   "$DOTFILES_DIR/linux-tmux/tmux.conf.local"


#==============
# Application Binaries
#==============

# fuz (Note-taking)
ln -sfn "$DOTFILES_DIR/scripts/fuz.sh" "$LOCAL_BIN/fuz"


#==============
# Set zsh as the default shell
#==============
sudo chsh -s /bin/zsh

printf "Finished Creating Symlinks!\n\n"

