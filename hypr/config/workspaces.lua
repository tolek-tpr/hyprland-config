require("./config/monitors.lua")

Workspaces = {
	Browser = 1,
	Coding = 2,
	Misc = 3,
	Discord = {
		ws = 4,
		monitor = "MONITOR2"
	}
}


function SetupWorkspaces()
	for name, value in pairs(Workspaces) do
		local id

		if type(value) == "table" then
			id = value.ws

			local monitor = Roles.resolve(value.monitor)

			if not monitor then
				goto skip
			end
			
			hl.dsp.workspace.move({ 
				workspace = value.ws,
				monitor = monitor
			})
		else
			id = value
		end

		::skip::
	
		hl.workspace_rule({
			workspace = tostring(id),
			default_name = name,
			persistent = true
		})
	end
end

function GetWorkspaceId(ws)
	local id
	
	if type(ws) == "table" then
		id = ws.ws
	else
		id = ws
	end

	return id
end

hl.on("hyprland.start", SetupWorkspaces)
hl.on("monitor.layout_changed", SetupWorkspaces)
hl.on("config.reloaded", SetupWorkspaces)
