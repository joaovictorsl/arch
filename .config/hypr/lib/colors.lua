local WAL_COLORS_FILE = os.getenv("HOME") .. "/.cache/wal/colors.lua"
local file, err = loadfile(WAL_COLORS_FILE)
if file then
	return file()
else
	print(err)
end
