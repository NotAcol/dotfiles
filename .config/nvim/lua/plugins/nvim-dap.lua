return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("plugins.configs.dap")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("plugins.configs.dapui")
		end,
	},
}
