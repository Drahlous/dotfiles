#!/bin/bash

set -u

[[ ! -f "$PATHS" ]] && printf "error: cannot find PATHS file!\n" && exit 1

# Source Paths
. "$PATHS"

#==============
# START
#==============
printf "Begin Installing Packages...\n"
sudo apt-get update &>/dev/null
sudo apt-get install stow &>/dev/null

touch "$HOME/install_progress_log.txt"
LOGFILE="$HOME/install_progress_log.txt"
date &> "$LOGFILE"

printf "Installing General Dependencies...\n"
#==============
# General Dependencies
#==============
sudo apt-get install -y ca-certificates &> "$LOGFILE"
sudo apt-get install -y gnupg &> "$LOGFILE"
sudo apt-get install -y lsb-release &> "$LOGFILE"
sudo apt-get install -y curl &> "$LOGFILE"
sudo apt-get install -y lsb-release &> "$LOGFILE"
sudo apt-get install -y lua5.3 &> "$LOGFILE"
sudo apt-get install -y snapd &> "$LOGFILE"
sudo apt-get install -y cmake &> "$LOGFILE"

printf "Installing Node...\n"
# Node
sudo apt install -y nodejs npm &> "$LOGFILE"
sudo npm install -y -g n &> "$LOGFILE"
sudo n latest &> "$LOGFILE"

printf "Installing C++ Essentials...\n"
#==============
# C++ essentials
#==============
sudo apt-get install -y build-essential &> "$LOGFILE"
sudo apt-get install -y gcc &> "$LOGFILE"
sudo apt-get install -y g++ &> "$LOGFILE"
sudo apt-get install -y gdb &> "$LOGFILE"
sudo apt-get install -y clang &> "$LOGFILE"

printf "Installing Rust...\n"
#==============
# Rust
#==============
sudo apt-get install -y cargo &> "$LOGFILE"

printf "Installing Python3...\n"
#==============
# Python
#==============
sudo apt-get install -y python3 &> "$LOGFILE"
sudo apt-get install -y python3-pip &> "$LOGFILE"

#==============
# Shell Environment
#==============

printf "Installing ZSH...\n"
# Zsh
sudo apt-get install -y zsh &> "$LOGFILE"
sudo apt-get install -y zsh-syntax-highlighting &> "$LOGFILE"

# oh-my-zsh
if [[ ! -d "$ZSH" ]]; then
    echo "n" | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &> "$LOGFILE"
fi


printf "Installing Fonts...\n"
# Nerd Fonts
sudo apt-get install -y fonts-powerline &> "$LOGFILE"
sudo apt-get install -y fonts-hack-ttf &> "$LOGFILE"
mkfontscale &> "$LOGFILE"
mkfontdir &> "$LOGFILE"
fc-cache -f -v &> "$LOGFILE"

#==============
# CLI Tools
#==============

printf "Installing CLI Tools...\n"

# Terminal Multiplexer
sudo apt-get install -y tmux &> "$LOGFILE"

# Silver Searcher (grep replacement)
sudo apt-get install -y silversearcher-ag &> "$LOGFILE"

# Ripgrep (grep replacement)
sudo apt-get install -y ripgrep &> "$LOGFILE"

# git-completion and git-prompt
cd || exit
curl -OL https://github.com/git/git/raw/master/contrib/completion/git-completion.bash &> "$LOGFILE"
mv ~/git-completion.bash ~/.git-completion.bash &> "$LOGFILE"
curl https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh &> "$LOGFILE"
printf "git-completion and git-prompt Installed and Configured\n" &> "$LOGFILE"

# Fuzzy Finder
sudo apt-get install -y fzf &> "$LOGFILE"

#==============
# Editors & File Viewers
#==============

# Vim Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' &> "$LOGFILE"

# Neovim
printf "Installing Neovim...\n"
sudo snap install --edge nvim --classic
ln -sTfv "$DOTFILES_DIR/config/nvim" "$XDG_CONFIG_HOME/nvim"
nvim --headless +PlugInstall +qall

# Nvim python and clipboard
sudo apt install -y xsel &> "$LOGFILE"
pip install pynvim

# Pyright Language Server
sudo npm i -g pyright &> "$LOGFILE"

# Bash Language Server
sudo npm i -g bash-language-server &> "$LOGFILE"

# Clangd
sudo apt-get install -y clangd-12 &> "$LOGFILE"
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100 &> "$LOGFILE"

# Rust Analyzer
curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > "$LOCAL_BIN/rust-analyzer" &> "$LOGFILE"
chmod +x "$LOCAL_BIN/rust-analyzer" &> "$LOGFILE"

# Ctags
sudo apt-get install -y exuberant-ctags &> "$LOGFILE"

printf "Installing Utils...\n"

# Shellcheck
sudo apt-get install -y shellcheck &> "$LOGFILE"

#=============
# Configuration Files
#=============

# bash
ln -sTfv "$DOTFILES_DIR/bashrc" "$HOME/.bashrc"

# Xresources
ln -sTfv "$DOTFILES_DIR/Xresources" "$HOME/.Xresources"

# kitty
sudo apt-get install -y kitty &> "$LOGFILE"
ln -sTfv "$DOTFILES_DIR/config/kitty" "$XDG_CONFIG_HOME/kitty"

# VSCode
mkdir -p "$XDG_CONFIG_HOME"/Code/User/
ln -sTfv "$DOTFILES_DIR/config/Code/User/settings.json" "$XDG_CONFIG_HOME/Code/User/settings.json"

#==============
# Application Binaries
#==============

# fuz (Note-taking)
ln -sTfv "$DOTFILES_DIR/scripts/fuz.sh" "$LOCAL_BIN/fuz"

#==============
# Cleanup and provide a summary of what has been installed
#==============
printf "\n====== Cleaning up ======\n"
sudo apt-get -y autoremove &> "$LOGFILE"
printf "\nFinished Installing Packages!\n\n"
rm "$LOGFILE"

