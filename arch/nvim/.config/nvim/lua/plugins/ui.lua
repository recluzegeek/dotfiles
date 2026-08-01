-- Load Modern Dashboard, File Explorer & Terminal Layouts
require('snacks').setup({
  bigfile = { enabled = true },
  dashboard = { enabled = true },
  explorer = { enabled = true },
  indent = { enabled = true },
  input = { enabled = true },
  notifier = { enabled = true },
  scope = { enabled = true },
  statuscolumn = { enabled = true },
  terminal = { enabled = true },
})

local fzf = require('fzf-lua')

-- Keybinds for project navigation
vim.keymap.set('n', '<leader><space>', fzf.files, { desc = 'Find files in project' })
vim.keymap.set('n', '<leader>sg', fzf.live_grep, { desc = 'Search text across project' })
vim.keymap.set('n', '<leader>sb', fzf.buffers, { desc = 'Search open buffers' })
vim.keymap.set('n', '<leader>sh', fzf.help_tags, { desc = 'Search Help Documentation' })

-- Snacks Terminal toggles
vim.keymap.set('n', '<leader>ft', function() Snacks.terminal.toggle() end, { desc = 'Toggle Floating Terminal' })
vim.keymap.set('n', '<leader>e', function() Snacks.explorer() end, { desc = 'Toggle File Explorer' })

