--- Set the leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Load native plugins via the modular index file
require('config.plugins')

-- Load core configurations
require('config.options')
require('config.keymaps')
require('config.autocommands')

-- Progressively execute configs to keep startup instantaneous
vim.schedule(function()
  require('config.plugins.ui')
  require('config.plugins.coding')
  require('config.plugins.lsp')
  require('config.plugins.utils')
end)
