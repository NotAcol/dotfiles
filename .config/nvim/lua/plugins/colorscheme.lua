return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavor = "mocha",
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = false, -- Force no underline
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = {},
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
				-- miscs = {}, -- Uncomment to turn off hard-coded styles
			},
			integrations = {
				blink_cmp = true,
				alpha = true,
				gitsigns = true,
				harpoon = true,
				mason = true,
				treesitter = true,
				which_key = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
						ok = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
						ok = { "underline" },
					},
					inlay_hints = {
						background = false,
					},
				},
			},
			custom_highlights = {
				-- function.builtin
				DiagnosticVirtualTextHint = { bg = "none" },
				DiagnosticVirtualTextInfo = { bg = "none" },
				DiagnosticVirtualTextWarn = { bg = "none" },
				DiagnosticVirtualTextError = { bg = "none" },
			},
		},
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			user_default_options = {
				mode = "virtualtext",
				virtualtext_inline = "true",
				virtualtext = "󱓻",
			},
		},
	},
}
