local M = {}

M.BUILTIN_DISPLAY = "eDP-1"

-- Returns the name of the first active HDMI monitor, or nil if none.
function M.get_hdmi()
	for _, m in pairs(hl.get_monitors()) do
		if m.name and m.name:match("^HDMI") then
			return m.name
		end
	end
	return nil
end

function M.is_builtin_display_active()
	for _, m in pairs(hl.get_monitors()) do
		if m.name == M.BUILTIN_DISPLAY then
			return true
		end
	end
	return false
end

-- The "main" display is the external monitor when connected, otherwise the
-- built-in panel. It hosts all workspaces and the waybar.
function M.main_display()
	return M.get_hdmi() or M.BUILTIN_DISPLAY
end

-- Layer-shell surfaces (waybar, hyprpaper) don't follow monitor
-- rearrangement in Hyprland 0.55+, so restart them to fix their position.
function M.restart_layer_clients()
	hl.exec_cmd(
		"killall -9 waybar 2>/dev/null; killall hyprpaper 2>/dev/null; setsid waybar >/dev/null 2>&1 & setsid hyprpaper >/dev/null 2>&1 &"
	)
end

function M.set_open_lid_state(hdmi)
	hl.monitor({ output = M.BUILTIN_DISPLAY, mode = "preferred", position = "0x0", scale = "auto", disabled = false })
	hl.monitor({ output = hdmi, position = "auto" })
end

function M.set_close_lid_state()
	hl.monitor({ output = M.BUILTIN_DISPLAY, disabled = true })
end

return M
