return {
	{
		"saghen/blink.cmp",
		lazy = false, -- lazy loading handled internally
		dependencies = { "rafamadriz/friendly-snippets", "L3MON4D3/LuaSnip" },
		version = "v0.*",
		opts = {
			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			-- see the "default configuration" section below for full documentation on how to define
			-- your own keymap.
			keymap = {
				preset = "default",
				["<C-s>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = {},
				["<C-Tab>"] = { "hide" },
				["<C-n>"] = { "snippet_forward", "select_next", "fallback" },
				["<C-p>"] = { "snippet_backward", "select_prev", "fallback" },

				["<CR>"] = { "accept", "fallback" },
			},

			cmdline = {
				keymap = {
					["<C-s>"] = { "show", "show_documentation", "hide_documentation" },
					["<C-Tab>"] = { "hide" },
					["<Tab>"] = { "show", "snippet_forward", "select_next", "fallback" },
					["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
					["<CR>"] = { "accept", "fallback" },
				},
			},

			appearance = {
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				-- Useful for when your theme doesn't support blink.cmp
				-- will be removed in a future release
				use_nvim_cmp_as_default = false,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "normal",
			},
			snippets = {
				preset = "luasnip",
			},

			-- default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, via `opts_extend`
			sources = {
				default = {
					"lsp",
					"snippets",
					"buffer",
					"path",
				},
			},
			completion = {
				menu = {
					-- border = "single",
					-- dont auto show when searching or in cmdline
					-- auto_show = function(ctx)
					-- 	return ctx.mode ~= "cmdline"
					-- end,
					auto_show = false,
					scrollbar = false,
					draw = {
						treesitter = { "lsp" },
						columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
					},
				},
				documentation = {
					--auto_show = true,
				},
				ghost_text = { enabled = true },
			},

			-- experimental signature help support

			signature = { enabled = false },
		},
	},
}
