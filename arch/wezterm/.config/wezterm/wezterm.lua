local wezterm = require("wezterm")

local config = wezterm.config_builder()

config = {
  automatically_reload_config = true,
  enable_tab_bar = false,
  window_close_confirmation = "NeverPrompt",
  window_decorations = "RESIZE", -- disable the title bar but enable the resizable border
  default_cursor_style = "SteadyBlock",
  color_scheme = "3024 (base16)",
  font = wezterm.font("JetBrains Mono"),
  font_size = 15.0,

  keys = {
    { key = "Enter", mods = "CTRL",  action = wezterm.action({ SendString = "\x1b[13;5u" }) },
    { key = "Enter", mods = "SHIFT", action = wezterm.action({ SendString = "\x1b[13;2u" }) },
  },

  -- Refined URL parsing rules from https://akos.ma/blog/adopting-wezterm/
  hyperlink_rules = {
    -- Matches: a URL in parens: (URL)
    {
      regex = '\\((\\w+://\\S+)\\)',
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in brackets: [URL]
    {
      regex = '\\[(\\w+://\\S+)\\]',
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in curly braces: {URL}
    {
      regex = '\\{(\\w+://\\S+)\\}',
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in angle brackets: <URL>
    {
      regex = '<(\\w+://\\S+)>',
      format = "$1",
      highlight = 1,
    },
    -- Handle standalone URLs not wrapped in brackets
    {
      regex = '\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)',
      format = "$0",
      highlight = 1,
    },
  },
}

return config
