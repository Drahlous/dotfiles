return {
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
}
