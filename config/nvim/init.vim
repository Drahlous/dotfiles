set runtimepath^=~/.vim runtimepath+=~/.vim/after

"-----------------------------------------------------------------------------
" Plugins START
call plug#begin("~/.vim/plugged")

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

call plug#end()
" Plugins END
"-----------------------------------------------------------------------------

" Load lua config
lua require('init')

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-n>" : "\<S-Tab>"



" Set up ctags
set tags=./tags,tags;

" Use System Clipboard
set clipboard=unnamedplus


"-----------------------------------------------------------------------------
" Settings START

""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""
set nocompatible
set number
set relativenumber

" Sets how many lines of history Vim has to remember
set history=500

" Enable filetype plugin
filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread

set ttyfast

" Enable mouse in normal & visual modes
" Allows for dragging of split-views
set mouse=nv

" Copy to clipboard in visual mode
vmap <LeftRelease> "*ygv

" Map leader allows for more combinations
nnoremap <SPACE> <Nop>
let mapleader = " "
let g:mapleader = " "

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

""""""""""""""""""""""""""""""""""
" Navigating tabs, windows, buffers
""""""""""""""""""""""""""""""""""

" Tabs
map <leader>l :tabnext<cr>
map <leader>h :tabprevious<cr>

" Buffers
map <leader>bn :bnext<cr>
map <leader>bp :bprevious<cr>

" Open a new tab with the current buffer's path
" Good for editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader> cd :cd %:p:h<cr>:pwd<cr>

" Specify behavior for switching between buffers
try
    set switchbuf=useopen,usetab
    set stal=2
catch
endtry

" Return to the last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""""""""""""
" Vim user interface
""""""""""""""""""""""""""""""""""""""""


" Set 7 lines to the cursor when moving vertically with j/k
set so=7

" Turn on the wild menu
set wildmenu

" Always show current position
set ruler

" The commandbar height
set cmdheight=2

" Hide abandoned buffers
set hid


" Set backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Search
set ignorecase	" Ignore case when searching
set smartcase
set hlsearch	" Highlight search things
set incsearch	" Make search act like search in modern browsers

" Don't redraw while executing macros
set nolazyredraw

set magic	" Set magic on, for regular expressions

set showmatch	" Show matching bracets when text indicator is over them
set mat=2	" How many tenths of second ro blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
"set timeoutlen=500

""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""""""""""""""""""""
syntax enable	" Enable syntax hl

" Set fonts according to system
"	windows
"	set guifont=Bitstream\ Vera\ Sans\ Mono:h10
"	linux
set guifont=Hack\ 12
if $TERM == 'xterm-256color'            ||
        \   $TERM == 'screen-256color'  ||
        \   $TERM == 'st-256color'
    " Enable 24-bit true colors
    set termguicolors
endif

try 
    colorscheme jellybeans
    let g:jellybeans_use_gui_italics = 1
catch
endtry

set background=dark

" Set extra options for GUI mode
if has ("gui_running")
    set guioptions-=T
    set guioptions-=m
    set guioptions-=e
    set guioptions+=c " Console Dialogues
    set guitablabel=%M\ %t
endif

" set encoding=utf8
" try lang en_US catch endtry



""""""""""""""""""""""""""""""""""""""""
" Files, backups
""""""""""""""""""""""""""""""""""""""""
set ffs=unix,dos,mac	" Default file types

set backup
set backupdir=~/vim_backup

""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""
" Spaces instead of Tabs
set expandtab
set smarttab            

" 1 Tab = 2 Spaces
set shiftwidth=2
set tabstop=2

set autoindent
set smartindent
set wrap

set linebreak
set textwidth=500

""""""""""""""""""""""""""""""""""
" Status Line
""""""""""""""""""""""""""""""""""
" Always show status line
set laststatus=2


" Settings END
"-----------------------------------------------------------------------------

