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
# 2 - Group (Remove write permissions)
# 7 - World (Remove all permissions)
umask 027

# For backspace inserting ^? in vi
stty erase '^?'

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export TERM=xterm-256color

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

export IS_WSL=$(uname -r | sed -E 's/.*-WSL(2)?/WSL/g')

if [[ "${IS_WSL}" =~ "WSL" ]]; then
    export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
fi
