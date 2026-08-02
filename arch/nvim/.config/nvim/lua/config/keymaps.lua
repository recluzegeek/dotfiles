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
	{ "<leader>s", group = "Search" },
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

-- Register safety ----------------------------------------------------------

-- Delete single characters without overwriting yank register
map("n", "x", '"_x', { desc = "Delete character without replacing register" })
map("n", "X", '"_X', { desc = "Delete backward without replacing register" })

-- Delete motions/text-objects in Normal mode
map({ "n", "v" }, "d", '"_d', { desc = "Delete without replacing register" })
map({ "n", "v" }, "D", '"_D', { desc = "Delete to end of line without replacing register" })

-- Visual mode x
map("v", "x", '"_d', { desc = "Delete selection without replacing register" })

-- Change text without overwriting yank register
map({ "n", "v" }, "c", '"_c', { desc = "Change text without replacing register" })
map({ "n", "v" }, "C", '"_C', { desc = "Change to end of line without replacing register" })

-- Cut Functionality (Using 's' for Snip/Slice) -----------------------------

-- Use 's' to Cut text in Normal and Visual modes (replaces default substitute)
map({ "n", "v" }, "s", "d", { desc = "Cut text into register" })
map("n", "ss", "dd", { desc = "Cut entire line into register" })
map({ "n", "v" }, "S", "D", { desc = "Cut to end of line into register" })

--------------------------------------------------
-- Buffers
--------------------------------------------------

map("n", "<S-l>", "<cmd>bnext<CR>", {
	desc = "Next buffer",
})

map("n", "<S-h>", "<cmd>bprevious<CR>", {
	desc = "Previous buffer",
})

map("n", "<leader>bd", function()
	local current = vim.api.nvim_get_current_buf()

	vim.cmd("bnext")

	if vim.api.nvim_get_current_buf() == current then
		vim.cmd("enew")
	end

	vim.cmd("bdelete " .. current)
end, {
	desc = "Delete buffer",
})

map("n", "<leader>bo", "<cmd>%bdelete|edit#|bdelete#<CR>", {
	desc = "Delete other buffers",
})
