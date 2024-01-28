-- Editor Settings

-- Dracula Color Scheme
vim.cmd('colorscheme dracula')

-------------------------------------------------------------------------------
-- Settings START

-- Python Indentation Settings
-- Note that Nvim Lua provides a "bridge" to vimscript values
-- Objects passed over the bridge are COPIED.
-- When you want to change an existing dictionary, you CANNOT DIRECTLY ACCESS EXISTING FIELDS.
-- Instead you must overwrite the entire dictionary.
-- Details at :help lua-vimscript
local pyindent = {}
pyindent.closed_paren_align_last_line = false
pyindent.disable_parenthesis_indenting = false
pyindent.open_paren = 'shiftwidth()'
pyindent.nested_paren = 'shiftwidth()'
pyindent.continue = 'shiftwidth()'
pyindent.searchpair_timeout = 150
vim.g.python_indent = pyindent

-- Set up ctags
vim.opt.tags={'./tags', 'tags'}

--
-- General
--
vim.opt.number = true
vim.opt.relativenumber = true

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force user to select one from the menu
vim.opt.completeopt={'menuone', 'noinsert', 'noselect'}

-- Avoid showing extra messages when using completion
vim.opt.shortmess:append('c')

-- have a fixed column for the diagnostics to appear in
-- this removes the jitter when warnings/errors flow in
vim.opt.signcolumn = 'yes'

-- Use System Clipboard
vim.opt.clipboard = 'unnamedplus'

-- Sets how many lines of history Vim has to remember
vim.opt.history = 500

-- Set to auto read when a file is changed from the outside
vim.opt.autoread = true
vim.opt.ttyfast = true

-- Enable mouse in normal & visual modes
-- Allows for dragging of split-views
vim.opt.mouse = 'nv'

--
-- Navigating tabs, windows, buffers
--
vim.opt.switchbuf = {'useopen', 'usetab'}
vim.opt.stal = 2

--
-- Vim user interface
--

-- Set 7 lines to the cursor when moving vertically with j/k
vim.opt.so = 7

-- Turn on the wild menu
vim.opt.wildmenu = true

-- Always show current position
vim.opt.ruler = true

-- The commandbar height
vim.opt.cmdheight = 1

-- Hide abandoned buffers
vim.opt.hid = true

-- Set backspace
vim.opt.backspace = {'eol', 'start', 'indent'}
vim.opt.whichwrap:append('<', '>', 'h', 'l')

---- Search
vim.opt.ignorecase = true	-- Ignore case when searching
vim.opt.smartcase = true
vim.opt.hlsearch = true		-- Highlight search things
vim.opt.incsearch = true	-- Make search act like search in modern browsers
-- Don't redraw while executing macros
--vim.opt.nolazyredraw = true
vim.opt.magic = true        -- Set magic on, for regular expressions
vim.opt.showmatch = true	-- Show matching bracets when text indicator is over them
vim.opt.mat = 2             -- How many tenths of second to blink
-- No sound on errors
vim.opt.belloff = 'all'

--
-- Colors and Fonts
--
vim.opt.syntax = 'enable'		-- Enable syntax highlighting
vim.opt.background = 'dark'
vim.opt.termguicolors = true

---
--- Files, backups
---
vim.opt.ffs = {'unix', 'dos', 'mac'} -- Default file types

--
-- Text, tab and indent related
--
-- Spaces instead of Tabs
vim.opt.expandtab = true
vim.opt.smarttab = true

-- 1 Tab = 4 Spaces
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.linebreak = true
vim.opt.textwidth = 500

--
-- Status Line
--
-- Always show status line
vim.opt.laststatus = 2

-- Settings END
---------------------------------------------------------------------------------

