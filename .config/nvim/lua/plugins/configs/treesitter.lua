return {
	ensure_installed = {
		"lua",
		"cpp",
		"glsl",
		"c",
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
	custom_captures = {
		["constructor"] = "@function", -- Forces PascalCase to use @function highlight
	},
	indent = { enable = true },
	autotag = {
		enable = false,
		enable_rename = true,
		enable_close = true,
		enable_close_on_slash = true,
		filetypes = { "html", "xml" },
	},
}
