return {
	"nvim-lualine/lualine.nvim",

	Dependencies = {
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
					"filename",
				},

				lualine_x = {
					{
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,
						color = "DiagnosticWarn",
					},
					"filetype",
					{
						function()
							return os.date("%H:%M:%S")
						end,
						icon = "",
					},
				},

				lualine_y = {},
				lualine_z = { "location" },
			},
		})
	end,
}
