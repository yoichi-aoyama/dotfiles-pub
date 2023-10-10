local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

config = {
--  font = wezterm.font 'JetBrains Mono',
--  font = wezterm.font 'Ricty Diminished',
-- font = wezterm.font '0xProto',
  font = wezterm.font 'HackGen35 Console NF',
  command_palette_font_size = 17.0,
  font_size = 17.0,
  adjust_window_size_when_changing_font_size = false,

  color_scheme = "Dracula",
  cell_width = 1.0,
  line_height = 1.0,

--  color_scheme = 'Vibrantlnk',

--  window_padding = {
--    left = 0.1,
--    right = 0.1,
--    top = 0.1,
--    bottom = 0.1,
--  },

  tab_bar_at_bottom = true,

  keys = {
    { key = 'UpArrow', mods = 'SHIFT', action = act.ScrollToPrompt(-1) },
    { key = 'DownArrow', mods = 'SHIFT', action = act.ScrollToPrompt(1) },
  },

  scrollback_lines = 40000,

  enable_scroll_bar = true,
  colors = {
    scrollbar_thumb = '#555555',
    tab_bar = {
        active_tab = {
            bg_color = '#000000',
            fg_color = '#F0F0F0',
        },
        inactive_tab = {
            bg_color = '#111111',
            fg_color = '#808080',
        },
    },
  },

  keys = {
    { key = 'PageUp', mods = 'SHIFT', action = act.ScrollByPage(-1) },
    { key = 'PageDown', mods = 'SHIFT', action = act.ScrollByPage(1) },
  },
  macos_forward_to_ime_modifier_mask = "SHIFT|CTRL",


  leader = { key="q", mods="CTRL", timeout_milliseconds=1000 },
  keys = {
      { key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
      { key = "q", mods = "LEADER", action = act.CloseCurrentTab{ confirm = true } },
      { key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
      { key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
      { key = "w", mods = "LEADER", action = act.ShowTabNavigator },

      { key = "v", mods = "LEADER", action = act.SplitHorizontal{ domain = "CurrentPaneDomain" } },
      { key = "s", mods = "LEADER", action = act.SplitVertical{ domain = "CurrentPaneDomain" } },
      { key = "x", mods = "LEADER", action = act.CloseCurrentPane{ confirm = true } },
      { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },

      { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
      { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
      { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
      { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
      { key = "H", mods = "LEADER", action = act.AdjustPaneSize{"Left", 10} },
      { key = "L", mods = "LEADER", action = act.AdjustPaneSize{"Right", 10} },
      { key = "K", mods = "LEADER", action = act.AdjustPaneSize{"Up", 5} },
      { key = "J", mods = "LEADER", action = act.AdjustPaneSize{"Down", 5} },

      -- { key = "x", mods = "CTRL|SHIFT", action = act.ActivateCopyMode },
      { key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },

      { key = "Enter", mods = "ALT", action = 'DisableDefaultAssignment' },
  },

  use_fancy_tab_bar = true,

}

-- Use the defaults as a base
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- table.insert(config.hyperlink_rules, {
--   regex = '(ERROR)',
--   format = '$0',
--   highlight = 1,
-- })

config.window_close_confirmation = 'NeverPrompt'

return config

