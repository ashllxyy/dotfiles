vim.loader.enable()

local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true
vim.opt.cursorline = true

-- UI
opt.showmode = false
opt.termguicolors = true
opt.confirm = true

-- search
opt.ignorecase = true
opt.smartcase = true

-- live substitution preview
opt.inccommand = "split"

-- tabs & indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

-- clipboard
vim.schedule(function()
	opt.clipboard = "unnamedplus"
end)

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
