return {
	{
		"michaelrommel/nvim-silicon",
		lazy = true,
		cmd = "Silicon",
		main = "nvim-silicon",
		opts = function()
			return require("plugins.configs.silicon")
		end,
	},
}
