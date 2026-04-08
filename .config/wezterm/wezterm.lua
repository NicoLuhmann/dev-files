local wezterm = require 'wezterm'
local act     = wezterm.action

local config = wezterm.config_builder and wezterm.config_builder() or {}

local function leader(key, action)
  return { key = key, mods = "LEADER", action = action }
end

local function bind(key, mods, action)
  return { key = key, mods = mods, action = action }
end

-- Appearance
config.color_scheme                         = 'Catppuccin Latte'
config.scrollback_lines                     = 10000
config.window_padding                       = { left = 3, right = 10, top = 0, bottom = 0 }
config.window_decorations                   = 'TITLE | RESIZE'
config.enable_scroll_bar                    = true
config.tab_bar_at_bottom                    = true
config.use_fancy_tab_bar                    = false
config.tab_and_split_indices_are_zero_based = true
config.default_cursor_style                 = 'BlinkingBar'
config.cursor_blink_rate                    = 500
config.max_fps                              = 144

-- Leader
config.leader = { key = "h", mods = "CTRL", timeout_milliseconds = 1000 }

-- Key bindings
config.keys = {
  -- Pane navigation
  leader("LeftArrow",  act.ActivatePaneDirection "Left"),
  leader("DownArrow",  act.ActivatePaneDirection "Down"),
  leader("UpArrow",    act.ActivatePaneDirection "Up"),
  leader("RightArrow", act.ActivatePaneDirection "Right"),
  leader("z",          act.TogglePaneZoomState),
  -- Pane splits
  bind('"', 'LEADER|SHIFT', act.SplitVertical   { domain = "CurrentPaneDomain" }),
  bind('%', 'LEADER|SHIFT', act.SplitHorizontal { domain = "CurrentPaneDomain" }),
  -- Tabs
  leader("c", act.SpawnTab "CurrentPaneDomain"),
  leader("p", act.ActivateTabRelative(-1)),
  leader("n", act.ActivateTabRelative(1)),
  bind('&', 'LEADER|SHIFT', act.CloseCurrentTab { confirm = true }),
  -- Close pane
  leader("x", act.CloseCurrentPane { confirm = true }),
  -- Copy / paste (tmux-style)
  leader("[", act.ActivateCopyMode),
  leader("]", act.PasteFrom "Clipboard"),
}

for i = 0, 9 do
  table.insert(config.keys, leader(tostring(i), act.ActivateTab(i)))
end

-- Copy mode (vi / tmux style)
config.key_tables = {
  copy_mode = {
    -- Movement
    { key = "h",          mods = "NONE",  action = act.CopyMode "MoveLeft" },
    { key = "j",          mods = "NONE",  action = act.CopyMode "MoveDown" },
    { key = "k",          mods = "NONE",  action = act.CopyMode "MoveUp" },
    { key = "l",          mods = "NONE",  action = act.CopyMode "MoveRight" },
    { key = "0",          mods = "NONE",  action = act.CopyMode "MoveToStartOfLine" },
    { key = "$",          mods = "NONE",  action = act.CopyMode "MoveToEndOfLineContent" },
    { key = "w",          mods = "NONE",  action = act.CopyMode "MoveForwardWord" },
    { key = "b",          mods = "NONE",  action = act.CopyMode "MoveBackwardWord" },
    { key = "g",          mods = "NONE",  action = act.CopyMode "MoveToScrollbackTop" },
    { key = "G",          mods = "SHIFT", action = act.CopyMode "MoveToScrollbackBottom" },
    -- Arrow / page keys
    { key = "UpArrow",    mods = "NONE",  action = act.CopyMode "MoveUp" },
    { key = "DownArrow",  mods = "NONE",  action = act.CopyMode "MoveDown" },
    { key = "LeftArrow",  mods = "NONE",  action = act.CopyMode "MoveLeft" },
    { key = "RightArrow", mods = "NONE",  action = act.CopyMode "MoveRight" },
    { key = "PageUp",     mods = "NONE",  action = act.CopyMode "PageUp" },
    { key = "PageDown",   mods = "NONE",  action = act.CopyMode "PageDown" },
    -- Selection
    { key = "Space",  mods = "NONE", action = act.CopyMode { SetSelectionMode = "Cell" } },
    -- Copy and exit
    {
      key = "Enter", mods = "NONE",
      action = act.Multiple {
        act.CopyTo "ClipboardAndPrimarySelection",
        act.CopyMode "Close",
      },
    },
    -- Exit
    { key = "q",      mods = "NONE", action = act.CopyMode "Close" },
    { key = "Escape", mods = "NONE", action = act.CopyMode "Close" },
  },
}

return config
