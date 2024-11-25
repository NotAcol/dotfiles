return {
	{
		"OXY2DEV/markview.nvim",
		--lazy = false,
		ft = "markdown", -- If you decide to lazy-load anyway
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		opts = function()
			return require("plugins.configs.markview")
		end,
	},
	{
		"euclio/vim-markdown-composer",
		build = "cd ~/.local/share/nvim/lazy/vim-markdown-composer && cargo build --release",
		init = function()
			vim.g.markdown_composer_autostart = 0
		end,
		ft = { "markdown" },
	},
}
