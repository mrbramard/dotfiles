local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28

config.font_size = 12
config.color_scheme = "Gruvbox Material (Gogh)"
config.font = wezterm.font("UbuntuMono Nerd Font")

config.hide_tab_bar_if_only_one_tab = true

return config
