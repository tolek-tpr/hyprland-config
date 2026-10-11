require("./config/settings.lua")

hl.monitor({
	output="",
	mode="preferred",
	position="auto",
	scale="1"
})

Roles = {
	MONITOR1 = nil,
	MONITOR2 = nil
}

function Roles.refresh()
	local monitors = hl.get_monitors()
	local names = {}

	for _, monitor in ipairs(monitors) do
		table.insert(names, monitor.name)
	end

	Roles.MONITOR1 = nil
	Roles.MONITOR2 = nil

	for _, name in ipairs(names) do
		if name == PreferredMonitor then
			Roles.MONITOR1 = name
			break
		end
	end

	Roles.MONITOR1 = Roles.MONITOR1 or names[1]

	for _, name in ipairs(names) do
		if name ~= Roles.MONITOR1 then
			Roles.MONITOR2 = name
			break
		end
	end
end

function Roles.resolve(name) 
	if Roles[name] then
		return Roles[name]
	end

	return Roles.MONITOR1
end

Roles.refresh()
