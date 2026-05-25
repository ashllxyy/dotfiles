return {
	{ "mason-org/mason.nvim", opts = {} },
	{
		"mason-org/mason-lspconfig.nvim",

		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},

		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
				},
			})

			vim.lsp.enable("lua_ls")
			vim.lsp.enable("clangd")

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local opts = { buffer = ev.buf }

					-- hover docs
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

					-- go to definition
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

					-- rename symbol
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

					-- code actions
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

					-- format current buffer
					vim.keymap.set("n", "<leader>gf", function()
						vim.lsp.buf.format()
					end, opts)
				end,
			})
		end,
	},
}
