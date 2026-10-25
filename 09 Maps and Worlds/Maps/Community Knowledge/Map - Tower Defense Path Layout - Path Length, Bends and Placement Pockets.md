---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "Map - Tower Defense Path Layout - Path Length, Bends and Placement Pockets"
tags: [roblox, community-knowledge, maps, tower-defense, path, placement]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.redblobgames.com/pathfinding/tower-defense/
  - https://babel.speldesign.uu.se/?p=5600
  - https://bugnet.io/blog/how-to-design-a-tower-defense-game
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
---
# Map - Tower Defense Path Layout - Path Length, Bends and Placement Pockets

In a tower defense (TD) game the map is the puzzle. Wave numbers and tower stats can be tuned in a spreadsheet, but where the path bends and where towers may stand decide whether there is any real choice. If every spot covers the path equally, placement stops mattering. This note covers fixed-path maps (most Roblox TDs); maze-building maps are at the end.

## Path length is time
Enemies spend `pathLength / enemySpeed` seconds on the map. That time is the budget your towers get to kill each wave.
- Start with the slowest common enemy taking **45-75 seconds** to walk the whole path, then tune.
- A longer path makes every map easier; a shorter one makes it harder. Use length, not just enemy health, to set map difficulty.
- Several maps of the same length but different shapes feel very different, because coverage depends on shape.

## Coverage math: why bends matter
A tower with range `R` standing `d` studs from a straight path covers a stretch of path `2 * sqrt(R^2 - d^2)` long. With `R = 20`:
| Distance from path | Path covered |
|---|---|
| 3 studs | ~39.5 studs |
| 10 studs | ~34.6 studs |
| 18 studs | ~17.4 studs |

Inside a bend or a U-turn, the same tower's circle crosses the path two or three times and can cover 60-100 studs of it. Those spots are **placement pockets**: they are what players look for and fight over (in co-op TD, the first good pocket is the first decision). Design them on purpose:
1. One or two **premium pockets** per map (inside a U-turn or a spiral).
2. Several **good pockets** at ordinary bends.
3. Plenty of **filler** along straights for cheap towers.
The student project at Uppsala's game design school (Tower Offensive devlog) used two chokepoints on an early level purely to teach that some spots are worth more; later levels flipped and combined that idea.

## Readable path, readable placement
- **Path is visually distinct** from build ground: different `Material`, colour and height (sunken 0.5-1 stud or bordered). New players must see the route in one glance.
- **No-build buffer:** keep placement out of the path itself plus ~2 studs, so towers never block enemy models or look like they do.
- **Placement areas are explicit.** Tag build zones (`TowerGround`) or mark no-build areas (`NoBuild`). Validate on the server: raycast down from the requested position, require a `TowerGround` hit, then `GetPartBoundsInBox` (or radius) against existing towers to stop overlap.
- **Height as a reward.** Raised ledges or cliffs with longer range or limited slots add choice. Make sure the camera and click raycast can reach them on phone.
- **Spawn and exit visible.** Players should see where enemies enter and where the base is; mark both with landmarks.

## Path data
Store the path as ordered waypoint parts (`Waypoints/1`, `2`, `3`...). Enemies move by **distance along the path** (a number), which also gives you "first" and "last" targeting for free (see the targeting note). Precompute cumulative lengths so you can find any enemy's position from its progress number.

```lua
-- Build cumulative distances once per map
local function buildPath(folder: Folder)
	local pts, cum = {}, { 0 }
	for i = 1, #folder:GetChildren() do
		pts[i] = (folder:FindFirstChild(tostring(i)) :: BasePart).Position
	end
	for i = 2, #pts do
		cum[i] = cum[i - 1] + (pts[i] - pts[i - 1]).Magnitude
	end
	return pts, cum -- cum[#cum] is the total length; divide by speed for walk time
end
```

## Multiple paths
Two entrances that merge late force players to split defenses early, then reward a strong pocket at the merge. Two fully separate paths double the defense needed; only use them on hard maps.

## Maze-building maps
If players place towers that block movement (Desktop Tower Defense style), Red Blob Games' approach is one breadth-first search from the goal to build a **flow field** that all enemies follow. Use the same search to **reject a placement that cuts the spawn off from the goal** (run it on a copy of the grid with the new tower).

## Related
[[Maps - Hub]] - [[Tower Defense Genre Breakdown - Waves, Placement Economy and Unit Rosters]] - [[Tower Defense Targeting Modes - First, Last, Strongest and Closest]] - [[Case Study - Tower Defense Simulator]]
