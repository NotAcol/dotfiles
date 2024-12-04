return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		opts = {
			options = {
				icons_enabled = true,
				theme = "catppuccin",
				component_separators = "|",
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = false,
				refresh = {
					statusline = 100,
					tabline = 100,
					winbar = 100,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { { "branch", icon = "" }, "diff" },
				lualine_c = { { "filename", path = 1, file_status = false } },
				lualine_x = { { "diagnostics", sources = { "nvim_lsp" } } },
				lualine_y = { { "filetype", icon_only = false, icon = { align = "left" } } },
				lualine_z = { "progress" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {
				lualine_a = {},
				lualine_b = {
					{
						"buffers",
						use_mode_colors = true,
						mode = 0,
						section_separators = { left = "", right = "" },
						component_separators = { right = " ", left = " " },
						symbols = {
							alternate_file = "",
						},
					},
				},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		},
	},
}
