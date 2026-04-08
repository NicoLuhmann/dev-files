local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Catppuccin Latte'
config.scrollback_lines = 10000

config.window_padding = {
  left = 3,
  right = 10,
  top = 0,
  bottom = 0,
}

local action = wezterm.action
config.leader = { key = "h", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
    {
        mods = "LEADER",
        key = "c",
        action = action.SpawnTab "CurrentPaneDomain",
    },
    {
        mods = "LEADER",
        key = "x",
        action = action.CloseCurrentPane { confirm = true }
    },
    {
        mods = "LEADER",
        key = "p",
        action = action.ActivateTabRelative(-1)
    },
    {
        mods = "LEADER",
        key = "n",
        action = action.ActivateTabRelative(1)
    },
}

config.window_decorations = 'TITLE | RESIZE'

config.enable_scroll_bar = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

config.max_fps = 144

return config