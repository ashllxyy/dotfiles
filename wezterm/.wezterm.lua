local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

-- font
config.font = wezterm.font("JetBrainsMonoNL Nerd Font")
config.font_size = 12

-- optional: cleaner look
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

-- pane navigation with ctrl+h/j/k/l
config.keys = {
	-- =========================
	-- Pane Navigation
	-- =========================
	{
		key = "h",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Right"),
	},

	-- =========================
	-- Split Panes
	-- =========================

	-- Vertical split (left/right)
	{
		key = "\\",
		mods = "ALT",
		action = act.SplitHorizontal({
			domain = "CurrentPaneDomain",
		}),
	},

	-- Horizontal split (top/bottom)
	{
		key = "-",
		mods = "ALT",
		action = act.SplitVertical({
			domain = "CurrentPaneDomain",
		}),
	},

	-- =========================
	-- Close Pane
	-- =========================
	{
		key = "x",
		mods = "ALT",
		action = act.CloseCurrentPane({
			confirm = false,
		}),
	},

	-- =========================
	-- Maximize / Restore Pane
	-- =========================
	{
		key = "f",
		mods = "ALT",
		action = act.TogglePaneZoomState,
	},

	-- =========================
	-- Resize Panes
	-- =========================
	{
		key = "H",
		mods = "ALT|SHIFT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "J",
		mods = "ALT|SHIFT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "K",
		mods = "ALT|SHIFT",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "L",
		mods = "ALT|SHIFT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
}

return config
