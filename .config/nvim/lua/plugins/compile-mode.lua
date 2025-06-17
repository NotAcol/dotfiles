return {
	"ej-shafran/compile-mode.nvim",
	-- lazy = false,
	cmd = "Compile",
	branch = "latest",
	dependencies = {
		--{ "m00qek/baleia.nvim", tag = "v1.3.0" },
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.g.compile_mode = {
			ask_about_save = false,
			--	baleia_setup = true,
			hidden_buffer = true,
		}
	end,
}
