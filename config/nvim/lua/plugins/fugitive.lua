return {
	-- Git
	{
		"tpope/vim-fugitive",
		cmd = "Git",
		keys = {
			{ "<leader>gs", vim.cmd.Git, desc = "Git Status" },
		},
	},
}
