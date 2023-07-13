setup:set_fps_cap(45) -- set frame rate
managers.user:set_setting("fps_cap", 45) -- sync to video setting

local fps_limit = managers.localization:text("menu_fps_limit")
if FPSHK.Options.show_on_hud == true then
	managers.hud:show_hint({text = fps_limit .. ": 45"})
end
if FPSHK.Options.show_in_chat == true then
	managers.chat:feed_system_message(ChatManager.GAME, fps_limit .. ": 45")
end