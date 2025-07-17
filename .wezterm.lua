local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 45

config.font_size = 12
config.color_scheme = "Gruvbox Material (Gogh)"
config.font = wezterm.font("UbuntuMono Nerd Font")

config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.95
config.window_padding = {
	left = 0,
	right = 0,
	bottom = 0,
	top = 0,
}

return config
