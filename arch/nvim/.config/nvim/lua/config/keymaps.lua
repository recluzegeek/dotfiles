local map = vim.keymap.set

-- Fast window navigation
map('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window' })

-- Quick Escaping
map('i', 'jj', '<Esc>', { desc = 'Exit insert mode' })

-- Clear searches easily
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Better line indenting behaviors in visual mode
map('v', '<', '<gv', { desc = 'Indent Less' })
map('v', '>', '>gv', { desc = 'Indent More' })

local wk = require 'which-key'

wk.add {
  { '<leader>f', group = 'Find' },
  { '<leader>g', group = 'Git' },
  { '<leader>l', group = 'LSP' },
  { '<leader>t', group = 'Terminal / Tasks' },
  { '<leader>d', group = 'Debug' },
  { '<leader>x', group = 'Diagnostics' },
  { '<leader>p', group = 'Project' },
  { '<leader>u', group = 'UI' },
  { '<leader>s', group = 'Search / Session' },
}
