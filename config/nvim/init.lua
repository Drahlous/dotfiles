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
require("lazy").setup({

    -- Frameworks
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",

	-- Dracula Theme
	"Mofiqul/dracula.nvim",

	-- Treesitter
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", name = "nvim-treesitter"},
    {"nvim-treesitter/nvim-treesitter-context", dependencies = {"nvim-treesitter"}},
    {"nvim-treesitter/playground", cmd = "TSPlaygroundToggle", dependencies = {"nvim-treesitter"}},

	-- Aerial
	"stevearc/aerial.nvim",

	-- Comment
	"numToStr/Comment.nvim",

	-- Status Line
    {"nvim-lualine/lualine.nvim", name = "lualine.nvim"},
    {"arkav/lualine-lsp-progress", dependencies = "lualine.nvim"},

	-- Language Server
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim",

	-- Autocompletion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-cmdline",

	-- Snippets
	"L3MON4D3/LuaSnip",

	"VonHeikemen/lsp-zero.nvim",

	-- Debug Adapter
	"mfussenegger/nvim-dap",

	-- Wikilinks
	"mmai/wikilink",

	-- Git
	"tpope/vim-fugitive",

	-- Webdev Filetype Icons
	"nvim-tree/nvim-web-devicons",
})

-- Plugin Configs
-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require("lsp-zero")
lsp.preset("recommended")
lsp.setup()

require("null-ls-config")

require("treesitter")
require("treesitter-context-config")
require("lualine-config")
require("telescope-config")
require("Comment").setup()
require("aerial").setup({})

-- Editor Settings
require("dracula-config")
require("editor")
require("filetype")
require("diagnostic")

-- Remap Keys
require("remap")
require("vim-fugitive")
