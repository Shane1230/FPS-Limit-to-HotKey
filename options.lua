_G.FPSHK = _G.FPSHK or {}
FPSHK.Mod_Path = ModPath
FPSHK.Save_Path = SavePath .. "FPSHKOptions.txt"
FPSHK.Options = {}

function FPSHK:save()
    local file = io.open(self.Save_Path, "w+")
    if file then
		file:write(json.encode(self.Options))
		file:close()
    end
end

function FPSHK:load()
    local file = io.open(self.Save_Path, "r")
    local data
    if file then
		data = json.decode(file:read("*all"))
		file:close()
    end
    for k, v in pairs(data or {}) do
		self.Options [k] = v
    end
end

if not FPSHK.default then
	FPSHK:load()
	if FPSHK.Options.show_on_hud == nil then
		FPSHK.Options.show_on_hud = true
		FPSHK:save()
	end
	if FPSHK.Options.show_in_chat == nil then
		FPSHK.Options.show_in_chat = false
		FPSHK:save()
	end
	FPSHK:load()
	FPSHK.default = true
end

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

if RequiredScript == "lib/managers/menumanager" then

	Hooks:Add("LocalizationManagerPostInit", "FPSHK_loc", function(loc)
		loc:load_localization_file(FPSHK.Mod_Path .. "loc/english.txt")
		for _, filename in pairs(file.GetFiles(FPSHK.Mod_Path .. "loc/")) do
			local str = filename:match('^(.*).txt$')
			if str and Idstring(str) and Idstring(str):key() == SystemInfo:language():key() then
				loc:load_localization_file(FPSHK.Mod_Path .. "loc/" .. filename)
				break
			end
		end
	end)

	local menu_id_main = "FPSHK.Options"
	Hooks:Add("MenuManagerSetupCustomMenus", "FPSHK_Options", function(menu_manager, nodes)
		MenuHelper:NewMenu(menu_id_main)
	end)

	Hooks:Add("MenuManagerPopulateCustomMenus", "FPSHK_Options", function(menu_manager, nodes)
		FPSHK:load()
		
		MenuCallbackHandler.FPSHK_toggle = function(self, item)
			FPSHK.Options [item:name()] = (item:value() == "on")
			FPSHK:save()
		end

		MenuHelper:AddToggle({
			id = "show_on_hud",
			title = "FPSHK_show_on_hud_title",
			desc = "FPSHK_show_on_hud_desc",
			callback = "FPSHK_toggle",
			value = FPSHK.Options.show_on_hud,
			menu_id = menu_id_main,
			priority = 2
		})
		MenuHelper:AddToggle({
			id = "show_in_chat",
			title = "FPSHK_show_in_chat_title",
			desc = "FPSHK_show_in_chat_desc",
			callback = "FPSHK_toggle",
			value = FPSHK.Options.how_in_chat,
			menu_id = menu_id_main,
			priority = 1
		})

	end)

	Hooks:Add("MenuManagerBuildCustomMenus", "FPSHK_Options", function(menu_manager, nodes)
		nodes[menu_id_main] = MenuHelper:BuildMenu("FPSHK.Options", { area_bg = "half" })
		MenuHelper:AddMenuItem(nodes["blt_options"], menu_id_main, "FPSHK_menu_main_title", "FPSHK_menu_main_desc")
	end)

end