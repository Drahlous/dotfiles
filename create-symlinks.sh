#!/bin/bash
dotfiles_dir=~/dotfiles
backups_dir=~/backups
tmp_dir=~/tmp

[[ ! -d $backups_dir ]] && mkdir $backups_dir

[[ ! -d $tmp_dir ]] && mkdir $tmp_dir


#=============
# bash
#=============
mv ~/.bashrc $backups_dir > /dev/null 2>&1
ln -sf $dotfiles_dir/bashrc ~/.bashrc

#=============
# zsh
#=============
mv ~/.zshrc $backups_dir > /dev/null 2>&1
ln -sf $dotfiles_dir/zsh/zshrc ~/.zshrc

mv ~/.zsh_prompt $backups_dir > /dev/null 2>&1
ln -sf $dotfiles_dir/zsh/zsh_prompt ~/.zsh_prompt

#=============
# aliases
#=============
mv ~/.aliases $backups_dir > /dev/null 2>&1
ln -sf $dotfiles_dir/zsh/aliases ~/.aliases

#=============
# config nvim
#=============
mkdir ~/.config > /dev/null 2>&1
mv ~/.config/nvim $backups_dir > /dev/null 2>&1
ln -sf $dotfiles_dir/config/nvim ~/.config/nvim

#=============
# vim
#=============
mv ~/.vim $backups_dir > /dev/null 2>&1
ln -sf $dotfiles_dir/vim ~/.vim

mv ~/.vimrc $backups_dir > /dev/null 2>&1
#ln -sf $dotfiles_dir/vimrc ~/.vimrc

#=============
# tmux
#=============
mv ~/.tmux $backups_dir > /dev/null 2>&1
ln -sf $dotfiles_dir/linux-tmux ~/.tmux

mv ~/.tmux.conf $backups_dir > /dev/null 2>&1
ln -sf $dotfiles_dir/linux-tmux/tmux.conf ~/.tmux.conf

mv ~/.tmux.conf.local $backups_dir > /dev/null 2>&1
ln -sf $dotfiles_dir/linux-tmux/tmux.conf.local ~/.tmux.conf.local

#=============
# Xresources
#=============
mv ~/.Xresources $backups_dir > /dev/null 2>&1
ln -sf $dotfiles_dir/Xresources ~/.Xresources

#==============
# Set zsh as the default shell
#==============
sudo chsh -s /bin/zsh

echo "Finished Installation"

