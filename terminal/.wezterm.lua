local config = {}
local wezterm = require 'wezterm'

if wezterm.config_builder then config = wezterm.config_builder() end

function get_appearance()
  if wezterm.gui then return wezterm.gui.get_appearance() end
  return 'Light'
end

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then return 'tokyonight_night' end
  return 'tokyonight_day'
end

wezterm.on('window-config-reloaded', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  local appearance = window:get_appearance()
  local scheme = scheme_for_appearance(appearance)
  if overrides.color_scheme ~= scheme then
    overrides.color_scheme = scheme
    window:set_config_overrides(overrides)
  end
end)

wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(window:active_workspace())
end)

config.animation_fps = 60
config.color_scheme = scheme_for_appearance(get_appearance())
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
  left = 4,
  right = 4,
  top = 4,
  bottom = 4,
}

return config
