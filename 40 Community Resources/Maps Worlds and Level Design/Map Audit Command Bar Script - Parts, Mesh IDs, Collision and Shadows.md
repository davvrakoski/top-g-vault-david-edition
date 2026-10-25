---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/map-audit-command-bar"
title: "Map Audit Command Bar Script - Parts, Mesh IDs, Collision and Shadows"
tags: [roblox, community, optimization, audit, collision, luau, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/workspace/collisions
  - https://create.roblox.com/docs/reference/engine/enums/CollisionFidelity
  - https://create.roblox.com/docs/tutorials/curriculums/environmental-art/optimize-your-experience
  - https://devforum.roblox.com/t/real-world-building-and-scripting-optimization-for-roblox/3127146
---
# Map Audit Command Bar Script - Parts, Mesh IDs, Collision and Shadows

Before a release, you want one report that tells you what your map is made of and where the waste is. This original command-bar script walks a folder (or all of Workspace) and prints counts plus the top offenders. It changes nothing; pair it with the fixes in the "What to do with the report" section.

## The script
Select a folder or model to audit (or nothing for all of Workspace), then run in the command bar.

```lua
-- Map audit (command bar, edit mode). Read-only.
local Selection = game:GetService("Selection")
local root = Selection:Get()[1] or workspace

local SMALL = 4 -- studs; parts smaller than this on every axis count as "small props"

local stats = {
	parts = 0, meshParts = 0, unions = 0, decalsTextures = 0, lights = 0, shadowLights = 0,
	unanchored = 0, precise = 0, smallShadow = 0, partialTransparency = 0,
	touchable = 0, queryableDecor = 0,
}
local meshUse: { [string]: number } = {}
local textureUse: { [string]: number } = {}

local function bump(map: { [string]: number }, key: string)
	if key ~= "" then map[key] = (map[key] or 0) + 1 end
end

for _, d in root:GetDescendants() do
	if d:IsA("BasePart") then
		stats.parts += 1
		if not d.Anchored then stats.unanchored += 1 end
		if d.Transparency > 0 and d.Transparency < 1 then stats.partialTransparency += 1 end
		local s = d.Size
		if d.CastShadow and s.X < SMALL and s.Y < SMALL and s.Z < SMALL then stats.smallShadow += 1 end
		if d.CanTouch then stats.touchable += 1 end
		if not d.CanCollide and d.CanQuery then stats.queryableDecor += 1 end
		if d:IsA("MeshPart") then
			stats.meshParts += 1
			bump(meshUse, d.MeshId)
			bump(textureUse, d.TextureID)
		end
		if d:IsA("PartOperation") then stats.unions += 1 end
		if (d:IsA("MeshPart") or d:IsA("PartOperation"))
			and d.CollisionFidelity == Enum.CollisionFidelity.PreciseConvexDecomposition then
			stats.precise += 1
		end
	elseif d:IsA("Decal") then -- Texture inherits from Decal
		stats.decalsTextures += 1
		bump(textureUse, d.Texture)
	elseif d:IsA("Light") then
		stats.lights += 1
		if d.Shadows then stats.shadowLights += 1 end
	end
end

local function uniqueCount(map) local n = 0 for _ in map do n += 1 end return n end
local function top(map, n)
	local list = {}
	for id, count in map do table.insert(list, { id = id, count = count }) end
	table.sort(list, function(a, b) return a.count > b.count end)
	for i = 1, math.min(n, #list) do print(string.format("   %5d x %s", list[i].count, list[i].id)) end
end

print(("==== Map audit: %s ===="):format(root:GetFullName()))
print("BaseParts:", stats.parts, "| MeshParts:", stats.meshParts, "| Unions:", stats.unions)
print("Unique mesh IDs:", uniqueCount(meshUse), "| Unique texture IDs:", uniqueCount(textureUse))
print("Decals/Textures:", stats.decalsTextures, "| Lights:", stats.lights, "(shadow-casting:", stats.shadowLights .. ")")
print("Unanchored parts:", stats.unanchored)
print("PreciseConvexDecomposition meshes/unions:", stats.precise)
print("Small parts casting shadows:", stats.smallShadow)
print("Partially transparent parts:", stats.partialTransparency)
print("CanTouch = true:", stats.touchable, "| Non-colliding but CanQuery:", stats.queryableDecor)
print("Most used meshes:")
top(meshUse, 5)
print("Mesh IDs used only once (candidates to replace with a reused mesh):")
local once = 0
for id, count in meshUse do if count == 1 then once += 1 end end
print("  ", once)
```

## What to do with the report
| Finding | Why it matters | Fix |
|---|---|---|
| Many unique mesh IDs, many used once | Each unique asset costs memory and breaks batching | Reuse a smaller kit; convert repeat assets to packages (Roblox's *Optimize your game* explains duplicate IDs) |
| `PreciseConvexDecomposition` on props | Most expensive collision | `Box` or `Hull` for props; keep precise only where players touch detail, or use an invisible simple collider |
| Small parts casting shadows | Shadow pass cost for detail nobody notices | `CastShadow = false` on small and edge-of-map props (the official curriculum does this for foliage) |
| Partial transparency | Overdraw, broken batching | Use 0 or 1; avoid stacked transparent layers |
| `CanTouch = true` everywhere | Every touchable part is checked for touch events | Turn off on decoration; keep on triggers only |
| Non-colliding but `CanQuery` decor | Raycasts and spatial queries test them | `CanQuery = false` on pure decoration (but see soft cover rules in [[Sightlines, Cover and Chokepoints for PvP Maps]]) |
| Unanchored parts in the map | Physics simulation and replication | Anchor static geometry |
| Many shadow-casting lights | Expensive, especially at high quality | Shadows on 1-2 hero lights per area |

Bulk-fix collision fidelity with the script in [[FBX Import Settings, Scale and Collision Fidelity]]. Record the "before" numbers in your map note so you can show progress.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[Map Performance Budgets - Draw Calls, Triangles and Mesh Reuse]] · [[Collisions]] · [[Performance Audit Procedure]] · [[Physics, Collisions and Ragdolls]]

<!-- TDOD_GRAPH_END -->
