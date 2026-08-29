local M = {}

M.WORKSPACE_COUNT = 4

-- Keep a constant set of 4 workspaces on the given monitor. They are
-- persistent (never removed while empty) and the secondary display stays
-- empty until a window is explicitly moved onto it.
function M.bind_workspaces_to(monitor)
	for i = 1, M.WORKSPACE_COUNT do
		hl.workspace_rule({ workspace = tostring(i), monitor = monitor, persistent = true })
	end
end

-- Point waybar at the given monitor by rewriting its config.
function M.set_waybar_output(monitor, waybar_config)
	local f = io.open(waybar_config, "r")
	if not f then
		return
	end
	local content = f:read("*a")
	f:close()

	-- Drop any existing "output" line, then insert the new one after the
	-- top-level opening brace.
	content = content:gsub('[ \t]*"[ \t]*output[ \t]*"[ \t]*:[^,\n]*,', "")
	content = content:gsub("{\n", '{\n  "output": "' .. monitor .. '",', 1)

	local w = io.open(waybar_config, "w")
	if w then
		w:write(content)
		w:close()
	end
end

return M
