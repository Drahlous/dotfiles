set nocompatible
set showmatch
set ignorecase
set mouse=v
set hlsearch
set incsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set wildmode=longest,list
set cc=80

filetype plugin indent on
syntax on
set mouse=a

set clipboard=unnamedplus 		" System Clipboard

set ttyfast


call plug#begin("~/.vim/plugged")
Plug 'joshdick/onedark.vim'
call plug#end()

source $HOME/.config/nvim/themes/onedark.vim

