-- set default key
if not BLT.Keybinds:get_keybind("fps_cap_30"):HasKey() then
	BLT.Keybinds:get_keybind("fps_cap_30"):SetKey("num 3")
end
if not BLT.Keybinds:get_keybind("fps_cap_45"):HasKey() then
	BLT.Keybinds:get_keybind("fps_cap_45"):SetKey("num 4")
end
if not BLT.Keybinds:get_keybind("fps_cap_60"):HasKey() then
	BLT.Keybinds:get_keybind("fps_cap_60"):SetKey("num 6")
end
if not BLT.Keybinds:get_keybind("fps_cap_unlimited"):HasKey() then
	BLT.Keybinds:get_keybind("fps_cap_unlimited"):SetKey("num 0")
end