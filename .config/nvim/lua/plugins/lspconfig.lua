return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		lspconfig.clangd.setup({ capabilities = capabilities })
		lspconfig.markdown_oxide.setup({ capabilities = capabilities })
		lspconfig.texlab.setup({ capabilities = capabilities })
		lspconfig.neocmake.setup({ capabilities = capabilities })
		lspconfig.lua_ls.setup({ capabilities = capabilities })
		lspconfig.glsl_analyzer.setup({ capabilities = capabilities })
		lspconfig.asm_lsp.setup({ capabilities = capabilities })
	end,
}
