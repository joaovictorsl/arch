local monitors = require("lib.monitors")
local workspaces = require("lib.workspaces")

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

local WAYBAR_CONFIG = os.getenv("HOME") .. "/.config/waybar/config.jsonc"
-- Recompute the main display and apply workspace + waybar targeting to it.
local function apply_main_display()
	local main = monitors.main_display()
	workspaces.set_waybar_output(main, WAYBAR_CONFIG)
	workspaces.bind_workspaces_to(main)
end

local function clamshell(is_open)
	local hdmi = monitors.get_hdmi()
	if not hdmi then
		return
	end

	if is_open then
		-- Monitor rules merge in Hyprland 0.55+, so 'disabled' must be
		-- explicitly set back to false to re-enable the laptop screen.
		monitors.set_open_lid_state(hdmi)
	else
		monitors.set_close_lid_state()
	end

	apply_main_display()
	monitors.restart_layer_clients()
end

-- Upon reload check builtin display current state to avoid
-- enabling it while the lid is closed
if not monitors.is_builtin_display_active() and monitors.get_hdmi() then
	monitors.set_close_lid_state()
end
-- Apply the main display targeting (workspaces + waybar)
apply_main_display()
-- Re-apply on hotplug so workspaces/waybar follow the main display
hl.on("monitor.added", function()
	apply_main_display()
	monitors.restart_layer_clients()
end)
hl.on("monitor.removed", function()
	apply_main_display()
	monitors.restart_layer_clients()
end)

-- Lid is opened
hl.bind("switch:off:Lid Switch", function()
	clamshell(true)
end, { locked = true })
-- Lid is closed
hl.bind("switch:on:Lid Switch", function()
	clamshell(false)
end, { locked = true })
