local keymap = vim.keymap

-- clear search highlight
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })

-- stay in visual mode when indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move lines/blocks up and down with Alt + j/k

-- Normal mode
vim.keymap.set("n", "<a-j>", "<cmd>m .+1<cr>==")
vim.keymap.set("n", "<a-k>", "<cmd>m .-2<cr>==")

-- move selected block in visual mode
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", { silent = true })
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", { silent = true })
