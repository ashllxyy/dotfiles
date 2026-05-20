local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

local config = {}

-- ====================================
-- Font
-- ====================================

config.font = wezterm.font("JetBrainsMonoNL Nerd Font")
config.font_size = 12

-- ====================================
-- Window Appearance
-- ====================================

config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

-- ====================================
-- Keybindings
-- ====================================

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

	-- =========================
	-- Launch CP Workspace
	-- =========================

	{
		key = "a",
		mods = "ALT",
		action = wezterm.action_callback(function()
			local tab, pane, window = mux.spawn_window({
				workspace = "cp",
				cwd = "C:/ashllxyy/Programming/CP",
			})

			-- Left pane -> code.cpp
			pane:send_text("nvim code.cpp\r")

			-- Top-right pane -> input.txt
			local input_pane = pane:split({
				direction = "Right",
				size = 0.3,
			})

			input_pane:send_text("nvim input.txt\r")

			-- Bottom-right pane -> output.txt
			local output_pane = input_pane:split({
				direction = "Bottom",
				size = 0.5,
			})

			output_pane:send_text("nvim output.txt\r")

			window:gui_window():maximize()
			window:gui_window():focus()
		end),
	},
}

return config
