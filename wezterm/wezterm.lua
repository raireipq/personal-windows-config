local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("OverpassM Nerd Font")
config.font_size = 12
config.color_scheme = "GruvboxDark"
config.default_prog = { "pwsh", "-nologo" }
config.window_decorations = "RESIZE"
config.enable_tab_bar = false

return config
