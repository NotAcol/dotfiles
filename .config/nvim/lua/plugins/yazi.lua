return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	opts = {
		open_for_directories = true,
		keymaps = {
			show_help = "<f1>",
			change_working_directory = "<c-]>", -- Got used to this dogshit keybind from nvim tree ragey
			grep_in_directory = "<c-s>",
		},
	},
}
