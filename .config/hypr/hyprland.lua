-- Hyprland Lua configuration (hyprlang was deprecated in Hyprland 0.55)
-- See https://wiki.hypr.land/Configuring/Start/

-----------------------------
---- ENVIRONMENT VARIABLES --
-----------------------------

require("categories.env_variables")

-------------------
---- KEYBINDINGS --
-------------------

require("categories.keybindings")

----------------
---- MONITORS --
----------------

require("categories.clamshell")

---------------------
---- LOOK AND FEEL --
---------------------

require("categories.look_and_feel")

------------------
---- ANIMATIONS --
------------------

require("categories.animations")

-------------
---- INPUT --
-------------

require("categories.input")

------------------------------
---- WINDOWS AND WORKSPACES --
------------------------------

require("categories.windows_and_workspaces")

-----------------
---- AUTOSTART --
-----------------

require("categories.autostart")
