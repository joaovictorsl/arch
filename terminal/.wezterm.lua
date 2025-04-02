-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.enable_tab_bar = false
config.color_scheme = 'GitHub Dark'

-- Background Image Config
config.window_background_image = '/home/joaovictorsl/Pictures/star_wars.jpg'
config.window_background_image_hsb = {
	brightness = 0.025,
	hue = 1.0,
	saturation = 1.0
}
-- Background Image Config

config.keys = {
  -- Turn off the default CMD-m Hide action, allowing CMD-m to
  -- be potentially recognized and handled by the tab
  {
    key = 'N',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'P',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.DisableDefaultAssignment,
  },
}

return config
