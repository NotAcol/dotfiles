return {
	{
		"ej-shafran/compile-mode.nvim",
		-- lazy = false,
		cmd = "Compile",
		branch = "latest",
		dependencies = {
			--		"m00qek/baleia.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			vim.g.compile_mode = {
				default_command = "clang++ $(<.debug-flags) ",
				ask_about_save = false,
				--			baleia_setup = true,
			}
		end,
	},
}
