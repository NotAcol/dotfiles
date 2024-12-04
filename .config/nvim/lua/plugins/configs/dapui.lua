local dap, dapui = require("dap"), require("dapui")
dapui.setup({
	controls = {
		element = "repl",
		enabled = true,
		icons = {
			disconnect = "",
			pause = "",
			play = "",
			run_last = "",
			step_back = "",
			step_into = "",
			step_out = "",
			step_over = "",
			terminate = "",
		},
	},
	element_mappings = {},
	expand_lines = true,
	floating = {
		border = "single",
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	force_buffers = true,
	icons = {
		collapsed = "",
		current_frame = "",
		expanded = "",
	},
	layouts = {
		{
			elements = {
				{
					id = "scopes",
					size = 1,
				},
			},
			position = "left",
			size = 45,
		},
		{
			elements = {
				{
					id = "watches",
					size = 0.70,
				},
				{
					id = "stacks",
					size = 0.30,
				},
			},
			position = "right",
			size = 45,
		},
		{
			elements = {
				-- {
				--   id = "console",
				--   size = 1,
				-- },
				{
					id = "repl",
					size = 1,
				},
			},
			position = "bottom",
			size = 15,
		},
	},
	mappings = {
		edit = "e",
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		repl = "r",
		toggle = "t",
	},
	render = {
		indent = 1,
		max_value_lines = 100,
	},
})
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end
