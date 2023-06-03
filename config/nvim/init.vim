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
Plug 'Mofiqul/dracula.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/playground'

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
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-cmdline'

" Snippets
Plug 'L3MON4D3/LuaSnip'

Plug 'VonHeikemen/lsp-zero.nvim'

" Debug Adapter
Plug 'mfussenegger/nvim-dap'

" Go
Plug 'fatih/vim-go'

" Godot
Plug 'habamax/vim-godot'

" Wikilinks
Plug 'mmai/wikilink'

" Git
Plug 'tpope/vim-fugitive'

" Webdev Filetype Icons
Plug 'nvim-tree/nvim-web-devicons'


call plug#end()
" Plugins END
"-----------------------------------------------------------------------------

" Load lua config
lua require('init')

" Python Indentation Settings
let g:python_indent = {}
let g:python_indent.closed_paren_align_last_line = v:false
let g:python_indent.disable_parenthesis_indenting = v:false
let g:python_indent.open_paren = 'shiftwidth()'
let g:python_indent.nested_paren = 'shiftwidth()'
let g:python_indent.continue = 'shiftwidth()'
let g:python_indent.searchpair_timeout = 150

