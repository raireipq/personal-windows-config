local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("OverpassM Nerd Font")
config.font_size = 14
config.color_scheme = 'Kanagawa Dragon (Gogh)'
config.default_prog = { "pwsh" }
config.window_decorations = "RESIZE"
config.enable_tab_bar = false

return config
