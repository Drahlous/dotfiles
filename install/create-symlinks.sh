#!/bin/bash

[[ ! -d "$BACKUPS_DIR" ]] && mkdir $BACKUPS_DIR

[[ ! -d "$TMP_DIR" ]] && mkdir $TMP_DIR

[[ ! -d "~/bin" ]] && mkdir ~/bin


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
backup_and_symlink() {
  old_path=$1
  new_path=$2

  printf "linking %s to %s\n" "$old_path" "$new_path"
  
  [[ '' = "$old_path" ]] && printf "error: old_path is empty!\n" && return 1
  [[ '' = "$new_path" ]] && printf "error: new_path is empty!\n" && return 1


  [[ '/' = "$old_path" ]] && printf "error: old_path is root!\n" && return 1
  [[ '/' = "$new_path" ]] && printf "error: new_path is root!\n" && return 1

  # Backup old file
  mv $old_path $BACKUPS_DIR > /dev/null 2>&1

  # Create link from old_path to new_path
  ln -nsf $new_path $old_path

}


#=============
# Configuration Files
#=============

# bash
backup_and_symlink ~/.bashrc      $DOTFILES_DIR/bashrc

# zsh
backup_and_symlink ~/.zshrc       $DOTFILES_DIR/zsh/zshrc
backup_and_symlink ~/.zsh_prompt  $DOTFILES_DIR/zsh/zsh_prompt
backup_and_symlink ~/.aliases     $DOTFILES_DIR/zsh/aliases

# nvim
[[ ! -d ~/.config/nvim/lua ]] && mkdir -p ~/.config/nvim/lua
backup_and_symlink ~/.config/nvim/init.vim      $DOTFILES_DIR/config/nvim/init.vim
backup_and_symlink ~/.config/nvim/lua/init.lua  $DOTFILES_DIR/config/nvim/lua/init.lua

# vim
backup_and_symlink ~/.vim         $DOTFILES_DIR/vim

# Xresources
backup_and_symlink ~/.Xresources  $DOTFILES_DIR/Xresources

# tmux
backup_and_symlink ~/.tmux              $DOTFILES_DIR/linux-tmux
backup_and_symlink ~/.tmux.conf         $DOTFILES_DIR/linux-tmux/tmux.conf
backup_and_symlink ~/.tmux.conf.local   $DOTFILES_DIR/linux-tmux/tmux.conf.local


#==============
# Application Binaries
#==============

# fuz (Note-taking)
ln -sf $DOTFILES_DIR/scripts/fuz.sh ~/bin/fuz


#==============
# Set zsh as the default shell
#==============
sudo chsh -s /bin/zsh

echo "Finished Installation"

