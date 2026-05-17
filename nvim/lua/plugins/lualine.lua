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
					{
						"filename",
						path = 3,
					},
				},

				lualine_x = {
					-- notifications like recording@x are shown on lualine
					{
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,

						color = "DiagnosticWarn",

						padding = { left = 1, right = 1 },
					},
					"filetype",
				},

				lualine_y = {},
				lualine_z = { "location" },
			},
		})
	end,
}
