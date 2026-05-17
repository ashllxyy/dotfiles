return {
	"nvim-lualine/lualine.nvim",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = "",
				section_separators = "",
				globalstatus = true,
			},

			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },

				lualine_c = {
					{
						"filename",
						path = 3,
					},
				},
				lualine_x = { "filetype" },
				lualine_y = {},
				lualine_z = { "location" },
			},
		})
	end,
}
