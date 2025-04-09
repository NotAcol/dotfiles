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
				functions = { "italic" },
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
				bufferline = true,
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
			-- NOTE(acol): this was so fucking disgusting treeshitter is legit retarded for taking
			-- all PascalCase functions as constructors, this is just the workaround...
			highlight_overrides = {
				mocha = function(colors)
					return {
						--						Normal = { bg = colors.mantle },
						--						NormalFloat = { bg = colors.mantle },
						--						Pmenu = { bg = colors.mantle }, -- Popup menu background
						--						WinSeparator = { fg = colors.surface2 }, -- Window separator lines
						--						CursorLine = { bg = colors.surface0 }, -- Current line highlight
						["@constructor"] = { fg = colors.blue },
						["@function"] = { fg = colors.maroon },
						["@function.macro"] = { fg = colors.blue },
						["@function.call"] = { fg = colors.blue },
						["@type"] = { fg = colors.rosewater },
						["@type.definition"] = { fg = colors.rosewater },
						["@type.builtin"] = { fg = colors.rosewater },
						["@type.builtin.cpp"] = { fg = colors.rosewater },
						["@variable.member"] = { fg = "#cdd6f5" },
						["@variable.parameter"] = { fg = colors.text },

						["@comment.todo"] = { fg = colors.subtext, bg = colors.red },
						["@comment.error"] = { fg = colors.subtext, bg = colors.yellow },
						["@comment.note"] = { fg = colors.subtext, bg = colors.teal },

						["@keyword.conditional"] = { fg = colors.mauve },
						["@keyword.repeat"] = { fg = colors.mauve },
						["@keyword.loop"] = { fg = colors.mauve },
						["@keyword.function"] = { fg = colors.mauve },
						["@keyword.type"] = { fg = colors.mauve },
						["@keyword.modifier"] = { fg = colors.mauve },
						["@attribute"] = { fg = colors.mauve },
						["@keyword.return"] = { fg = colors.mauve },
						--["@keyword.import"] = { fg = #e6d9bc },
						["@keyword"] = { fg = colors.mauve },

						["@operator"] = { fg = colors.teal },
						["@keyword.operator"] = { fg = colors.teal },

						["@keyword.import"] = { fg = colors.lavender },
						["@keyword.directive"] = { fg = colors.lavender },
						["@keyword.directive.define"] = { fg = colors.lavender },
						["@boolean"] = { fg = colors.lavender },

						["@constant"] = { fg = colors.lavender },
						["@constant.builtin"] = { fg = colors.lavender },
						["@constant.macro"] = { fg = colors.lavender },
						["@number"] = { fg = colors.maroon },
						["@string.escape"] = { fg = colors.maroon },
						["@string"] = { fg = colors.green },
					}
				end,
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
	{

		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			variant = "main",
			dakr_variant = "main",
			enable = {
				terminal = true,
				legacy_highlights = true,
				migrations = true,
			},
		},
	},
}
