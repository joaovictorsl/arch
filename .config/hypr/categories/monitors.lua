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

	restart_layer_clients()
end

-- Upon reload check builtin display current state to avoid
-- enabling it while the lid is closed
if not builtin_display_active() and find_hdmi() then
	set_close_lid_state()
end
-- Lid is opened
hl.bind("switch:off:Lid Switch", function()
	clamshell(true)
end, { locked = true })
-- Lid is closed
hl.bind("switch:on:Lid Switch", function()
	clamshell(false)
end, { locked = true })
