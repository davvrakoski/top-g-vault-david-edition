---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/zone-visibility-culling"
title: "Zone Visibility Culling for Indoor and City Maps"
tags: [roblox, community, optimization, culling, level-design, luau, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/real-world-building-and-scripting-optimization-for-roblox/3127146
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://create.roblox.com/docs/workspace/streaming/techniques
---
# Zone Visibility Culling for Indoor and City Maps

Roblox already skips drawing what is outside the camera view and what is hidden behind other geometry (Roblox's *Improve performance* page calls these frustum and occlusion culling). It also notes that in indoor maps you can go further with your own **room/portal system** that hides whole areas the player can't see. This note shows two community techniques from MrChickenRocket's DevForum guest article *Real world building and scripting optimization for Roblox* (2024), rewritten as original Luau.

## When to use it (and when not)
| Situation | Use manual culling? |
|---|---|
| Non-streaming place with many rooms or city blocks | Yes: biggest win |
| Streaming place | Usually no. Streaming and SLIM already unload far content, and Roblox's streaming docs warn that client-side reparenting of streamed instances causes desync problems. Use it only on content the client owns (client-created clones) |
| Open terrain with long views | No: there is nothing to hide behind |

## Technique 1: precomputed zone visibility
The article tags zones and lists, per zone, the 5-8 other zones visible from it. The client parents zones it can't see to `nil` and restores them as the player moves. In its example budget, a map of zones costs ~40,000 triangles and ~40 draw calls per zone with at most 8 zones in view.

Setup: each zone is a Model tagged `Zone` with:
- a part named `Bounds` (invisible, `CanCollide`/`CanQuery`/`CanTouch` off) covering the zone's volume;
- a string attribute `Sees` listing other zone names, comma-separated (e.g. `"Lobby,Hall_A,Hall_B"`).

```lua
-- StarterPlayerScripts/ZoneCulling.client.lua (non-streaming places)
local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")

local zones: { [string]: { model: Model, parent: Instance, bounds: BasePart, sees: { [string]: boolean } } } = {}
for _, model in CollectionService:GetTagged("Zone") do
	local bounds = model:FindFirstChild("Bounds")
	if model:IsA("Model") and bounds and bounds:IsA("BasePart") then
		local sees = { [model.Name] = true }
		for name in string.gmatch(model:GetAttribute("Sees") or "", "[^,%s]+") do
			sees[name] = true
		end
		zones[model.Name] = { model = model, parent = model.Parent :: Instance, bounds = bounds, sees = sees }
	end
end

local function inside(part: BasePart, point: Vector3): boolean
	local p = part.CFrame:PointToObjectSpace(point)
	local h = part.Size / 2
	return math.abs(p.X) <= h.X and math.abs(p.Y) <= h.Y and math.abs(p.Z) <= h.Z
end

local current: string? = nil
local function apply(zoneName: string)
	local visible = zones[zoneName].sees
	for name, z in zones do
		z.model.Parent = if visible[name] then z.parent else nil
	end
end

local elapsed = 0
RunService.Heartbeat:Connect(function(dt)
	elapsed += dt
	if elapsed < 0.2 then return end -- 5 checks per second is plenty
	elapsed = 0
	local cam = workspace.CurrentCamera.CFrame.Position
	if current and inside(zones[current].bounds, cam) then return end
	for name, z in zones do
		if inside(z.bounds, cam) then
			current = name
			apply(name)
			return
		end
	end
end)
```

The `Bounds` part can stay inside its zone: a part parented to `nil` keeps its `CFrame` and `Size`, and the script holds a reference to it, so hidden zones are still detected. Make bounds slightly overlap at doorways so the camera is never "in no zone" while walking through.

## Technique 2: distance culling for small details
The same article hides parts tagged `Detail_Small` beyond 300 studs, checks only after the camera has moved, and spreads the work to about 50 checks per frame.

```lua
-- StarterPlayerScripts/DetailCulling.client.lua (non-streaming places)
local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")

local HIDE_BEYOND, PER_FRAME, MOVE_THRESHOLD = 300, 50, 8
local items = {}
for _, inst in CollectionService:GetTagged("Detail_Small") do
	if inst:IsA("PVInstance") then
		table.insert(items, { inst = inst, parent = inst.Parent, pos = inst:GetPivot().Position })
	end
end

local cursor, lastCam = 1, Vector3.new(math.huge, 0, 0)
RunService.Heartbeat:Connect(function()
	if #items == 0 then return end
	local cam = workspace.CurrentCamera.CFrame.Position
	if cursor == 1 and (cam - lastCam).Magnitude < MOVE_THRESHOLD then return end
	if cursor == 1 then lastCam = cam end
	for _ = 1, PER_FRAME do
		local item = items[cursor]
		local near = (item.pos - lastCam).Magnitude <= HIDE_BEYOND
		local want = if near then item.parent else nil
		if item.inst.Parent ~= want then item.inst.Parent = want end
		cursor = cursor % #items + 1
		if cursor == 1 then break end
	end
end)
```

Only tag anchored, static props: cups, bottles, small signs, clutter. Never tag anything a script, physics or another player depends on.

## Measure before and after
Use the render debug stats (the article uses Ctrl+F2 in a live game and Ctrl+Shift+F2 in Studio) to read the Draw (Scene) count, and [[Scene Analysis]]'s triangle composition view. If draw calls don't drop, your zones are too big or see too much.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[Improve performance]] · [[Map Performance Budgets - Draw Calls, Triangles and Mesh Reuse]] · [[SLIM, RenderFidelity and LOD Choices for Map Builders]] · [[Interiors, Doors and Portals - In-Place Teleports vs Separate Places]]

<!-- TDOD_GRAPH_END -->
