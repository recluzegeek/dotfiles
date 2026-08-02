vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("plugins")

require("config.options")
require("config.keymaps")
require("config.autocmds")

require("plugins.ui").setup()
require("plugins.navigation").setup()
require("plugins.explorer").setup()
require("plugins.terminal").setup()

require("plugins.treesitter").setup()
require("plugins.completion").setup()

require("plugins.lsp").setup()
require("plugins.formatting").setup()
