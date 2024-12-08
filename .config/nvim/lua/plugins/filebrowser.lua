return {
	-- 	Yazi in nvim
	-- 	"mikavilpas/yazi.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		open_for_directories = true,
	-- 		keymaps = {
	-- 			show_help = "<f1>",
	-- 			change_working_directory = "<c-]>", -- Got used to this dogshit keybind from nvim tree ragey
	-- 			grep_in_directory = "<c-s>",
	-- 		},
	-- 	},
	--
	-- 	telescope filebrowser see also /nvim/lua/plugins/telescope.lua
	-- {
	-- 	"nvim-telescope/telescope-file-browser.nvim",
	-- 	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	-- },
	--
	-- Cute little thing I found, treats file browsing like a normal vim buffer
	-- can browse files over ssh with using same syntax as netrw
	-- nvim oil-ssh://[username@]hostname[:port]/[path]
	{
		"stevearc/oil.nvim",
		opts = {
			default_file_explorer = true,
			columns = {
				"icon",
				"permissions",
				"size",
				--"mtime",
			},
			buf_options = {
				buflisted = false,
				bufhidden = "hide",
			},
			-- Window-local options to use for oil buffers
			win_options = {
				wrap = false,
				signcolumn = "no",
				cursorcolumn = false,
				foldcolumn = "0",
				spell = false,
				list = false,
				conceallevel = 3,
				concealcursor = "nvic",
			},
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			watch_for_changes = true,
			keymaps = {
				["g?"] = { "actions.show_help", mode = "n" },
				["<CR>"] = "actions.select",
				["<C-v>"] = { "actions.select", opts = { vertical = true } },
				["<C-s>"] = { "actions.select", opts = { horizontal = true } },
				["<C-t>"] = { "actions.select", opts = { tab = true } },
				["<C-p>"] = "actions.preview",
				["q"] = { "actions.close", mode = "n" },
				-- :lw :lopen to open the list and browse around the files after adding to loclist
				-- althgout harpoon is probably better
				["<C-q>"] = { "actions.send_to_qflist", mode = "v", opts = { target = "loclist" } },
				["-"] = { "actions.parent", mode = "n" },
				["_"] = { "actions.open_cwd", mode = "n" },
				["`"] = { "actions.cd", mode = "n" },
				["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
				["gs"] = { "actions.change_sort", mode = "n" },
				["gx"] = "actions.open_external",
				["g."] = { "actions.toggle_hidden", mode = "n" },
				["gt"] = { "actions.toggle_trash", mode = "n" },
				["g/"] = { "actions.toggle_trash", mode = "n" },
			},
			use_default_keymaps = false,
			view_options = {
				show_hidden = true,
				sort = {
					{ "type", "asc" },
					{ "size", "desc" },
				},
				highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
					return nil
				end,
			},
			git = {
				-- Return true to automatically git add/mv/rm files
				add = function(path)
					return false
				end,
				mv = function(src_path, dest_path)
					return false
				end,
				rm = function(path)
					return false
				end,
			},
			preview_win = {
				update_on_cursor_moved = true,
				preview_method = "fast_scratch",
				disable_preview = function(filename)
					return false
				end,
				win_options = { winblend = 5 },
			},
			float = {
				padding = 2,
				max_width = 170,
				max_height = 40,
				border = "rounded",
				win_options = {
					winblend = 5,
				},
				-- preview_split: Split direction: "auto", "left", "right", "above", "below".
				preview_split = "auto",
				-- This is the config that will be passed to nvim_open_win.
				-- Change values here to customize the layout
				override = function(conf)
					return conf
				end,
			},
			confirmation = {
				max_width = 0.9,
				-- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
				min_width = { 40, 0.4 },
				-- optionally define an integer/float for the exact width of the preview window
				width = nil,
				-- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
				-- min_height and max_height can be a single value or a list of mixed integer/float types.
				-- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
				max_height = 0.9,
				-- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
				min_height = { 5, 0.1 },
				-- optionally define an integer/float for the exact height of the preview window
				height = nil,
				border = "rounded",
				win_options = {
					winblend = 15,
				},
			},
			progress = {
				max_width = 0.9,
				min_width = { 40, 0.4 },
				width = nil,
				max_height = { 10, 0.9 },
				min_height = { 5, 0.1 },
				height = nil,
				border = "rounded",
				minimized_border = "none",
				win_options = {
					winblend = 0,
				},
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
