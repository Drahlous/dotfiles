#!/bin/bash

set -euo pipefail

export DOTFILES_DIR="$HOME/dotfiles"
export PATHS="$DOTFILES_DIR/zsh/paths"

[[ ! -f "$PATHS" ]] && printf "error: cannot find PATHS file!\n" && exit 1

# Source Paths
. "$PATHS"

#==============
# START
#==============
printf "Begin Installing Packages...\n"
log_file=~/install_progress_log.txt
date > "$log_file"

sudo apt-get update

#==============
# General Dependencies
#==============
sudo apt-get install -y ca-certificates
sudo apt-get install -y gnupg
sudo apt-get install -y lsb-release
sudo apt-get install -y curl
sudo apt-get install -y lsb-release
sudo apt-get install -y lua5.3
sudo apt-get install -y snapd

# Node
sudo apt install -y nodejs npm
sudo npm install -y -g n
sudo n latest

# Docker
sudo apt-get remove docker docker-engine docker.io containerd runc
[[ ! -f "/usr/share/keyrings/docker-archive-keyring.gpg" ]] &&  \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg |   \
    sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

#==============
# C++ essentials
#==============
sudo apt-get install -y build-essential
sudo apt-get install -y gcc
sudo apt-get install -y g++
sudo apt-get install -y gdb
sudo apt-get install -y clang

#==============
# Rust
#==============
sudo apt-get install -y cargo

#==============
# Python
#==============
sudo apt-get install -y python3

#==============
# Shell Environment
#==============

# Zsh
sudo apt-get install -y zsh
sudo apt-get install -y zsh-syntax-highlighting

# oh-my-zsh
if [[ ! -d "$ZSH" ]]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Dracula theme
if [[ ! -f "$ZSH/themes/dracula.zsh-theme" ]]; then
    git clone https://github.com/dracula/zsh.git "$DRACULA_THEME"
    ln -sfn "$DRACULA_THEME/dracula.zsh-theme" "$ZSH/themes/dracula.zsh-theme"
fi

# Nerd Fonts
sudo apt-get install -y fonts-powerline 
sudo apt-get install -y fonts-hack-ttf
mkfontscale
mkfontdir
fc-cache -f -v


#==============
# CLI Tools
#==============
# Terminal Multiplexer
sudo apt-get install -y tmux

# Silver Searcher (grep replacement)
sudo apt-get install -y silversearcher-ag

# Ripgrep (grep replacement)
sudo apt-get install -y ripgrep

# git-completion and git-prompt
cd || exit
curl -OL https://github.com/git/git/raw/master/contrib/completion/git-completion.bash
mv ~/git-completion.bash ~/.git-completion.bash
curl https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
printf "git-completion and git-prompt Installed and Configured\n" >> "$log_file"

# Fuzzy Finder
sudo apt-get install -y fzf

#==============
# Editors & File Viewers
#==============
# Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage ~/.local/bin/nvim

# Vim Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Pyright Language Server
sudo npm i -g pyright

# Bash Language Server
sudo npm i -g bash-language-server

# Rust Analyzer
curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > "$LOCAL_BIN/rust-analyzer"
chmod +x "$LOCAL_BIN/rust-analyzer"

# Ctags
sudo apt-get install -y exuberant-ctags

# Markdown
sudo snap install mdless

# Bat (Colorful cat)
cargo install bat

# Tree Sitter
cargo install tree-sitter-cli

# Doxygen
sudo apt-get install -y doxygen

# Shellcheck
sudo apt-get install -y shellcheck

#==============
# Cleanup and provide a summary of what has been installed
#==============
printf "\n====== Cleaning up ======\n"
sudo apt-get -y autoremove
printf "\n====== Summary ======\n"
cat "$log_file"
printf "\nFinished Installing Packages!\n\n"
rm "$log_file"

