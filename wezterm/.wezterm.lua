local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

-- font
config.font = wezterm.font("jetbrainsmononl nerd font")
config.font_size = 12

-- optional: cleaner look
config.window_decorations = "resize"
config.hide_tab_bar_if_only_one_tab = true

-- pane navigation with ctrl+h/j/k/l
config.keys = {
	{
		key = "h",
		mods = "ctrl",
		action = act.ActivatePaneDirection("left"),
	},
	{
		key = "j",
		mods = "ctrl",
		action = act.ActivatePaneDirection("down"),
	},
	{
		key = "k",
		mods = "ctrl",
		action = act.ActivatePaneDirection("up"),
	},
	{
		key = "l",
		mods = "ctrl",
		action = act.ActivatePaneDirection("right"),
	},

	-- Split left/right
	{
		key = "v",
		mods = "ALT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	-- Split top/bottom
	{
		key = "s",
		mods = "ALT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
}

return config
