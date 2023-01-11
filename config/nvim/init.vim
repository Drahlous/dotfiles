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
