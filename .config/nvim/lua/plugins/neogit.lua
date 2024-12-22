return {
	{
		"NeogitOrg/neogit",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
		opts = {
			graph_style = "kitty",
			integrations = {
				telescope = true,
				diffview = true,
			},
		},
		config = true,
	},
	{
		"sindrets/diffview.nvim",
		lazy = true,
		opts = {
			enhanced_diff_hl = true,
			keymaps = {
				view = {
					{ "n", "q", "<cmd>DiffviewClose<cr>", { desc = "close diffview" } },
				},
				file_panel = {
					{ "n", "q", "<cmd>DiffviewClose<cr>", { desc = "close diffview" } },
				},
				file_history_panel = {
					{
						"n",
						"q",
						function()
							require("diffview").actions.close()
						end,
						{ desc = "close history panel" },
					},
				},
			},
		},
	},
}
