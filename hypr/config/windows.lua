require("./config/apps.lua")
require("./config/settings.lua")

local workspaceToLaunchCmd = {}

-- Setup window rules for all apps
function setupWindowRules()
	workspaceToLaunchCmd = {}
	
	for name, config in pairs(Apps) do
		local hlconfig = {
			name = "window-rule-" .. name,
			match = { class = "^" .. config.class .. "$" }
		}

		if config.float then
			hlconfig.float = true

			if config.float.center then
				hlconfig.center = true
			end
		
			if config.float.size then
				hlconfig.size = config.float.size
			end
		end

		if config.workspace then
			hlconfig.workspace = tostring(GetWorkspaceId(config.workspace))
			workspaceToLaunchCmd[GetWorkspaceId(config.workspace)] = config.command
		end
	
		hl.window_rule(hlconfig)
	end
end

function setupWindowBinds()
	for name, config in pairs(Apps) do
		if config.bind then
			hl.bind(config.bind, hl.dsp.exec_cmd(config.command))
		end
	end
end

function setupWindowWorkspaceHandler()
	hl.on("workspace.active", function(w)
		if not AutoOpenApps then return end
		
		local cmd = workspaceToLaunchCmd[w.id]
		if cmd then
			local windows = hl.get_workspace_windows(w.id)

			for _, win in ipairs(windows) do
				if win.class and win.class:lower():find(cmd, 1, true) then
					return
				end
			end
						
			hl.exec_cmd(cmd)
		end
	end)
end

setupWindowRules()
setupWindowWorkspaceHandler()
