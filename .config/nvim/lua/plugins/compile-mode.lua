return {
	{
		"ej-shafran/compile-mode.nvim",
		lazy = false,
		branch = "latest",
		dependencies = {
			--"m00qek/baleia.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			vim.g.compile_mode = {
				default_command = "clang++ $(<.debug-flags) ",
				baleia_setup = false,
			}
		end,
	},
}
