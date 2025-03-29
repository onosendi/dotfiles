local wezterm = require 'wezterm'

return {
  color_scheme = 'Dracula',
  font = wezterm.font("SFMono Nerd Font", {weight="DemiBold", stretch="Normal", style="Normal"}),
  font_size = 14.8,
  enable_tab_bar = false,
  window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
  },
  default_cursor_style = "SteadyBar",
  colors = {
    background = '#282a36',
    cursor_bg = '#50fa7b',
    cursor_fg = '#282a36',
  },
  keys = {
    {
      key = 'h',
      mods = 'CMD',
      action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
      key = 'l',
      mods = 'CMD',
      action = wezterm.action.ActivatePaneDirection 'Right',
    },
    {
      key = 'j',
      mods = 'CMD',
      action = wezterm.action.ActivatePaneDirection 'Down',
    },
    {
      key = 'k',
      mods = 'CMD',
      action = wezterm.action.ActivatePaneDirection 'Up',
    },
  }
}
