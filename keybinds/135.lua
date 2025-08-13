setup:set_fps_cap(135) -- set frame rate
--managers.user:set_setting("fps_cap", 135) -- sync to video setting

local fps_limit = managers.localization:text("menu_fps_limit")
managers.hud:show_hint({text = fps_limit .. ": 135"})