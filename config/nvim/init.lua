-- Lazy Setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

-- Install Plugins
require("lazy").setup("plugins")

-- Plugin Configs
-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require("lsp-zero")
lsp.preset("recommended")
lsp.setup()

require("null-ls-config")

require("telescope-config")
require("Comment").setup()
require("aerial").setup({})

-- Editor Settings
require("editor")
require("filetype")
require("diagnostic")

-- Remap Keys
require("remap")
require("vim-fugitive")
