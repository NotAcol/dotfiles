return {
	{
		"michaelrommel/nvim-silicon",
		lazy = true,
		cmd = "Silicon",
		main = "nvim-silicon",
		opts = {
			disable_defaults = true,
			font = "JetBrainsMono Nerd Font=24;Noto Color Emoji=24",
			language = function()
				return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":e")
			end,
			tab_width = 4,
			theme = "Dracula",
			background = "#1e1e2e",
			pad_horiz = 40,
			pad_vert = 40,
			shadow_blur_radius = 0,
			shadow_offset_x = 0,
			shadow_offset_y = 0,
			no_round_corner = true,
			no_window_controls = true,
			to_clipboard = true,
			command = "silicon",
			window_title = function()
				return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
			end,
		},
	},
}
