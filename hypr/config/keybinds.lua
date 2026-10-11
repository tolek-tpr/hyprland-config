require("./config/settings.lua")
require("./config/windows.lua")

function BindCommonKeybinds()
	hl.bind(MainMod .. " + Q", hl.dsp.window.close())
	hl.bind(MainMod .. " + H", hl.dsp.exec_cmd("hyprlauncher"))
	hl.bind(MainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
	
	hl.bind(MainMod .. " + l", function() 
		AutoOpenApps = not AutoOpenApps
		hl.notification.create({ text = "Auto Open Apps: " .. tostring(AutoOpenApps), timeout = 5000 })
	end)

	setupWindowBinds()
end

BindCommonKeybinds()
