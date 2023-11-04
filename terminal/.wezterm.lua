local config = {}
local wezterm = require 'wezterm'

if wezterm.config_builder then config = wezterm.config_builder() end

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then return 'Tokyo Night' end
  return 'Github'
end

config.animation_fps = 60
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
config.font = wezterm.font {
  family = 'Iosevka Nerd Font',
  weight = 'Medium',
}
config.font_size = 14.0
config.freetype_load_target = 'Light'
config.freetype_render_target = 'HorizontalLcd'
config.hide_tab_bar_if_only_one_tab = true
config.initial_cols = 120
config.initial_rows = 30
config.native_macos_fullscreen_mode = true
config.scrollback_lines = 20000
config.window_close_confirmation = 'NeverPrompt'
config.window_padding = {
  left = 16,
  right = 16,
  top = 16,
  bottom = 16,
}

return config
