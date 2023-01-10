-- Key Remapping

-- Use SPACE as the leader key
vim.keymap.set('n', ' ', '')
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', ':Explore<CR>')

-- Telescope
-- Ctrl+P to browse files using Telescope
vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files<Cr>')
vim.keymap.set('n', '<C-g>', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
vim.keymap.set('n', '<leader>ft', '<cmd>Telescope tags<cr>')
vim.keymap.set('n', '<leader>fm', '<cmd>Telescope marks<cr>')

-- LSP
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope lsp-references<cr>')

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

