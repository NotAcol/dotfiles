return {
	{
		"AlejandroSuero/freeze-code.nvim",
		opts = {
			copy = true,
			dir = vim.env.PWD,
			freeze_config = { -- configuration options for `freeze` command
				output = "freeze.png",
				config = "user",
			},
		},
	},
}
