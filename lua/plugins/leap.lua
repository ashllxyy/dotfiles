return {
	{
		url = "https://codeberg.org/andyg/leap.nvim",
		dependencies = {
			"tpope/vim-repeat",
		},
		config = function()
			local leap = require("leap")

			vim.keymap.set({ "n", "x", "o" }, "gs", function()
				leap.leap({ target_windows = { vim.api.nvim_get_current_win() } })
			end)
		end,
	},
}
