return {
	"karb94/neoscroll.nvim",
	config = function()
		local neoscroll = require("neoscroll")
		neoscroll.setup({})

		vim.keymap.set("n", "<C-d>", function()
			neoscroll.ctrl_d({ duration = 150, easing = "sine" })
			vim.cmd("normal! zz")
		end)

		vim.keymap.set("n", "<C-u>", function()
			neoscroll.ctrl_u({ duration = 150, easing = "sine" })
			vim.cmd("normal! zz")
		end)
	end,
}
