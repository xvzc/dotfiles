-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 700

config.colors = {
	foreground = "#c5c8c6",
	background = "#1d1f21",
	cursor_bg = "#f6f6f6", -- cursor color
	cursor_border = "#f6f6f6",
	cursor_fg = "#0f0f0f", -- text color
	selection_fg = "#0f0f0f",
	selection_bg = "#f6f6f6",

	scrollbar_thumb = "#222222",
	split = "#444444",

	ansi = {
		"#1e1f21", -- black
		"#cc6666", -- red
		"#b5bd68", -- green
		"#f0c674", -- yellow
		"#6c9ac1", -- blue
		"#b294bb", -- magenta
		"#8abeb7", -- cyan
		"#c5c8c6", -- white
	},
	brights = {
		"#696969", -- black
		"#d54e53", -- red
		"#b9ca4a", -- green
		"#e7c547", -- yellow
		"#7aa6da", -- blue
		"#c397d8", -- magenta
		"#70c0b1", -- cyan
		"#eaeaea", -- white
	},
}
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
}

config.window_padding = {
	left = 4,
	right = 4,
	top = 4,
	bottom = 4,
}

config.font = wezterm.font_with_fallback({
	"JetBrainsMonoNL Nerd Font",
	"hesalche",
})

config.window_background_opacity = 0.95
config.use_fancy_tab_bar = true
config.window_decorations = "NONE"
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = "NeverPrompt"

return config
