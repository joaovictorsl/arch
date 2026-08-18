-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

----------------------
---- CLAMSHELL MODE --
----------------------

-- Returns the name of the first active HDMI monitor, or nil if none.
local function find_hdmi()
	for _, m in pairs(hl.get_monitors()) do
		if m.name and m.name:match("^HDMI") then
			return m.name
		end
	end
	return nil
end

local function builtin_display_active()
	for _, m in pairs(hl.get_monitors()) do
		if m.name == "eDP-1" then
			return true
		end
	end
	return false
end

-- The "main" display is the external monitor when connected, otherwise the
-- built-in panel. It hosts all workspaces and the waybar.
local function main_display()
	return find_hdmi() or "eDP-1"
end

-- Keep a constant set of 4 workspaces on the given monitor. They are
-- persistent (never removed while empty) and the secondary display stays
-- empty until a window is explicitly moved onto it.
local WORKSPACE_COUNT = 4
local function bind_workspaces_to(monitor)
	for i = 1, WORKSPACE_COUNT do
		hl.workspace_rule({ workspace = tostring(i), monitor = monitor, persistent = true })
	end
end

-- Point waybar at the given monitor by rewriting its config.
local WAYBAR_CONFIG = os.getenv("HOME") .. "/.config/waybar/config.jsonc"
local function set_waybar_output(monitor)
	local f = io.open(WAYBAR_CONFIG, "r")
	if not f then
		return
	end
	local content = f:read("*a")
	f:close()

	-- Drop any existing "output" line, then insert the new one after the
	-- top-level opening brace.
	content = content:gsub('[ \t]*"[ \t]*output[ \t]*"[ \t]*:[^,\n]*,', "")
	content = content:gsub("{\n", '{\n  "output": "' .. monitor .. '",', 1)

	local w = io.open(WAYBAR_CONFIG, "w")
	if w then
		w:write(content)
		w:close()
	end
end

-- Recompute the main display and apply workspace + waybar targeting to it.
local function apply_main_display()
	local main = main_display()
	set_waybar_output(main)
	bind_workspaces_to(main)
	return main
end

-- Layer-shell surfaces (waybar, hyprpaper) don't follow monitor
-- rearrangement in Hyprland 0.55+, so restart them to fix their position.
local function restart_layer_clients()
	hl.exec_cmd(
		"killall -9 waybar 2>/dev/null; killall hyprpaper 2>/dev/null; setsid waybar >/dev/null 2>&1 & setsid hyprpaper >/dev/null 2>&1 &"
	)
end

local function set_open_lid_state(hdmi)
	hl.monitor({ output = "eDP-1", mode = "preferred", position = "0x0", scale = "auto", disabled = false })
	hl.monitor({ output = hdmi, position = "auto" })
end

local function set_close_lid_state()
	hl.monitor({ output = "eDP-1", disabled = true })
end

local function clamshell(open)
	local hdmi = find_hdmi()
	if not hdmi then
		return
	end

	if open then
		-- Monitor rules merge in Hyprland 0.55+, so 'disabled' must be
		-- explicitly set back to false to re-enable the laptop screen.
		set_open_lid_state(hdmi)
	else
		set_close_lid_state()
	end

	apply_main_display()
	restart_layer_clients()
end

-- Upon reload check builtin display current state to avoid
-- enabling it while the lid is closed
if not builtin_display_active() and find_hdmi() then
	set_close_lid_state()
end
-- Apply the main display targeting (workspaces + waybar)
apply_main_display()
-- Re-apply on hotplug so workspaces/waybar follow the main display
hl.on("monitor.added", function()
	apply_main_display()
	restart_layer_clients()
end)
hl.on("monitor.removed", function()
	apply_main_display()
	restart_layer_clients()
end)

-- Lid is opened
hl.bind("switch:off:Lid Switch", function()
	clamshell(true)
end, { locked = true })
-- Lid is closed
hl.bind("switch:on:Lid Switch", function()
	clamshell(false)
end, { locked = true })
