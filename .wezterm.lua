local wezterm = require("wezterm")
local config = wezterm.config_builder()
local action = wezterm.action
local act = wezterm.action

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }

config.keys = {
	-- Split pane horizontally (bottom) with CMD+D
	{ key = "d", mods = "CMD", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	-- Split pane vertically (right) with CMD+SHIFT+D
	{ key = "d", mods = "CMD|SHIFT", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{
		key = "LeftArrow",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Down"),
	},
	{ key = "w", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Next") },
	{ key = "w", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Prev") },
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	-- Option (Alt) + Left = move back a word
	{
		key = "LeftArrow",
		mods = "OPT",
		action = wezterm.action.SendString("\x1bb"),
	},
	-- Option (Alt) + Right = move forward a word
	{
		key = "RightArrow",
		mods = "OPT",
		action = wezterm.action.SendString("\x1bf"),
	},
	-- Command + Left = move to beginning of line
	{
		key = "LeftArrow",
		mods = "CMD",
		action = wezterm.action.SendString("\x01"),
	},
	-- Command + Right = move to end of line
	{
		key = "RightArrow",
		mods = "CMD",
		action = wezterm.action.SendString("\x05"),
	},
	-- Command + Backspace = delete to beginning of line
	{
		key = "Backspace",
		mods = "CMD",
		action = wezterm.action.SendString("\x15"),
	},
	-- Resize pane
	{
		key = "h",
		mods = "CMD|CTRL",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "j",
		mods = "CMD|CTRL",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{ key = "k", mods = "CMD|CTRL", action = act.AdjustPaneSize({ "Up", 5 }) },
	{
		key = "l",
		mods = "CMD|CTRL",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
}

config.color_scheme = "Builtin Solarized Dark"

config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
return config
