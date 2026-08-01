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
