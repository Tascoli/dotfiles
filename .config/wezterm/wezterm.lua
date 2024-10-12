-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- Close confirmation Prompt
-----------------------------

config.window_close_confirmation = 'NeverPrompt'    -- Options:'NeverPrompt'| 'AlwaysPrompt'


-- Color Scheme Section
------------------------

-- config.color_scheme = 'AdventureTime'
-- config.color_scheme = 'Apple System Colors'
config.color_scheme = 'Tokyo Night'


-- Font configuration
---------------------

config.font = wezterm.font 'MesloLGS Nerd Font'
config.font_size = 15.0

-- You can specify some parameters to influence the font selection;
-- for example, this selects a Bold, Italic font variant.
-- config.font =
  -- wezterm.font('JetBrains Mono', { weight = 'Bold', italic = true })

-- Window styling
---------------------
config.window_background_opacity = 0.85
config.macos_window_background_blur = 30
config.initial_cols = 120
config.initial_rows = 30

--  Padding FIX: It's seems dosen't works
-------------------
-- config.window_padding = {
--   left = "10px",
--   right = "10px",
--   top = "10px",
--   bottom = "10px",
-- }
-- Startup  Window on Center
--
wezterm.on("gui-startup", function(cmd)
	local screen = wezterm.gui.screens().main
	local ratio = 0.8
	local width, height = screen.width * ratio, screen.height * ratio
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {
		position = { x = (screen.width - width) / 2, y = (screen.height - height) / 2 },
	})
	-- window:gui_window():maximize()
	window:gui_window():set_inner_size(width, height)
end)

-- Removes tab bar of top
---------------------

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- Removes the title bar, leaving only the tab bar. Keeps
-- the ability to resize by dragging the window's edges.
-- On macOS, 'RESIZE|INTEGRATED_BUTTONS' also looks nice if
-- you want to keep the window controls visible and integrate
-- them into the tab bar.
config.window_decorations = 'RESIZE'
-- Sets the font for the window frame (tab bar)
-- font = wezterm.font({ family = 'Berkeley Mono', weight = 'Bold' }),
--   font_size = 11,
-- }

-- and finally, return the configuration to wezterm
return config
