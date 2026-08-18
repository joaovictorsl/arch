-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

local programs = require("categories.programs")

hl.on("hyprland.start", function()
	-- Launch the main apps, each on its dedicated workspace.
	-- The "[workspace N]" prefix places the window on that workspace.
	hl.exec_cmd("[workspace 1] " .. programs.terminal)
	hl.exec_cmd("[workspace 2] " .. programs.browser)
	hl.exec_cmd("[workspace 3] " .. programs.notes)
	hl.exec_cmd("[workspace 4] " .. programs.music)

	hl.exec_cmd("swaync & waybar & hyprpaper")

	hl.exec_cmd([[bash -c 'if ! pgrep -x ssh-agent > /dev/null; then eval "$(ssh-agent -s)"; fi']])
end)
