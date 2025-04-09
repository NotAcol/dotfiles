local select_one_or_multi = function(prompt_bufnr)
	local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
	local multi = picker:get_multi_selection()
	if not vim.tbl_isempty(multi) then
		require("telescope.actions").close(prompt_bufnr)
		for _, j in pairs(multi) do
			if j.path ~= nil then
				vim.cmd(string.format("%s %s", "edit", j.path))
			end
		end
	else
		require("telescope.actions").select_default(prompt_bufnr)
	end
end
return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
	cmd = "Telescope",
	opts = {
		defaults = {
			prompt_prefix = "   ",
			selection_caret = " ",
			entry_prefix = " ",
			sorting_strategy = "ascending",
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.55,
				},
				width = 0.87,
				height = 0.80,
			},
			mappings = {
				n = { ["<CR>"] = select_one_or_multi, ["q"] = require("telescope.actions").close },
				i = { ["<CR>"] = select_one_or_multi },
			},
			vimgrep_arguments = {
				"rg",
				"-L",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
			},
			previewer = true,
			file_previewer = require("telescope.previewers").vim_buffer_cat.new,
			grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
			qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		},
		pickers = {
			find_files = {
				find_command = { "fd" },
				opts = { "-H", "--type", "f", "--type", "l", "--color", "never", "-E", ".git" },
				hidden = true,
			},
		},
		extensions = {
			-- file_browser = {
			-- 	theme = "ivy",
			-- 	hijack_netrw = true,
			-- 	grouped = true,
			-- 	hidden = false,
			-- 	follow_symlinks = true,
			-- 	use_fd = true,
			-- },
		},
		extensions_list = {
			-- "file_browser",
		},
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			-- load extensions
			for _, ext in ipairs(opts.extensions_list) do
				telescope.load_extension(ext)
			end
		end,
		-- {
		-- 	"nvim-telescope/telescope-file-browser.nvim",
		-- 	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		-- },
	},
}
