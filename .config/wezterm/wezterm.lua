-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = {}

-- This is where you actually apply your config choices
config.font = wezterm.font("JetBrainsMono NF", { weight = "DemiBold" })
config.font_size = 10.0

-- NOTE(acol): it's bugged on wayland so need to use xwayland for now
config.enable_wayland = false

-- Color scheme:
config.color_scheme = "Catppuccin Mocha"

-- Renderer, will pick Vulkan WebGpu 144fps only if there is an integrated gpu otherwise opengl
for _, gpu in ipairs(wezterm.gui.enumerate_gpus()) do
	if gpu.backend == "Vulkan" and gpu.device_type == "IntegratedGpu" then
		config.webgpu_preferred_adapter = gpu
		config.front_end = "WebGpu"
		config.max_fps = 144
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
	bottom = 2,
}

-- tab bar conf
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

-- Keybinds
config.keys = {
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

-- and finally, return the configuration to wezterm
return config
