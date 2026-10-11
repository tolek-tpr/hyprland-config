local moveKeys = {
	"left",
	"right",
	"up",
	"down"
}

for i = 1, #moveKeys do
	local key = moveKeys[i]
	hl.bind(MainMod .. " + " .. key, hl.dsp.focus({ direction = key }))
	hl.bind(MainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ direction = key }))
end

hl.bind(MainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(MainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Predefined (0-6 -> a/s/d/z/x/c)
local workspace_keys = {
	"w",
	"a",
	"s",
	"d",
	"z",
	"x",
	"c"
}

for i = 1, #workspace_keys do
	hl.bind(MainMod .. " + " .. workspace_keys[i],
		hl.dsp.focus({ workspace = i }))
	hl.bind(MainMod .. " + SHIFT + " .. workspace_keys[i],
		hl.dsp.window.move({ workspace = i, follow = true }))
end

-- Extended Workspaces (super alt z -> enter submap)
hl.bind(MainMod .. " + ALT + z", hl.dsp.submap("extended_workspaces"))

hl.define_submap("extended_workspaces", function()
	BindCommonKeybinds()

	for i = 1, #workspace_keys do
		hl.bind(MainMod .. " + " .. workspace_keys[i],
			hl.dsp.focus({ workspace = i + 7 }))
		hl.bind(MainMod .. " + SHIFT + " .. workspace_keys[i],
				hl.dsp.window.move({ workspace = i + 7, follow = true }))
	end
	
	hl.bind("ESCAPE", hl.dsp.submap("reset"))
end)
