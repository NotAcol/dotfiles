return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			cpp = { "clang-format" },
			c = { "clang-format" },
		},
		format_on_save = function(bufnr)
			local filename = vim.api.nvim_buf_get_name(bufnr)
			if filename:match("%.c$") or filename:match("%.h$") then
				return nil
			end
			return {
				timeout_ms = 500,
				lsp_fallback = true,
			}
		end,
	},
}
