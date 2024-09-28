local config = {}
local wezterm = require 'wezterm'
local action = wezterm.action

if wezterm.config_builder then config = wezterm.config_builder() end

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then return 'Github Dark (Gogh)' end
  return 'Github Light (Gogh)'
end

local github_light_scheme = wezterm.get_builtin_color_schemes()['Github Light (Gogh)']
github_light_scheme.background = '#f6f8fa'
github_light_scheme.ansi[2] = '#cf222e'
github_light_scheme.ansi[3] = '#1a7f37'
github_light_scheme.ansi[4] = '#9a6700'
github_light_scheme.ansi[6] = '#8250df'
github_light_scheme.ansi[7] = '#1b7c83'
github_light_scheme.brights[2] = '#a40e26'
github_light_scheme.brights[3] = '#2da44e'
github_light_scheme.brights[4] = '#bf8700'
github_light_scheme.brights[6] = '#a475f9'

config.animation_fps = 60
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
config.color_schemes = {
  ['Github Light (Gogh)'] = github_light_scheme,
}
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

config.keys = {
  { key = 'l', mods = 'ALT', action = action.ShowLauncher },
  { key = 'w', mods = 'ALT', action = action.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' } },
  { key = 'n', mods = 'ALT', action = action.SwitchWorkspaceRelative(1) },
  { key = 'p', mods = 'ALT', action = action.SwitchWorkspaceRelative(-1) },
}

wezterm.on('format-window-title', function(tab)
  local active_workspace = wezterm.mux.get_active_workspace()
  local workspace = active_workspace ~= 'default' and string.format(' / %s', active_workspace) or ''

  return tab.active_pane.title .. workspace
end)

return config
