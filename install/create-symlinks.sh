#!/bin/bash
dotfiles_dir=~/dotfiles
backups_dir=~/backups
tmp_dir=~/tmp

[[ ! -d "$backups_dir" ]] && mkdir $backups_dir

[[ ! -d "$tmp_dir" ]] && mkdir $tmp_dir

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
  mv $old_path $backups_dir > /dev/null 2>&1

  # Create link from old_path to new_path
  ln -nsf $new_path $old_path

}


#=============
# Configuration Files
#=============

# bash
backup_and_symlink ~/.bashrc      $dotfiles_dir/bashrc

# zsh
backup_and_symlink ~/.zshrc       $dotfiles_dir/zsh/zshrc
backup_and_symlink ~/.zsh_prompt  $dotfiles_dir/zsh/zsh_prompt
backup_and_symlink ~/.aliases     $dotfiles_dir/zsh/aliases

# nvim
backup_and_symlink ~/.config/nvim $dotfiles_dir/config/nvim

# vim
backup_and_symlink ~/.vim         $dotfiles_dir/vim

# Xresources
backup_and_symlink ~/.Xresources  $dotfiles_dir/Xresources

# tmux
backup_and_symlink ~/.tmux              $dotfiles_dir/linux-tmux
backup_and_symlink ~/.tmux.conf         $dotfiles_dir/linux-tmux/tmux.conf
backup_and_symlink ~/.tmux.conf.local   $dotfiles_dir/linux-tmux/tmux.conf.local


#==============
# Application Binaries
#==============

# fuz (Note-taking)
ln -sf $dotfiles_dir/scripts/fuz.sh ~/bin/fuz


#==============
# Set zsh as the default shell
#==============
sudo chsh -s /bin/zsh

echo "Finished Installation"

