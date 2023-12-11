-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme_dirs = { '~/.config/term/theme/' }

  -- normal:
  --  black:   '#1d1f21'
  --  red:     '#cc6666'
  --  green:   '#b5bd68'
  --  yellow:  '#f0c674'
  --  blue:    '#6c9ac1'
  --  magenta: '#b294bb'
  --  cyan:    '#8abeb7'
  --  white:   '#c5c8c6'
  --
  -- # Bright colors
  -- bright:
  --  black:   '#666666'
  --  red:     '#d54e53'
  --  green:   '#b9ca4a'
  --  yellow:  '#e7c547'
  --  blue:    '#7aa6da'
  --  magenta: '#c397d8'
  --  cyan:    '#70c0b1'
  --  white:   '#eaeaea'
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 0



config.colors = {
  foreground = '#c5c8c6',
  background = '#1d1f21',
  cursor_bg = '#f6f6f6', -- cursor color
  cursor_border = '#f6f6f6',
  cursor_fg = '#0f0f0f', -- text color
  selection_fg = '#0f0f0f',
  selection_bg = '#f6f6f6',

  scrollbar_thumb = '#222222',
  split = '#444444',

  ansi = {
    '#1e1f21', -- black
    '#cc6666', -- red
    '#b5bd68', -- green
    '#f0c674', -- yellow
    '#6c9ac1', -- blue
    '#b294bb', -- magenta
    '#8abeb7', -- cyan
    '#c5c8c6', -- white
  },
  brights = {
    '#1c1a1a', -- black
    '#d54e53', -- red
    '#b9ca4a', -- green
    '#e7c547', -- yellow
    '#7aa6da', -- blue
    '#c397d8', -- magenta
    '#70c0b1', -- cyan
    '#eaeaea', -- white
  },
}

config.window_padding = {
  left = 4,
  right = 4,
  top = 4,
  bottom = 4,
}

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'Github Dark'
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.hide_tab_bar_if_only_one_tab = true


-- and finally, return the configuration to wezterm
return config
