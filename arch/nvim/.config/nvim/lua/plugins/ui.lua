local M = {}

function M.setup()
  local Snacks = require 'snacks'

  Snacks.setup {
    notifier = {
      enabled = true,
    },

    input = {
      enabled = true,
    },

    bigfile = {
      enabled = true,
    },

    indent = {
      enabled = true,
    },

    scope = {
      enabled = true,
    },
  }

  require('which-key').setup {
    preset = 'modern',
    delay = 300,
  }
end

return M
