-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

local programs = require("categories.programs")

hl.on("hyprland.start", function()
    hl.exec_cmd(programs.terminal)
    hl.exec_cmd("swaync & waybar & hyprpaper")

    hl.exec_cmd([[bash -c 'if ! pgrep -x ssh-agent > /dev/null; then eval "$(ssh-agent -s)"; fi']])
end)
