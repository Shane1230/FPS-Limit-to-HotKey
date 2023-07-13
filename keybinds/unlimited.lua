setup:set_fps_cap(unlimited) -- set frame rate
managers.user:set_setting("fps_cap", unlimited) -- sync to video setting

local fps_limit = managers.localization:text("menu_fps_limit")
local fps_unlimited = managers.localization:text("menu_limit_unlimited")
if FPSHK.Options.show_on_hud == true then
	managers.hud:show_hint({text = fps_limit .. ": " .. fps_unlimited})
end
if FPSHK.Options.show_in_chat == true then
	managers.chat:feed_system_message(ChatManager.GAME, fps_limit .. ": " .. fps_unlimited)
end