return {
	"CRAG666/code_runner.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("code_runner").setup({

			notify = true,
			mode = "term",

			filetype = {
				cpp = "g++ $fileName -o main.exe && main.exe < input.txt > output.txt",
			},
		})

		vim.keymap.set("n", "<F5>", "<Cmd>w<CR><Cmd>RunCode<CR>")
	end,
}
