return {
	{
		"p00f/godbolt.nvim",
		event = "VeryLazy",
		opts = {
			languages = {
				cpp = {
					compiler = "telescope",
					options = {
						userArguments = "-mavx2 -O2",
						filters = {
							demangle = true,
							intel = true,
							label = true,
						},
					},
				}, -- https://github.com/compiler-explorer/compiler-explorer/blob/main/docs/API.md#post-apicompilercompiler-idcompile---perform-a-compilation
				c = {
					compiler = "telescope",
					options = {
						userArguments = "-mavx2 -O2",
						filters = {
							demangle = true,
							intel = true,
							label = true,
						},
					},
				},
			},
			auto_cleanup = true,
			highlight = {
				cursor = "visual", -- `cursor = false` to disable
				static = { "#1e2e3e", "#2e1e2e", "#1e1e40", "#1e1e40", "#190e20", "#2e1e2e" },
			},
			quickfix = {
				enable = false, -- whether to populate the quickfix list in case of errors
				auto_open = false, -- whether to open the quickfix list in case of errors
			},
			url = "https://godbolt.org", -- can be changed to a different godbolt instance
		},
	},
}
