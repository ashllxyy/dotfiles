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
vim.keymap.set("n", "<A-j>", "<Cmd>m .+1<CR>==")
vim.keymap.set("n", "<A-k>", "<Cmd>m .-2<CR>==")

-- Visual mode (preserves selection + indentation)
vim.keymap.set("v", "<A-j>", "<Cmd>m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", "<Cmd>m '<-2<CR>gv=gv")
