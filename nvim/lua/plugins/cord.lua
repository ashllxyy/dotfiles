return {
	"vyfor/cord.nvim",
	build = ":Cord update",
	config = function()
		require("cord").setup({
			editor = {
				client = "neovim",
				tooltip = "Neovim",
			},

			display = {
				theme = "minecraft",
				flavor = "dark",
				view = "full",
			},

			idle = {
				enabled = true,
				timeout = 300000,
			},
		})
	end,
}
