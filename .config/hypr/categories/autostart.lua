-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

local programs = require("lib.programs")

hl.on("hyprland.start", function()
	-- Launch the main apps, each on its dedicated workspace.
	-- The "[workspace N]" prefix places the window on that workspace.
	hl.exec_cmd("[workspace 1 silent] " .. programs.terminal)
	hl.exec_cmd("[workspace 2 silent] " .. programs.browser)
	hl.exec_cmd("[workspace 3 silent] " .. programs.notes)
	hl.exec_cmd("[workspace 4 silent] " .. programs.music)

	hl.exec_cmd("swaync & waybar & hyprpaper")

	hl.exec_cmd([[bash -c 'if ! pgrep -x ssh-agent > /dev/null; then eval "$(ssh-agent -s)"; fi']])
end)
