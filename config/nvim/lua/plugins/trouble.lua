return {
	-- Add a pretty quickfix list for LSP diagnostics
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	config = function()
		-- Trouble Keybindings
		vim.keymap.set("n", "<leader>xx", function()
			require("trouble").open()
		end)
		vim.keymap.set("n", "<leader>xw", function()
			require("trouble").open("workspace_diagnostics")
		end)
		vim.keymap.set("n", "<leader>xd", function()
			require("trouble").open("document_diagnostics")
		end)
		vim.keymap.set("n", "<leader>xq", function()
			require("trouble").open("quickfix")
		end)
		vim.keymap.set("n", "<leader>xl", function()
			require("trouble").open("loclist")
		end)
		vim.keymap.set("n", "<leader>xr", function()
			require("trouble").open("lsp_references")
		end)

		-- Telescope + Trouble integration
		-- Send any telescope results to trouble with <C-t>
		local actions = require("telescope.actions")
		local trouble = require("trouble.sources.telescope")

		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				mappings = {
					i = { ["<c-t>"] = trouble.open },
					n = { ["<c-t>"] = trouble.open },
				},
			},
		})
	end,
}
