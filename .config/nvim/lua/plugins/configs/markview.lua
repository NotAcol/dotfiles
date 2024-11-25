local presets = require("markview.presets")
local opts = {
	buf_ignore = { "nofile" },
	filetypes = { "markdown", "quarto", "rmd" },
	highlight_groups = "dark",
	-- Modes where hybrid mode is enabled
	hybrid_modes = nil,
	-- Tree-sitter query injections
	injections = {},
	-- Initial plugin state,
	-- true = show preview
	-- falss = don't show preview
	initial_state = true,
	-- Max file size that is rendered entirely
	max_file_length = 1000,
	-- Modes where preview is shown
	modes = { "n", "no", "c" },
	-- Lines from the cursor to draw when the
	-- file is too big
	render_distance = 100,
	-- Window configuration for split view
	split_conf = {},
	headings = presets.headings.glow,
}
return opts
