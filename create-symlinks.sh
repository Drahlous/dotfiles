#!/bin/bash
dotfiles_dir=~/dotfiles
backups_dir=~/backups
tmp_dir=~/tmp

[[ ! -d $backups_dir ]] && mkdir $backups_dir

[[ ! -d $tmp_dir ]] && mkdir $tmp_dir


#=============
# bash
#=============
cp ~/.bashrc $backups_dir > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1
ln -sf $dotfiles_dir/bashrc ~/.bashrc

#=============
# zsh
#=============
cp ~/.zshrc $backups_dir > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
ln -sf $dotfiles_dir/zsh/zshrc ~/.zshrc

cp ~/.zsh_prompt $backups_dir > /dev/null 2>&1
sudo rm -rf ~/.zsh_prompt > /dev/null 2>&1
ln -sf $dotfiles_dir/zsh/zsh_prompt ~/.zsh_prompt

#=============
# aliases
#=============
cp ~/.aliases $backups_dir > /dev/null 2>&1
sudo rm -rf ~/.aliases > /dev/null 2>&1
ln -sf $dotfiles_dir/zsh/aliases ~/.aliases

#=============
# config nvim
#=============
cp -r ~/.config/nvim $backups_dir > /dev/null 2>&1
sudo rm -rf ~/.config/nvim > /dev/null 2>&1
ln -sf $dotfiles_dir/config/nvim ~/.config/nvim

#=============
# vim
#=============
cp -r ~/.vim $backups_dir > /dev/null 2>&1
sudo rm -rf ~/.vim > /dev/null 2>&1
ln -sf $dotfiles_dir/vim ~/.vim

cp ~/.vimrc $backups_dir > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
#ln -sf $dotfiles_dir/vimrc ~/.vimrc

#=============
# tmux
#=============
cp -r ~/.tmux $backups_dir > /dev/null 2>&1
sudo rm -rf ~/.tmux > /dev/null 2>&1
ln -sf $dotfiles_dir/linux-tmux ~/.tmux

cp ~/.tmux.conf $backups_dir > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
ln -sf $dotfiles_dir/linux-tmux/tmux.conf ~/.tmux.conf

cp ~/.tmux.conf.local $backups_dir > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf.local > /dev/null 2>&1
ln -sf $dotfiles_dir/linux-tmux/tmux.conf.local ~/.tmux.conf.local

#=============
# Xresources
#=============
cp -r ~/.Xresources $backups_dir > /dev/null 2>&1
sudo rm -rf ~/.Xresources > /dev/null 2>&1
ln -sf $dotfiles_dir/Xresources ~/.Xresources

#==============
# Set zsh as the default shell
#==============
sudo chsh -s /bin/zsh

echo "Finished Installation"

