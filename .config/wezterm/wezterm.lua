-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = {}

-- This is where you actually apply your config choices
config.font = wezterm.font("JetBrainsMono NF", { weight = "DemiBold" })
config.font_size = 10.0

-- NOTE(acol): it's bugged on wayland so need to use xwayland for now (clipboard manager not working)
config.enable_wayland = false

-- Color scheme:
config.color_scheme = "Catppuccin Mocha"

-- Renderer, will pick Vulkan WebGpu 144fps only if there is an integrated gpu otherwise opengl
for _, gpu in ipairs(wezterm.gui.enumerate_gpus()) do
	if gpu.device_type == "DiscreteGpu" then
		config.webgpu_preferred_adapter = gpu
		config.front_end = "WebGpu"
		-- no real point to put it 144
		config.max_fps = 60
		break
	end
end
-- If no integrated gpu no blinking animation
if config.front_end == "OpenGL" then
	config.cursor_blink_rate = 0
end

-- Opacity option
config.window_background_opacity = 1.0

-- way less padding than default
config.window_padding = {
	left = 2,
	right = 2,
	top = 2,
	bottom = 0,
}

-- tab bar configuration
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

-- Keybinds
config.keys = {
	-- {
	-- 	key = "V",
	-- 	mods = "CTRL",
	-- 	action = wezterm.action.PasteFrom("Clipboard"),
	-- },
	-- {
	-- 	key = "V",
	-- 	mods = "CTRL",
	-- 	action = wezterm.action.PasteFrom("PrimarySelection"),
	-- },
	{
		key = "A",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "S",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "T",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "Z",
		mods = "CTRL|SHIFT",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		key = "H",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "L",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "K",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "J",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "X",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "{",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "}",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateTabRelative(1),
	},
}

-- different opening behavior for windows and Linux
if os.getenv("WSL_INTEROP") ~= nil then
	config.default_cwd = "/home/acol"
else
	-- start tmux
	config.default_prog = { "tmux" }
end

-- and finally, return the configuration to wezterm
return config
