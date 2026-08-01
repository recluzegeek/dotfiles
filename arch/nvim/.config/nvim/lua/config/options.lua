local opt = vim.opt

opt.number = true -- Show line numbers
opt.relativenumber = true -- Relative line numbers for easy jumping
opt.clipboard = 'unnamedplus' -- Sync with system clipboard

-- Tabs & Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Search UI
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false -- Clear highlights on new searches

-- Comfort behaviors
opt.mouse = 'a'
opt.termguicolors = true
opt.signcolumn = 'yes'
opt.updatetime = 100
opt.timeoutlen = 300
opt.scrolloff = 10 -- Keep cursor centered contextually

vim.opt.undofile = true -- Keep undo history preserverd even after nvim closure

--------------------------------------------------
-- Editor State
--------------------------------------------------

local state = vim.fn.stdpath 'state'

vim.fn.mkdir(state .. '/swap', 'p')
vim.fn.mkdir(state .. '/undo', 'p')

vim.opt.swapfile = true
vim.opt.directory = state .. '/swap'

vim.opt.undofile = true
vim.opt.undodir = state .. '/undo'

vim.opt.undolevels = 10000
vim.opt.undoreload = 10000

--------------------------------------------------
-- Saving
--------------------------------------------------

vim.opt.confirm = true
-- vim.opt.autowrite = true
-- vim.opt.autowriteall = true

-- disable backup files - we rely on git, persistant undo & sessions
vim.opt.backup = false
vim.opt.writebackup = false
