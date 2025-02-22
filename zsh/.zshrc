# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATHS="$HOME/.paths"

# Source Paths
. "$PATHS"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode auto      # update automatically without asking

CASE_SENSITIVE="false"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

#===================
# USER CONFIGURATION
#===================

export PATH="$HOME/.local/bin:$PATH"

# 0 - Owner (Keep all permissions)
# 0 - Group (Keep all permissions)
# 2 - World (Remove write permissions)
umask 0002

# For backspace inserting ^? in vi
stty erase '^?'

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Prompt moved to ~/.zsh_prompt
. ~/.zsh_prompt

# Aliases moved to ~/.aliases
. ~/.aliases

export EDITOR=nvim

export LESS=eFRX

bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line

#export NVM_DIR="$HOME/.config/nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FZF: Use Ripgrep by default
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*,*.pdf,*.o,.cache/*,.vscode/*}"'

export PATH=$PATH:${HOME}/.cargo/bin

export PATH=$PATH:${HOME}/go/bin
export PATH=$PATH:/usr/local/go/bin

# Enable Vagrant on WSL
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# Dracula theme for man pages
export MANPAGER="/usr/bin/less -s -M +Gg"
export LESS_TERMCAP_mb=$'\e[1;31m'      # begin bold
export LESS_TERMCAP_md=$'\e[1;34m'      # begin blink
export LESS_TERMCAP_so=$'\e[01;45;37m'  # begin reverse video
export LESS_TERMCAP_us=$'\e[01;36m'     # begin underline
export LESS_TERMCAP_me=$'\e[0m'         # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'         # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'         # reset underline

# Add user scripts to path
export PATH=$PATH:${HOME}/scripts

# Add local overrides if they exist
. ~/.localrc || true
