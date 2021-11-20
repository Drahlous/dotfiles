#!/bin/bash
dotfiles_dir=~/dotfiles
backups_dir=~/backups

[[ ! -d $backups_dir ]] && mkdir $backups_dir


#==============
# Delete existing dot files and folders
#==============

cp -r ~/.vim $backups_dir > /dev/null 2>&1
sudo rm -rf ~/.vim > /dev/null 2>&1
cp ~/.vimrc $backups_dir > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1

cp -r ~/.tmux $backups_dir > /dev/null 2>&1
sudo rm -rf ~/.tmux > /dev/null 2>&1
cp ~/.tmux.conf $backups_dir > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1

cp ~/.bashrc $backups_dir > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1

cp ~/.zsh_prompt $backups_dir > /dev/null 2>&1
sudo rm -rf ~/.zsh_prompt > /dev/null 2>&1
cp ~/.zshrc $backups_dir > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1

cp ~/.aliases $backups_dir > /dev/null 2>&1
sudo rm -rf ~/.aliases > /dev/null 2>&1

cp ~/.gitconfig $backups_dir > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1

cp ~/.antigen $backups_dir > /dev/null 2>&1
sudo rm -rf ~/.antigen > /dev/null 2>&1
cp ~/.antigen.zsh $backups_dir > /dev/null 2>&1
sudo rm -rf ~/.antigen.zsh > /dev/null 2>&1

cp -r ~/.config $backups_dir > /dev/null 2>&1
sudo rm -rf ~/.config > /dev/null 2>&1

#=============
# Create symlinks in the home folder
#===============
ln -sf $dotfiles_dir/vim ~/.vim
ln -sf $dotfiles_dir/vimrc ~/.vimrc
ln -sf $dotfiles_dir/bashrc ~/.bashrc
ln -sf $dotfiles_dir/linux-tmux ~/.tmux
ln -sf $dotfiles_dir/zsh/zsh_prompt ~/.zsh_prompt
ln -sf $dotfiles_dir/zsh/zshrc ~/.zshrc
ln -sf $dotfiles_dir/zsh/aliases ~/.aliases
ln -sf $dotfiles_dir/config ~/.config

#==============
# Set zsh as the default shell
#==============
sudo chsh -s /bin/zsh

echo "Finished Installation"

