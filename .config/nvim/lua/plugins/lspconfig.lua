return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = { "saghen/blink.cmp" },

	opts = {
		servers = {
			lua_ls = {},
			clangd = {},
			markdown_oxide = {},
			texlab = {},
			neocmake = {},
			glsl_analyzer = {},
			asm_lsp = {},
		},
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		for server, config in pairs(opts.servers) do
			-- passing config.capabilities to blink.cmp merges with the capabilities in your
			-- `opts[server].capabilities, if you've defined it
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end
	end,
}
--		config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
--local capabilities = vim.lsp.protocol.make_client_capabilities()
