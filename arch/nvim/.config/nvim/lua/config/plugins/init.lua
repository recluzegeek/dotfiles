--- Pure strings enable Neovim's shorthand GitHub resolver natively
local plugins = {
  'https://github.com/folke/snacks.nvim',
  'https://github.com/ibhagwan/fzf-lua',
  'http://github.com/L3MON4D3/LuaSnip',
  'https://saghen/blink.cmp',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/williamboman/mason.nvim',
  'https://github.com/williamboman/mason-lspconfig.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
  'https://github.com/stevearc/conform.nvim',
}

-- Execute the native manager loop cleanly
vim.pack.add(plugins)
