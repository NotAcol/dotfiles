return {
	-- {
	-- 	"OXY2DEV/markview.nvim",
	-- 	--lazy = false,
	-- 	ft = "markdown", -- If you decide to lazy-load anyway
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- },
	{
		"euclio/vim-markdown-composer",
		build = "cd ~/.local/share/nvim/lazy/vim-markdown-composer && cargo build --release",
		init = function()
			vim.g.markdown_composer_autostart = true
		end,
		ft = { "markdown" },
	},
}
