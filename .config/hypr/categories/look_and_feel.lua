-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/

local wal = require("categories.colors")

-- Converts a pywal hex color like "#rrggbb" to Hyprland's rgba() form.
local function rgba(hex, alpha)
	return "rgba(" .. hex:sub(2) .. alpha .. ")"
end

-- Focus is indicated with pywal-colored borders; fall back to a fixed
-- scheme if pywal hasn't generated a palette yet.
local active_border
local inactive_border
if wal then
	active_border = { colors = { wal.colors.color2, wal.colors.color4 }, angle = 45 }
	inactive_border = rgba(wal.colors.color8, "aa")
else
	active_border = { colors = { "rgba(8833ffee)", "rgba(5e2ca5ee)" }, angle = 45 }
	inactive_border = "rgba(595959aa)"
end

hl.config({
	-- https://wiki.hypr.land/Configuring/Basics/Variables/#general
	general = {
		gaps_in = 5,
		gaps_out = 10,

		border_size = 2,

		-- https://wiki.hypr.land/Configuring/Basics/Variables/#variable-types for info about colors
		col = {
			active_border = active_border,
			inactive_border = inactive_border,
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
	decoration = {
		rounding = 10,
		rounding_power = 2,

		-- Focus is shown via the pywal-colored border, not opacity
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},

		-- https://wiki.hypr.land/Configuring/Basics/Variables/#blur
		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
	-- Note: there is no longer a "pseudotile" config option; pseudo mode is
	-- toggled per-window at runtime with the hl.dsp.window.pseudo() dispatcher.
	dwindle = {
		preserve_split = true, -- You probably want this
	},

	-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
	master = {
		new_status = "master",
	},

	-- https://wiki.hypr.land/Configuring/Basics/Variables/#misc
	misc = {
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
	},
})

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
