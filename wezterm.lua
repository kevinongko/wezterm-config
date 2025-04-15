local wezterm = require("wezterm")
local act = wezterm.action
local config = {}
config.keys = {}

config.color_scheme = "tokyonight"
config.font = wezterm.font("JetBrains Mono")
config.default_prog = { "nu" }
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- Transparent effect
-- config.window_background_opacity = 0.85 -- Adjust value between 0.0 (fully transparent) and 1.0 (fully opaque)
-- config.win32_system_backdrop = "Acrylic" -- For Windows: "Acrylic", "Mica", or "Tabbed"
-- config.macos_window_background_blur = 20 -- For macOS

-- Get the host OS
local platform = wezterm.target_triple -- Corrected variable name

-- Windows-specific keybindings
if platform:find("windows") then
	-- New tab = Alt+t
	table.insert(config.keys, {
		key = "t",
		mods = "ALT",
		action = act.SpawnTab("DefaultDomain"),
	})

	-- Close tab = Alt+w
	table.insert(config.keys, {
		key = "w",
		mods = "ALT",
		action = act.CloseCurrentTab({ confirm = true }),
	})

	-- Specific tabs by number = Alt + number
	for i = 1, 9 do
		table.insert(config.keys, {
			key = tostring(i),
			mods = "ALT",
			action = act.ActivateTab(i - 1),
		})
	end

	-- Split Horizontal = Alt + h
	table.insert(config.keys, {
		key = "h",
		mods = "ALT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	})

	-- Split Vertical = Alt + v
	table.insert(config.keys, {
		key = "v",
		mods = "ALT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	})

	-- Close Pane = Alt + x
	table.insert(config.keys, {
		key = "x",
		mods = "ALT",
		action = act.CloseCurrentPane({ confirm = true }),
	})
end

return config
