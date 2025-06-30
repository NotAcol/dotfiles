return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},
		},
		opts = {
			ensure_installed = {
				--lsp
				"clangd",
				"glsl_analyzer",
				"texlab",
				"lua-language-server",
				"asm-lsp",
				--formaters
				"clang-format",
				"stylua",
			},
		},
	},
}
