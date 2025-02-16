local wezterm = require 'wezterm'
local action = wezterm.action
local config = wezterm.config_builder and wezterm.config_builder() or {}

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then return 'Rasmus' end
  return 'Github Light'
end

local format_tab_title = function(tab)
  local pane = tab.active_pane
  local active_workspace = wezterm.mux.get_active_workspace()
  local workspace = active_workspace ~= 'default' and string.format(' / %s', active_workspace) or ''
  local domain = string.format(' / %s', pane.domain_name)
  return pane.title .. workspace .. domain
end

config.animation_fps = 60
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
config.font = wezterm.font { family = 'Iosevka Nerd Font', weight = 'Medium' }
config.font_size = 14.0
config.freetype_load_target = 'Light'
config.freetype_render_target = 'HorizontalLcd'
config.hide_tab_bar_if_only_one_tab = true
config.initial_cols = 120
config.initial_rows = 30
config.mux_enable_ssh_agent = false
config.native_macos_fullscreen_mode = true
config.scrollback_lines = 20000
-- config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = true
config.window_close_confirmation = 'NeverPrompt'
config.window_padding = { left = 16, right = 16, top = 16, bottom = 16 }

config.leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
  { key = 'Space', mods = 'LEADER|CTRL', action = action.SendKey { key = 'Space', mods = 'CTRL' } },
  { key = '|', mods = 'LEADER|SHIFT', action = action.SplitHorizontal },
  { key = '"', mods = 'LEADER|SHIFT', action = action.SplitVertical },
  { key = 'x', mods = 'LEADER', action = action.CloseCurrentPane { confirm = true } },
  { key = 'h', mods = 'LEADER', action = action.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'LEADER', action = action.ActivatePaneDirection 'Right' },
  { key = 'k', mods = 'LEADER', action = action.ActivatePaneDirection 'Up' },
  { key = 'j', mods = 'LEADER', action = action.ActivatePaneDirection 'Down' },
  { key = 'o', mods = 'LEADER', action = action.ShowLauncher },
  { key = 's', mods = 'LEADER', action = action.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' } },
  { key = '(', mods = 'LEADER|SHIFT', action = action.SwitchWorkspaceRelative(-1) },
  { key = ')', mods = 'LEADER|SHIFT', action = action.SwitchWorkspaceRelative(1) },
}

wezterm.on('format-window-title', format_tab_title)
wezterm.on('format-tab-title', format_tab_title)

return config
