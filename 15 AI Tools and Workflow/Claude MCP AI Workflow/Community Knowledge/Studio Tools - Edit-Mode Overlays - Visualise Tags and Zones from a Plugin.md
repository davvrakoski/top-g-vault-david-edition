---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - Edit-Mode Overlays - Visualise Tags and Zones from a Plugin"
tags: [roblox, community-knowledge, studio, plugins, collectionservice, level-design, debugging]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/CollectionService
  - https://create.roblox.com/docs/reference/engine/classes/Highlight
  - https://create.roblox.com/docs/reference/engine/classes/HandleAdornment
  - https://create.roblox.com/docs/reference/engine/classes/BoxHandleAdornment
  - https://create.roblox.com/docs/studio/properties
---
# Studio Tools - Edit-Mode Overlays - Visualise Tags and Zones from a Plugin

Tag-driven games ([[CollectionService Tag-Driven Architecture]]) hide most of their logic in invisible parts: kill bricks, safe zones, spawn areas, loot points, NPC patrol nodes. Designers then place them blind and only find mistakes in playtests. A small **overlay plugin** draws every tagged object in a colour of its own, in edit mode, and turns off with one click. It is one of the most useful plugins a team can write, and it takes under 100 lines.

## Design

- **One toggle per tag group** (Hazards, Zones, Spawns), using a toolbar button with `SetActive` or a dock panel.
- **Live**: overlays appear and disappear as people tag, untag, add or delete objects. `CollectionService:GetInstanceAddedSignal(tag)` / `GetInstanceRemovedSignal(tag)` handle this.
- **Never saved**: parent all overlay objects to one folder in `CoreGui`, so nothing ends up in the place file.
- **Edit only**: skip when `not RunService:IsEdit()` ([[Studio Tools - Plugins in Play Mode - Edit, Server and Client DataModels]]).

## Core code

```lua
local CollectionService = game:GetService("CollectionService")
local CoreGui = game:GetService("CoreGui")

local folder = Instance.new("Folder")
folder.Name = "TopG_Overlays"
folder.Parent = CoreGui

local STYLE = {
	KillBrick = Color3.fromRGB(230, 60, 60),
	SafeZone  = Color3.fromRGB(60, 200, 110),
	Spawn     = Color3.fromRGB(70, 140, 255),
}

local boxes = {} -- [BasePart] = BoxHandleAdornment
local conns = {}

local function add(part, color)
	if not part:IsA("BasePart") or boxes[part] then return end
	local b = Instance.new("BoxHandleAdornment")
	b.Adornee = part
	b.Size = part.Size
	b.Color3 = color
	b.Transparency = 0.6
	b.AlwaysOnTop = true
	b.ZIndex = 1
	b.Parent = folder
	boxes[part] = b
	table.insert(conns, part:GetPropertyChangedSignal("Size"):Connect(function()
		b.Size = part.Size
	end))
end

local function remove(part)
	if boxes[part] then boxes[part]:Destroy(); boxes[part] = nil end
end

for tag, color in STYLE do
	for _, inst in CollectionService:GetTagged(tag) do add(inst, color) end
	table.insert(conns, CollectionService:GetInstanceAddedSignal(tag):Connect(function(i) add(i, color) end))
	table.insert(conns, CollectionService:GetInstanceRemovedSignal(tag):Connect(remove))
end

plugin.Unloading:Connect(function()
	for _, c in conns do c:Disconnect() end
	folder:Destroy()
end)
```

This version keeps the Size connection even after a part is untagged. A production version should keep one connection list **per part** and disconnect it in `remove`.

## Choosing the visual

| Visual | Good for | Limits |
| --- | --- | --- |
| `BoxHandleAdornment` (+ Sphere/Cylinder) | Trigger volumes, zones | Has to follow size changes by hand (as above) |
| `LineHandleAdornment` | Patrol links, waypoint arrows | You work out start and end yourself |
| `Highlight` | Whole models (props, NPC rigs) | **Studio shows at most 255 at once**; extra ones are silently ignored |
| `SelectionBox` | Thin outline that reads well on big shells | No fill |
| `BillboardGui` with a `TextLabel` | Labels like "Spawn: Team Red" | Many billboards slow Studio; see [[BillboardGui Cost - Nametags, Health Bars and MaxDistance]] |

`AlwaysOnTop = true` with a `ZIndex` makes zones visible through walls, which is what you want while placing them.

## Useful extras

- **Click to select**: `HandleAdornment.MouseButton1Down` can call `Selection:Set({part})`, so clicking an overlay selects the hidden part behind it.
- **Counts in the panel**: "KillBrick: 37" is a quick sanity check after merges.
- **Lint mode**: draw problems in a warning colour, such as a `Spawn` that isn't anchored or a `KillBrick` with `CanTouch = false`.
- Explorer search finds the same objects without a plugin: `tag:KillBrick` ([[Studio Tools - Explorer Search Queries - Find and Bulk-Select Like a Pro]]).

## Pitfalls

- Thousands of tagged parts mean thousands of adornments. Add a distance filter or a per-tag toggle.
- Only BaseParts can be the `Adornee` of a box adornment. Tagged Models need their `PrimaryPart`, or a `Highlight`.
- The overlay must not change the tagged objects themselves (no changing Transparency to "show" them). That would end up saved in the place.

## Related

[[Claude MCP AI Workflow - Hub]] · [[Studio Tools - Custom Gizmos with Handles and ArcHandles]] · [[CollectionService Tag-Driven Architecture]] · [[Obby Stage Design - Difficulty Ramp, Checkpoints and Readable Hazards]]
