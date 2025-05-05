return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = { "saghen/blink.cmp" },

	opts = {
		servers = {
			lua_ls = {},
			clangd = {},
			texlab = {},
			glsl_analyzer = {},
			asm_lsp = {},
		},
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		for server, config in pairs(opts.servers) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			if server == "clangd" then
				config.autostart = false
			else
				config.autostart = true
			end
			lspconfig[server].setup(config)
		end
	end,
}
--		config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
--local capabilities = vim.lsp.protocol.make_client_capabilities()
