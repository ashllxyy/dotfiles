local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

local config = {}

config.default_prog = { "powershell.exe" }

config.font = wezterm.font("JetBrainsMonoNL Nerd Font")
config.font_size = 9

config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
config.win32_system_backdrop = "Acrylic"

config.keys = {
	-- Pane Navigation
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
	-- Split Panes
	{
		key = "\\",
		mods = "ALT",
		action = act.SplitHorizontal({
			domain = "CurrentPaneDomain",
		}),
	},
	{
		key = "-",
		mods = "ALT",
		action = act.SplitVertical({
			domain = "CurrentPaneDomain",
		}),
	},
	-- Close Pane
	{
		key = "x",
		mods = "ALT",
		action = act.CloseCurrentPane({
			confirm = false,
		}),
	},
	-- Maximize / Restore Pane
	{
		key = "f",
		mods = "ALT",
		action = act.TogglePaneZoomState,
	},
	-- Resize Panes
	{
		key = "H",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},

	{
		key = "J",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},

	{
		key = "K",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},

	{
		key = "L",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},

	-- Custom Commands
	-- Launch CP Workspace
	{
		key = "a",
		mods = "ALT",
		action = wezterm.action_callback(function()
			local tab, pane, window = mux.spawn_window({
				workspace = "cp",
				cwd = "C:/ashllxyy/Programming/competitive_programming",
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

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():toggle_fullscreen()
end)

return config
