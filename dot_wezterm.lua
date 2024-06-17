-- Pull in the wezterm API
local wezterm = require("wezterm")

local	config = wezterm.config_builder()

config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = "NeverPrompt"

config.cursor_blink_ease_out = "Constant"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_rate = 700
config.default_cursor_style = "BlinkingBlock"

config.audible_bell = "Disabled"

config.window_background_opacity = 0.93
config.colors = require("themes/miami")

config.window_padding = {
	left = 4,
	right = 0,
	top = 4,
	bottom = 0,
}

config.font = wezterm.font_with_fallback({
	"JetBrainsMonoNL Nerd Font",
	"D2Coding",
})

config.keys = {
	{
		key = "-",
		mods = "CTRL",
		action = wezterm.action.DisableDefaultAssignment,
	},
	-- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
	{
		key = "=",
		mods = "CTRL",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "-",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
	-- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
	{
		key = "=",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "Tab",
		mods = "CTRL",
		action = wezterm.action.SendKey({ key = "Tab", mods = "CTRL" }),
	},
	{
		key = "Tab",
		mods = "SHIFT|CTRL",
		action = wezterm.action.SendKey({ key = "Tab", mods = "SHIFT|CTRL" }),
	},
}

return config
