---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - Selection-Driven Batch Tools - Selection Service and SelectionChanged"
tags: [roblox, community-knowledge, studio, plugins, selection, building]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Selection
  - https://create.roblox.com/docs/studio/plugins
  - https://create.roblox.com/docs/reference/engine/classes/ChangeHistoryService
---
# Studio Tools - Selection-Driven Batch Tools - Selection Service and SelectionChanged

Most useful builder plugins share one shape: **the user selects things, the plugin does something to all of them**. Examples are random-rotating a hundred rocks, renaming lamp posts `Lamp_01`...`Lamp_40`, or moving every selected model to the ground. The `Selection` service is the bridge between what the builder clicked and your code. Getting it right (descendants, models vs parts, live updates) is what separates a handy tool from a buggy one.

## The API

| Member | Use |
| --- | --- |
| `Selection:Get()` | Array of currently selected instances |
| `Selection:Set(list)` | Replace the selection (for example "select all unanchored parts") |
| `Selection:Add(list)` / `Selection:Remove(list)` | Grow or shrink it |
| `Selection.SelectionChanged` | Fires whenever the selection changes |
| `Selection.SelectionThickness` | Thickness of the highlight outline in the viewport |

`Get()` returns only the **top-level** things the user clicked. Selecting a Model gives you the Model, not its parts.

## Expand the selection the right way

```lua
local Selection = game:GetService("Selection")

-- every BasePart in the selection, including inside models/folders, no duplicates
local function selectedParts(): {BasePart}
	local out, seen = {}, {}
	local function add(p)
		if not seen[p] then seen[p] = true; table.insert(out, p) end
	end
	for _, inst in Selection:Get() do
		if inst:IsA("BasePart") then add(inst) end
		for _, d in inst:GetDescendants() do
			if d:IsA("BasePart") then add(d) end
		end
	end
	return out
end
```

Decide per tool whether it works on **parts** or on **top-level objects**. Random rotation should rotate each Model as a whole with `Model:PivotTo(model:GetPivot() * CFrame.Angles(...))`. Rotating its parts one by one breaks the model apart.

## A complete batch action

```lua
local CHS = game:GetService("ChangeHistoryService")

local function randomYaw()
	local id = CHS:TryBeginRecording("RandomYaw", "Random Y rotation")
	if not id then return end
	local rng = Random.new()
	for _, inst in Selection:Get() do
		if inst:IsA("PVInstance") then -- Models and BaseParts
			local yaw = math.rad(rng:NextNumber(0, 360))
			inst:PivotTo(inst:GetPivot() * CFrame.Angles(0, yaw, 0))
		end
	end
	CHS:FinishRecording(id, Enum.FinishRecordingOperation.Commit)
end
```

`PVInstance` covers both `Model` and `BasePart`, so one pivot call handles both.

## Live panels with SelectionChanged

A panel that shows "12 parts selected, 3 unanchored" should update when the selection changes, but cheaply:

```lua
local pending = false
local conn = Selection.SelectionChanged:Connect(function()
	if pending then return end
	pending = true
	task.defer(function()
		pending = false
		refreshPanel() -- your function
	end)
end)
plugin.Unloading:Connect(function() conn:Disconnect() end)
```

Box-selecting 2,000 parts can fire the event many times in a row. Deferring merges them into one refresh.

## Tools that change the selection

- After "Select all with same material", call `Selection:Set(matches)` so the user can see and use the result in other tools.
- Explorer search can already do many "select all where..." jobs without a plugin. See [[Studio Tools - Explorer Search Queries - Find and Bulk-Select Like a Pro]].
- Don't change the selection while the user is dragging. It feels like the tool is fighting them.

## Pitfalls

- **Locked parts**: users often lock map shells. Skip `BasePart.Locked == true` parts, or offer an option to include them.
- **Packages**: editing parts inside a package changes the package copy. See [[Packages for Map Kits - Shared Props Across Places Without Drift]].
- **Huge selections**: for more than a few thousand instances, show progress and yield with `task.wait()` every few hundred items so Studio stays responsive. Keep everything in **one** recording.
- **Selection is shared**: other plugins and Studio tools change it too. Don't assume it is still what it was before your code yielded.

## Related

[[Claude MCP AI Workflow - Hub]] · [[Studio Tools - Undo-Safe Plugins with ChangeHistoryService Recordings]] · [[Free Building Plugins - Stravant, F3X and Archimedes]] · [[Free Selection, Cleanup and Utility Plugins]]
