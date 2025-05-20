return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		lazy = false,
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			ft = { "mardown", "quarto" },
			debounce = 50,
			code = {
				enabled = true,
				style = "full",
				border = "thick",
				sign = true,
			},
			checkbox = {
				unchecked = { icon = "✘ " },
				checked = { icon = "✔ " },
				custom = { todo = { rendered = "◯ " } },
			},
		},
	},
}
