setup:set_fps_cap(unlimited) -- set frame rate
--managers.user:set_setting("fps_cap", unlimited) -- sync to video setting

local fps_limit = managers.localization:text("menu_fps_limit")
local fps_unlimited = managers.localization:text("menu_limit_unlimited")
managers.hud:show_hint({text = fps_limit .. ": " .. fps_unlimited})