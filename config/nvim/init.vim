set runtimepath^=~/.vim runtimepath+=~/.vim/after

"-----------------------------------------------------------------------------
" Plugins START
call plug#begin("~/.vim/plugged")

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Dracula Theme
Plug 'dracula/vim', { 'as': 'dracula' }

" Tree Sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Tmux Integrations
Plug 'aserowy/tmux.nvim'

" Aerial
Plug 'stevearc/aerial.nvim'

" Comment
Plug 'numToStr/Comment.nvim'

" Status Line
Plug 'nvim-lualine/lualine.nvim'
Plug 'arkav/lualine-lsp-progress'

" File Tree
Plug 'kyazdani42/nvim-tree.lua'

" Language Server
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Debug Adapter
Plug 'mfussenegger/nvim-dap'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'

call plug#end()
" Plugins END
"-----------------------------------------------------------------------------

" Load lua config
lua require('init')

" Map Leader to space
nnoremap <SPACE> <Nop>
let mapleader = " "
let g:mapleader = " "

" Telescope
" Ctrl+P to browse files using Telescope
nnoremap <C-p> <cmd>Telescope find_files<Cr>
nnoremap <C-g> <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-n>" : "\<S-Tab>"

" Tabs
map <leader>l :tabnext<cr>
map <leader>h :tabprevious<cr>

" Open a new tab with the current buffer's path
" Good for editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader> cd :cd %:p:h<cr>:pwd<cr>

" Copy to clipboard in visual mode
vmap <LeftRelease> "*ygv

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

"-----------------------------------------------------------------------------
" Settings START

" Set up ctags
set tags=./tags,tags;

" auto-format
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py.in lua vim.lsp.buf.formatting_sync(nil, 100)

" Delete trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

""""""""""""""""""""""""""""""""""
" Rust
""""""""""""""""""""""""""""""""""
" auto-format on save
let g:rustfmt_autosave = 1

""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""
set nocompatible
set number
set relativenumber

" Dracula Color Scheme
colorscheme dracula

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

" Use System Clipboard
set clipboard=unnamedplus

" Sets how many lines of history Vim has to remember
set history=500

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
set ttyfast

" Enable mouse in normal & visual modes
" Allows for dragging of split-views
set mouse=nv

""""""""""""""""""""""""""""""""""
" Navigating tabs, windows, buffers
""""""""""""""""""""""""""""""""""

" Specify behavior for switching between buffers
try
    set switchbuf=useopen,usetab
    set stal=2
catch
endtry

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

set background=dark

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

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

""""""""""""""""""""""""""""""""""""""""
" Files, backups
""""""""""""""""""""""""""""""""""""""""
set ffs=unix,dos,mac " Default file types

" set backup
" set backupdir=~/vim_backup

""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""
" Spaces instead of Tabs
set expandtab
set smarttab

" 1 Tab = 4 Spaces
set shiftwidth=4
set tabstop=4

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

