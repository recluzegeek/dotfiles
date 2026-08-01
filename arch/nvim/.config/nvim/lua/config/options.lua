local opt = vim.opt

opt.number = true         -- Show line numbers
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
opt.hlsearch = false      -- Clear highlights on new searches

-- Comfort behaviors
opt.mouse = 'a'
opt.termguicolors = true
opt.signcolumn = 'yes'
opt.updatetime = 250
opt.timeoutlen = 300
opt.scrolloff = 10        -- Keep cursor centered contextually
