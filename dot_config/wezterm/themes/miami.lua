local palette = {
	black = "#2c2c2c",
	grey = "#8c8787",
	red = "#ba5458",
	pink = "#cc6666",
	olive = "#b5bd68",
	green = "#b9ca4a",
	light_orange = "#ebba7a",
	yellow = "#e6b137",
	carolina = "#b3cbe3",
	ocean = "#89a4f0",
	dimmed_ilac = "#6c6882",
	violet = "#b294bb",
	plum = "#c397d8",
	mint = "#8abeb7",
	aquamarine = "#70c0b1",
	antique_white = "#c5c8c6",
	lemon_white = "#dbdbc1",
}

local colors = {
	foreground = palette.antique_white,
	background = palette.black,
	cursor_bg = palette.lemon_white,
	cursor_border = palette.lemon_white,
	cursor_fg = palette.balck,
	selection_bg = palette.black,
	selection_fg = palette.lemon_white,

	ansi = {
		-- ORDER: { black, red, green, yellow, blue, magenta, cyan, white }
		palette.black,
		palette.red,
		palette.green,
		palette.light_orange,
		palette.ocean,
		palette.violet,
		palette.aquamarine,
		palette.antique_white,
	},
	brights = {
		-- ORDER: { black, red, green, yellow, blue, magenta, cyan, white }
		palette.grey,
		palette.pink,
		palette.olive,
		palette.yellow,
		palette.ocean,
		palette.plum,
		palette.mint,
		palette.lemon_white,
	},
	tab_bar = {
		background = palette.black,
		active_tab = {
			bg_color = palette.black,
			fg_color = palette.antique_white,
		},
		inactive_tab = {
			bg_color = palette.black,
			fg_color = palette.dimmed_ilac,
		},
		inactive_tab_hover = {
			bg_color = palette.black,
			fg_color = palette.grey,
		},
		new_tab = {
			bg_color = palette.black,
			fg_color = palette.dimmed_ilac,
		},
		new_tab_hover = {
			bg_color = palette.black,
			fg_color = palette.grey,
		},
		inactive_tab_edge = palette.dimmed_ilac, -- (Fancy tab bar only)
	},
}

return colors
