---
area: "40 Community Resources"
cluster: "Performance and Security"
source_note: "community/performance-security/manual-client-culling"
title: "Manual Client Culling - Zone Visibility and Distance Culling"
tags: [roblox, community, "cluster/performance-and-security", rendering, culling, mobile]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/real-world-building-and-scripting-optimization-for-roblox/3127146
  - https://create.roblox.com/docs/performance-optimization/improve
---
# Manual Client Culling - Zone Visibility and Distance Culling

The engine already skips objects outside the camera's view. The Creator Hub notes you can also **cull manually** to cut draw calls further. MrChickenRocket's 2024 DevForum guest article shows two client-side techniques that kept a busy simulator well under mobile budgets. Both work by **parenting instances to `nil` on the client only**.

## Why Parent = nil

- Models and Folders have **no Visible property**. Parenting to `nil` on the client takes the whole thing out of rendering. It stays on the server and for every other client.
- **Caveats** from the article: having the client differ from the server is an advanced topic with many edge cases, and re-parenting large hierarchies (unions especially) **costs CPU**, so do it rarely.
- **When streaming is better:** for large open maps. The article skipped StreamingEnabled because its map was cramped with big dividing walls, and a streaming radius still rendered zones behind those walls. It says distance culling **works well alongside** streaming.

## Technique 1: precalculated zone visibility

- Each zone is a Model tagged `Zone`, with a bounds part, plus an attribute listing the **5 to 8** zones you can see from it. The lists are written **by hand**.
- When the player crosses into a new zone, every zone not on its list goes to `nil` and the listed ones come back.

## Technique 2: distance culling for small details

- Small props (pebbles, grass, clutter) are tagged `Detail_Small`. The example map had about **250** of them.
- Anything more than **300 studs** from the camera is parented to `nil`, and comes back when it's in range again.
- Checks only run **after the camera has moved** a little, and a coroutine handles at most **50 checks per frame**.

## Original implementation (distance culling)

```lua
-- StarterPlayerScripts/DistanceCuller (LocalScript). Never cull on the server.
local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")

local TAG, RANGE, PER_FRAME, MOVE_EPS = "Detail_Small", 300, 50, 8
local camera = workspace.CurrentCamera
local entries: {{inst: Instance, home: Instance, pos: Vector3}} = {}

local function track(inst: Instance)
	local pivot = if inst:IsA("Model") then inst:GetPivot().Position
		elseif inst:IsA("BasePart") then inst.Position else nil
	if pivot and inst.Parent then
		table.insert(entries, { inst = inst, home = inst.Parent, pos = pivot })
	end
end
for _, inst in CollectionService:GetTagged(TAG) do track(inst) end
CollectionService:GetInstanceAddedSignal(TAG):Connect(track)

local lastCam = Vector3.new(math.huge, 0, 0)
local cursor = 1
RunService.Heartbeat:Connect(function()
	local camPos = camera.CFrame.Position
	if cursor == 1 and (camPos - lastCam).Magnitude < MOVE_EPS then return end
	if cursor == 1 then lastCam = camPos end
	for _ = 1, PER_FRAME do
		local e = entries[cursor]
		if not e then cursor = 1; return end
		local want = if (e.pos - lastCam).Magnitude <= RANGE then e.home else nil
		if e.inst.Parent ~= want then e.inst.Parent = want end
		cursor += 1
	end
end)
```

Use this only for **static, anchored, purely visual** details. Anything with scripts, collisions that matter, or server-driven changes must stay parented. If the server destroys a tracked item, its `home` entry goes stale: remove such entries, or use the technique only on decor that is never destroyed.

## Credits

MrChickenRocket (Peter McNeill), *Real world building and scripting optimization for Roblox*, DevForum, Aug 2024. Roblox Creator Hub, *Improve performance* (CC BY 4.0). The LocalScript is original.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance and Security - Hub]]

**Related notes:** [[Mobile Budgets from a Real Project - Triangles, Draw Calls and Memory]] · [[Instance Streaming Deep Dive]] · [[Spatial Hash for Nearby Queries]] · [[World Streaming Zones Blueprint]] · [[Draw Calls and Mesh Instancing - Official Rules vs Forum Lore]]

<!-- TDOD_GRAPH_END -->
