local wezterm = require 'wezterm'
local local_config = {}

-- Try to load the local config file, use defaults if it doesn't exist
local ok, config = pcall(function()
  local config_path = wezterm.home_dir .. "/.wezterm-local.lua"
  return dofile(config_path)
end)

if ok then
  local_config = config
else
  -- Default values if local config doesn't exist
  local_config = {
    font_size = 12.8,
  }
end

return {
  color_scheme = 'Dracula',
  font = wezterm.font("SFMono Nerd Font", { weight = "DemiBold", stretch = "Normal", style = "Normal" }),
  font_size = local_config.font_size,
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
    {
      key = 'r',
      mods = 'CMD|SHIFT',
      action = wezterm.action.ReloadConfiguration,
    },
  }
}
