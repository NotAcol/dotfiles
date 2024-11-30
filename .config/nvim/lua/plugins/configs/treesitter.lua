return {
	ensure_installed = {
		"lua",
		"cpp",
		"bash",
		"asm",
		"markdown",
		"markdown_inline",
		"comment",
		"objdump",
	},
	highlight = {
		enable = true,
		use_languagetree = true,
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true },
	autotag = {
		enable = true,
		enable_rename = true,
		enable_close = true,
		enable_close_on_slash = true,
		filetypes = { "html", "xml" },
	},
}
