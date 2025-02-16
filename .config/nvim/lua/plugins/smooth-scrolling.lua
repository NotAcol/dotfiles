return {
	{
		"declancm/cinnamon.nvim",
		version = "*", -- use latest release
		opts = {
			keymaps = {
				basic = true,
				--extra = true,
			},
			options = {
				mode = "cursor",
				count_only = false,
				max_delta = {
					-- Maximum distance for line movements before scroll
					-- animation is skipped. Set to `false` to disable
					line = false,
					-- Maximum distance for column movements before scroll
					-- animation is skipped. Set to `false` to disable
					column = false,
					-- Maximum duration for a movement (in ms). Automatically scales the
					-- delay and step size
					time = 80,
				},

				step_size = {
					-- Number of cursor/window lines moved per step
					vertical = 1,
					-- Number of cursor/window columns moved per step
					horizontal = 4,
				},
			},
		},
	},
}
