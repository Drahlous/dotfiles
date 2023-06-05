#!/bin/bash
# shellcheck disable=1090
# shellcheck disable=2024


set -u

[[ ! -f "$PATHS" ]] && printf "error: cannot find PATHS file!\n" && exit 1

# Source Paths
. "$PATHS"

#==============
# START
#==============
printf "Begin Installing Packages...\n"
sudo apt update &>/dev/null
sudo apt install stow &>/dev/null

touch "$HOME/install_progress_log.txt"
LOGFILE="$HOME/install_progress_log.txt"
date &> "$LOGFILE"

printf "Installing General Dependencies...\n"
#==============
# General Dependencies
#==============
sudo apt install -y ca-certificates &> "$LOGFILE"
sudo apt install -y gnupg &> "$LOGFILE"
sudo apt install -y lsb-release &> "$LOGFILE"
sudo apt install -y curl &> "$LOGFILE"
sudo apt install -y lsb-release &> "$LOGFILE"
sudo apt install -y lua5.3 &> "$LOGFILE"
sudo apt install -y snapd &> "$LOGFILE"
sudo apt install -y cmake &> "$LOGFILE"

printf "Installing C++ Essentials...\n"
#==============
# C++ essentials
#==============
sudo apt install -y build-essential &> "$LOGFILE"
sudo apt install -y gcc &> "$LOGFILE"
sudo apt install -y g++ &> "$LOGFILE"
sudo apt install -y gdb &> "$LOGFILE"
sudo apt install -y clang &> "$LOGFILE"

printf "Installing Python3...\n"
#==============
# Python
#==============
sudo apt install -y python3 &> "$LOGFILE"
sudo apt install -y python3-pip &> "$LOGFILE"

#==============
# Shell Environment
#==============

printf "Installing ZSH...\n"
# Zsh
sudo apt install -y zsh &> "$LOGFILE"
sudo apt install -y zsh-syntax-highlighting &> "$LOGFILE"

# oh-my-zsh
if [[ ! -d "$ZSH" ]]; then
    echo "n" | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &> "$LOGFILE"
fi


printf "Installing Fonts...\n"
# Nerd Fonts
sudo apt install -y fonts-powerline &> "$LOGFILE"
sudo apt install -y fonts-hack-ttf &> "$LOGFILE"
mkfontscale &> "$LOGFILE"
mkfontdir &> "$LOGFILE"
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/FiraCode/Medium/FiraCodeNerdFontMono-Medium.ttf
fc-cache -f -v &> "$LOGFILE"
rm fonts.dir && rm fonts.scale

#==============
# CLI Tools
#==============

printf "Installing CLI Tools...\n"

# Terminal Multiplexer
sudo apt install -y tmux &> "$LOGFILE"

# Ripgrep (grep replacement)
sudo apt install -y ripgrep &> "$LOGFILE"

# FD Finder
sudo apt install -y fd-find
ln -s "$(command -v fdfind)" ~/.local/bin/fd

# Fuzzy Finder
sudo apt install -y fzf &> "$LOGFILE"

#==============
# Editors & File Viewers
#==============

# Vim Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Neovim
printf "Installing Neovim...\n"
sudo apt install wget -y &> "$LOGFILE"
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb -y &> "$LOGFILE"
rm nvim-linux64.deb
ln -sTfv "$DOTFILES_DIR/config/nvim" "$XDG_CONFIG_HOME/nvim"
nvim --headless +PlugInstall +qall

# Nvim python and clipboard
sudo apt install -y xsel &> "$LOGFILE"
pip install pynvim

# Clangd
sudo apt install -y clangd-12 &> "$LOGFILE"
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100 &> "$LOGFILE"

# Ctags
sudo apt install -y exuberant-ctags &> "$LOGFILE"

printf "Installing Utils...\n"

# Shellcheck
sudo apt install -y shellcheck &> "$LOGFILE"

#=============
# Configuration Files
#=============

# bash
ln -sTfv "$DOTFILES_DIR/bashrc" "$HOME/.bashrc"

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
sudo apt -y autoremove &> "$LOGFILE"
printf "\nFinished Installing Packages!\n\n"
rm "$LOGFILE"

