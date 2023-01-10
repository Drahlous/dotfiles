-- Key Remapping

-- Use SPACE as the leader key
vim.api.nvim_set_keymap("n", " ", '', {noremap=true, silent=true})
vim.g.mapleader = ' '
vim.api.nvim_set_keymap("n", "<leader>pv", ':Explore<CR>', {noremap=true, silent=true})


-- Telescope
-- Ctrl+P to browse files using Telescope
vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>Telescope find_files<Cr>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<C-g>", "<cmd>Telescope live_grep<cr>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>Telescope tags<cr>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<leader>fm", "<cmd>Telescope marks<cr>", {noremap=true, silent=true})


-- LSP
vim.api.nvim_set_keymap("n", "<leader>fr", "<cmd>Telescope lsp-references<cr>", {noremap=true, silent=true})

-- Use <Tab> and <S-Tab> to navigate through popup menu
--inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
--inoremap <expr> <S-Tab> pumvisible() ? "\<C-n>" : "\<S-Tab>"

-- Tabs
--map <leader>l :tabnext<cr>
--map <leader>h :tabprevious<cr>

-- Open a new tab with the current buffer's path
-- Good for editing files in the same directory
--map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

-- Switch CWD to the directory of the open buffer
--map <leader> cd :cd %:p:h<cr>:pwd<cr>

-- Copy to clipboard in visual mode
--vmap <LeftRelease> "*ygv

-- Disable highlight when <leader><cr> is pressed
--map <silent> <leader><cr> :noh<cr>

