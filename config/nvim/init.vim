"set runtimepath^=~/.vim runtimepath+=~/.vim/after

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

" Go
Plug 'fatih/vim-go'

" Godot
Plug 'habamax/vim-godot'

" Wikilinks
Plug 'mmai/wikilink'

call plug#end()
" Plugins END
"-----------------------------------------------------------------------------

" Load lua config
lua require('init')

