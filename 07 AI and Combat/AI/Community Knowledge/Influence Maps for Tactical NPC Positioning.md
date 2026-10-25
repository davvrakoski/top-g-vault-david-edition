---
area: "07 AI and Combat"
cluster: "AI"
title: "Influence Maps for Tactical NPC Positioning"
tags: [roblox, community-knowledge, ai, influence-maps, tactics, positioning]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.gamedev.net/articles/programming/artificial-intelligence/the-core-mechanics-of-influence-mapping-r2799
  - https://www.redblobgames.com/pathfinding/tower-defense/
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot#Raycast
---
# Influence Maps for Tactical NPC Positioning

"Where should this NPC stand?" is harder than "how does it get there". Ranged enemies that stand in the open, guards that all cluster at one door, and zombies that ignore the gap where players are weakest all come from NPCs choosing positions with no picture of the battlefield. An **influence map** is that picture: a grid where every friendly and hostile unit spreads a value that fades with distance. Alex Champandard's gamedev.net article describes three things it gives AI: a snapshot of who controls which area, a memory of where things happened, and a projection of where enemies can reach soon. RTS games used it first; shooters like Killzone used it for tactical positioning.

## Building one

1. Use a coarse 2D grid (4-8 studs per cell) over the combat area.
2. Clear it, then for each unit add influence to nearby cells: `value = strength * max(0, 1 - dist / radius)`. Players add **threat**; NPC allies add **support**.
3. Optionally blur once (average each cell with its neighbours) to smooth it.
4. Rebuild 2-5 times per second, not every frame. With 20 units and radius 6 cells, that is a few thousand additions.

```lua
local CELL, W, H = 6, 64, 64
local ORIGIN = Vector3.new(-192, 0, -192)

local function addInfluence(map, worldPos: Vector3, strength: number, radiusCells: number)
	local cx = math.floor((worldPos.X - ORIGIN.X) / CELL) + 1
	local cz = math.floor((worldPos.Z - ORIGIN.Z) / CELL) + 1
	for x = math.max(1, cx - radiusCells), math.min(W, cx + radiusCells) do
		for z = math.max(1, cz - radiusCells), math.min(H, cz + radiusCells) do
			local d = math.sqrt((x - cx) ^ 2 + (z - cz) ^ 2)
			if d <= radiusCells then
				local i = (z - 1) * W + x
				map[i] += strength * (1 - d / radiusCells)
			end
		end
	end
end
```

## Using it for decisions

Combine layers with weights into a score per candidate cell, then pick the best cell within the NPC's move range:

| Behavior | Score formula (examples) |
| --- | --- |
| Sniper position | high line of sight to targets, low threat, far from target |
| Flanker | moderate threat, high angle difference from allies |
| Healer / support | high ally support, low threat |
| Retreat | lowest threat reachable in 3 s |
| Zombie push | highest threat (players) minus zombie density, so they spread out |

Only test a handful of candidate cells (for example 12 around the NPC) per decision, and do the expensive checks (a raycast for line of sight to the target) only for the top three.

## Memory layer

Keep a second map that does **not** clear: add value where an ally died or where a grenade exploded, and multiply the whole map by 0.95 each second so it fades. NPCs then avoid kill zones for a while, which reads as "learning".

## Projection layer

Spread player threat further in the direction they are moving, or by their weapon range (a sniper projects threat far along open lines). Cheap version: add influence at `position + velocity * 1.5` too.

## Practical tips

- One shared map per arena serves all NPCs; do not build one per NPC.
- Debug by drawing the grid with coloured parts or `Adornment` boxes in Studio; tactical bugs are obvious when you can see the map.
- Keep the grid 2D unless the level is multi-level; for floors, use a map per floor.
- Influence maps choose a **destination**; PathfindingService or a flow field still does the routing.

## Pitfalls

- Grid too fine (1-2 studs): cost explodes and values become noisy.
- Forgetting walls: influence leaks through them. Either accept it (cheap) or spread influence with a BFS over walkable cells instead of straight distance.
- All NPCs pick the same best cell. Add a penalty for cells already claimed by an ally this tick.

## Related
[[AI - Hub]] - [[Encounter Director and Pacing]] - [[Behavior Trees and Utility AI in Luau]] - [[Flow Fields for Large Hordes]]
