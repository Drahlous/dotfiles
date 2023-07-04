return {

	-- Nvim Lsp Config
	{ "neovim/nvim-lspconfig" },

	-- Mason
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

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

	-- Lsp Zero
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ -- Optional
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	},

	-- Null LS
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = function()
			local null_ls = require("null-ls")
			return {
				sources = {
					null_ls.builtins.formatting.stylua,
					-- Python Styling
					null_ls.builtins.diagnostics.pydocstyle.with({
						method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
					}),
					null_ls.builtins.diagnostics.pylint.with({
						method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
					}),
					null_ls.builtins.formatting.black.with({
						extra_args = {
							"--line-length",
							"150",
						},
					}),
					null_ls.builtins.formatting.isort.with({
						extra_args = {
							"--profile",
							"black",
							"--line-length",
							"150",
						},
					}),
				},
			}
		end,
	},

	-- Aerial
	{
		"stevearc/aerial.nvim",
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "AerialToggle", "AerialOpen", "AerialNavToggle", "AerialNavOpen" },
		opts = {},
	},
}
