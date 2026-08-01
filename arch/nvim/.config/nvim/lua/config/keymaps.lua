local map = vim.keymap.set

-- Fast window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

-- Quick Escaping
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })

-- Clear searches easily
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Better line indenting behaviors in visual mode
map("v", "<", "<gv", { desc = "Indent Less" })
map("v", ">", ">gv", { desc = "Indent More" })

local wk = require("which-key")

wk.add({
	{ "<leader>f", group = "Find" },
	{ "<leader>g", group = "Git" },
	{ "<leader>l", group = "LSP" },
	{ "<leader>t", group = "Terminal / Tasks" },
	{ "<leader>d", group = "Debug" },
	{ "<leader>x", group = "Diagnostics" },
	{ "<leader>p", group = "Project" },
	{ "<leader>u", group = "UI" },
	{ "<leader>s", group = "Search / Session" },
})

-- Move lines ---------------------------------------------------------------

-- Normal mode
map("n", "<A-j>", "<cmd>m .+1<CR>==", {
	desc = "Move line down",
})

map("n", "<A-k>", "<cmd>m .-2<CR>==", {
	desc = "Move line up",
})

-- Visual mode
map("v", "<A-j>", ":m '>+1<CR>gv=gv", {
	desc = "Move selection down",
})

map("v", "<A-k>", ":m '<-2<CR>gv=gv", {
	desc = "Move selection up",
})

-- Insert mode
map("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", {
	desc = "Move line down",
})

map("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", {
	desc = "Move line up",
})

-- Duplicate lines ----------------------------------------------------------

-- Normal mode
map("n", "<A-S-j>", "yyp", {
	desc = "Duplicate line downward",
})

map("n", "<A-S-k>", "yyP", {
	desc = "Duplicate line upward",
})

-- Visual mode
map("v", "<A-S-j>", "yPgv=gv", {
	desc = "Duplicate selection downward",
})

map("v", "<A-S-k>", "yPgv=gv", {
	desc = "Duplicate selection upward",
})

-- Visual paste without destroying yank -------------------------------------

map("x", "p", '"_dP', {
	desc = "Paste without replacing register",
})

-- Center search navigation -------------------------------------------------

map("n", "n", "nzzzv", {
	desc = "Next search result centered",
})

map("n", "N", "Nzzzv", {
	desc = "Previous search result centered",
})

map("n", "*", "*zzzv", {
	desc = "Search word forward centered",
})

map("n", "#", "#zzzv", {
	desc = "Search word backward centered",
})
