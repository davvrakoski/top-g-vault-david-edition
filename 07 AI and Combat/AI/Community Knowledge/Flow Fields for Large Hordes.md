---
area: "07 AI and Combat"
cluster: "AI"
title: "Flow Fields for Large Hordes"
tags: [roblox, community-knowledge, ai, flow-field, pathfinding, hordes, tower-defense]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.redblobgames.com/pathfinding/tower-defense/
  - https://www.redblobgames.com/blog/2024-04-27-flow-field-pathfinding/
  - https://create.roblox.com/docs/characters/pathfinding
---
# Flow Fields for Large Hordes

`PathfindingService` computes one path per request. With 150 zombies chasing the same player, that is 150 `ComputeAsync` calls every time the player moves, which is exactly how horde games tank server performance. Red Blob Games' tower-defense article explains the alternative: when many agents share a destination, run **one** search outward from the destination and store, for every tile, which way leads home. Every agent then just reads its tile. The cost no longer depends on the number of enemies.

## How it works

1. **Grid.** Cover the playable area with cells (2-4 studs for Humanoids). Mark each cell walkable or blocked once at startup, using `workspace:GetPartBoundsInBox` or downward raycasts per cell. Optionally store a cost per cell (mud = 3, road = 1).
2. **Distance field.** Breadth-first search (or Dijkstra if costs vary) from the goal cell, writing each cell's distance to the goal.
3. **Flow field.** For each cell, point to the neighbour with the lowest distance. That direction is the cell's arrow.
4. **Agents.** Each tick, an agent looks up its cell and moves along the arrow (blended with separation steering so they do not stack).

```lua
-- BFS distance field on a 2D grid; walkable[x][z] = true/false
local function buildField(walkable, w: number, h: number, gx: number, gz: number)
	local dist = table.create(w * h, math.huge)
	local function idx(x, z) return (z - 1) * w + x end
	local queue, head = { { gx, gz } }, 1
	dist[idx(gx, gz)] = 0
	while head <= #queue do
		local x, z = queue[head][1], queue[head][2]
		head += 1
		local d = dist[idx(x, z)] + 1
		for _, o in { { 1, 0 }, { -1, 0 }, { 0, 1 }, { 0, -1 } } do
			local nx, nz = x + o[1], z + o[2]
			if nx >= 1 and nx <= w and nz >= 1 and nz <= h
				and walkable[nx][nz] and dist[idx(nx, nz)] > d then
				dist[idx(nx, nz)] = d
				table.insert(queue, { nx, nz })
			end
		end
	end
	return dist -- agents step toward the lowest neighbouring value
end
```

A 100x100 grid is 10,000 cells: one BFS is a few milliseconds of Luau, and it serves every enemy.

## Making it work in a Roblox game

- **Multiple targets.** Seed the BFS with every player's cell at distance 0 (a multi-source search). Each zombie then automatically heads for its nearest player. This is the Red Blob "distance field to many goals" trick and replaces per-zombie target selection for simple hordes.
- **Rebuild budget.** Players move constantly. Rebuild the field 2-4 times per second at most, or only when a player crosses into a new cell. Spread the BFS across frames if the grid is large (process N cells per Heartbeat).
- **Close range handoff.** Within 10-15 studs of a player, switch from the field to direct seek or a short `PathfindingService` path, so the final approach is precise.
- **Verticality.** Flow fields are easiest on mostly flat maps. For multi-floor buildings, build one grid per floor and connect stair cells, or fall back to PathfindingService for agents not on the ground floor.
- **Dynamic obstacles.** When a barricade is built or destroyed, mark the cells and rebuild. This is how tower defense mazes let enemies reroute instantly.

## Flow field vs PathfindingService

| Situation | Better choice |
| --- | --- |
| 50+ agents, same few destinations | Flow field |
| Few agents, many different destinations | PathfindingService |
| Complex 3D navigation, jumps, ladders, links | PathfindingService |
| Tower defense lanes, open-arena hordes | Flow field |

## Pitfalls

- 8-direction neighbours without corner checks let agents cut through wall corners. Only allow a diagonal if both adjacent straight cells are walkable.
- Cell size too big: agents snag on doorways narrower than a cell. Use cells at most half the narrowest doorway width.
- Recomputing the field every frame for every player separately. One multi-source field is enough.
- Sending arrows to clients. Movement is server-side; clients just see replicated NPCs.

## Related
[[AI - Hub]] - [[Zombie Crowd Director Blueprint]] - [[NPCs tank server performance]] - [[Steering Behaviors and Boids for NPC Groups]]
