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

local lsp = require("lsp-zero").preset("recommended")

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()

-- Editor Settings
require("editor")
require("filetype")
require("diagnostic")

-- Remap Keys
require("remap")

-- Enable WIP Oxbow
OXBOW_ENABLED=false
if OXBOW_ENABLED then
    oxbow_path = os.getenv("HOME") .. '/programming/Oxbow/cflow.lua'
    dofile(oxbow_path)
end
