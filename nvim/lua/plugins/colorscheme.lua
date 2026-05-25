return {
	{
		"webhooked/kanso.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			require("kanso").setup({
				theme = "zen",
			})
			vim.cmd.colorscheme("kanso")
		end,
	},
}
