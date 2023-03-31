-- Plugin Configs
-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()

require('treesitter')
require('vscode-cpptools')
require('lualine-config')
require('telescope-config')
require('Comment').setup()
require('aerial').setup({})

-- Editor Settings
require('dracula-config')
require('editor')
require('filetype')

-- Remap Keys
require('remap')
require('vim-fugitive')

