local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- highlight on yank
autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = augroup("highlight-yank", { clear = true }),

	callback = function()
		vim.hl.on_yank()
	end,
})

-- automatically format files before saving
autocmd("BufWritePre", {
	desc = "Format on save",

	group = augroup("format-on-save", { clear = true }),

	callback = function(args)
		-- only format if an LSP client is attached
		if next(vim.lsp.get_clients({ bufnr = args.buf })) == nil then
			return
		end

		vim.lsp.buf.format({
			bufnr = args.buf,
			async = false,
		})
	end,
})
