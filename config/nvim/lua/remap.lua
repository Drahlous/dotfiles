-- Key Remapping

-- Use SPACE as the leader key
vim.keymap.set('n', ' ', '')
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', ':Explore<CR>')

-- Telescope
-- Ctrl+P to browse files using Telescope
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files<Cr>', opts)
vim.keymap.set('n', '<C-g>', '<cmd>Telescope live_grep<cr>', opts)
vim.keymap.set('n', '<leader>fp', '<cmd>Telescope find_files<Cr>', opts)
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope current_buffer_fuzzy_find<cr>', opts)
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)
vim.keymap.set('n', '<leader>ft', '<cmd>Telescope tags<cr>', opts)
vim.keymap.set('n', '<leader>fm', '<cmd>Telescope marks<cr>', opts)
vim.keymap.set('n', '<leader>fe', '<cmd>Telescope diagnostics<cr>', opts)

-- LSP
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope lsp_references<cr>', opts)
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope lsp_document_symbols<cr>', opts)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Use <Tab> and <S-Tab> to navigate through popup menu
--inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
--inoremap <expr> <S-Tab> pumvisible() ? "\<C-n>" : "\<S-Tab>"

-- Tabs
vim.keymap.set('n', '<leader>l', ':tabnext<cr>')
vim.keymap.set('n', '<leader>h', ':tabprevious<cr>')

-- Switch CWD to the directory of the open buffer
vim.keymap.set('n', '<leader>cd', ':cd %:p:h<cr>:pwd<cr>')

-- Copy to clipboard in visual mode
vim.keymap.set('v', '<LeftRelease>', '"*ygv')

-- Disable highlight when <leader><cr> is pressed
vim.keymap.set('n', '<leader><cr>', ':noh<cr>')

