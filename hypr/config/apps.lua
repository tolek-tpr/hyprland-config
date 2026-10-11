require("./config/workspaces.lua")

Terminal = "kitty"
TuiFileManager = "yazi"
GuiFileManager = "thunar"
Launcher = "hyprlauncher"
Browser = "firefox"
Discord = "Discord"

Apps = {
	terminal = {
		class = Terminal,
		command = Terminal,
		bind = "CTRL + ALT + T"
	},
	tuiFiles = {
		class = TuiFileManager,
		command = Terminal .. " --class " .. TuiFileManager .. " -e " .. TuiFileManager,
		float = {
			center = true,
			size = {"(monitor_w*0.8)", "(monitor_h*0.8)"}
		},
		bind = "SUPER + E"
	},
	guiFiles = {
		class = GuiFileManager,
		command = GuiFileManager,
		float = {
			center = true
		},
		bind = "SUPER + SHIFT + E"
	},
	browser = {
		workspace = Workspaces.Browser,
		class = Browser,
		command = Browser
	},
	discord = {
		workspace = Workspaces.Discord,
		class = Discord,
		command = Discord
	}
}
