return {
	"nyoom-engineering/oxocarbon.nvim",
	priority = 1000,

	config = function()
		vim.cmd.colorscheme("oxocarbon")

		-- Pure black backgrounds
		local bg = "#000000"

		vim.api.nvim_set_hl(0, "Normal", { bg = bg })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = bg })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = bg })
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = bg })
		vim.api.nvim_set_hl(0, "LineNr", { bg = bg })
		vim.api.nvim_set_hl(0, "CursorLineNr", { bg = bg })

		-- Floating windows
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = bg })
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = bg })

		-- Telescope
		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = bg })
		vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = bg })

		-- Optional: transparent statusline feel
		vim.api.nvim_set_hl(0, "StatusLine", { bg = bg })
		vim.api.nvim_set_hl(0, "StatusLineNC", { bg = bg })
	end,
}
