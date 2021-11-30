#!/bin/bash

log_file=~/install_progress_log.txt

# Install the provided program
#   Program Name  - Name of the program to be used in the installation command
#                     e.g. neovim
#   Target        - Command used to invoke the program once installed
#                     e.g. nvim
install_and_log() {
  program_name=$1
  target=$2

  # If no target is supplied, assume that the command is the same as the package name
  [[ '' = "$target" ]] && target=$program_name

  # TODO: Generalize the installation to detect platform and use the appropriate package manager (snap, pacman, etc.)

  # Install the package if it doesn't already exist
  if ! command -v $target &> /dev/null
  then
    sudo apt-get -y install $program_name
  else
    printf "%s is already found, skipping\n" $program_name
    return 0
  fi

  [[ 'NULL' = "$target" ]] && printf "%s is a package, skip checking installation\n" "$program_name"  && return 0

  if ! command -v $target &> /dev/null
  then
    printf "error: %s FAILED TO INSTALL!\n" $program_name  >> $log_file
    return 1
  else
    printf "%s install success" "$program_name" >> $log_file
  fi

}


#==============
# START
#==============

date > $log_file

[[ ! -d ~/tmp ]] && mkdir ~/tmp

sudo apt-get update


#==============
# General Dependencies
#==============
install_and_log curl
install_and_log lua5.3 lua
install_and_log snapd snap

#==============
# C++ essentials
#==============
install_and_log gcc
install_and_log g++
install_and_log build-essential NULL
install_and_log gdb
install_and_log clang


#==============
# Rust
#==============
install_and_log cargo


#==============
# Python
#==============
install_and_log python3


#==============
# Shell Environment
#==============

# Zsh
install_and_log zsh
install_and_log zsh-syntax-highlighting NULL

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Nerd Fonts
install_and_log fonts-powerline NULL
install_and_log fonts-hack-ttf NULL
mkfontscale
mkfontdir
fc-cache -f -v

# Dracula theme
git clone https://github.com/dracula/zsh.git "$HOME/zsh"
ln -sf "$DRACULA_THEME/dracula.zsh-theme" "$OH_MY_ZSH/themes/dracula.zsh-theme"

#==============
# CLI Tools
#==============

# Terminal Multiplexer
install_and_log tmux

# Silver Searcher (grep replacement)
install_and_log silversearcher-ag ag

# Ripgrep (grep replacement)
install_and_log ripgrep rg

# git-completion and git-prompt
cd
curl -OL https://github.com/git/git/raw/master/contrib/completion/git-completion.bash
mv ~/git-completion.bash ~/.git-completion.bash
curl https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
echo "git-completion and git-prompt Installed and Configured" >> $log_file

curl http://beyondgrep.com/ack-2.08-single-file > ~/ack && chmod 0755 !#:3
sudo mv ~/ack /usr/bin/ack
sudo chmod 755 /usr/bin/ack
if type -p ack > /dev/null; then
    echo "Ack Downloaded and Installed" >> $log_file
else
    echo "Ack FAILED TO INSTALL!!!" >> $log_file
fi

# Fuzzy Finder
install_and_log fzf


#==============
# Editors & File Viewers
#==============

# Ctags
install_and_log exuberant-ctags ctags-exuberant

# Markdown
sudo snap install mdless

# Neovim
install_and_log neovim nvim

# Bat (Colorful cat)
cargo install bat

# Tree Sitter
cargo install tree-sitter-cli

# Doxygen
install_and_log doxygen

#==============
# Cleanup and provide a summary of what has been installed
#==============
echo -e "\n====== Cleaning up ======\n"
sudo apt-get -y autoremove
echo -e "\n====== Summary ======\n"
cat $log_file
echo
echo "Finished Installing Packages"
rm $log_file

