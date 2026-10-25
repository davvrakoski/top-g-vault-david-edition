---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "Map - Battle Royale Zone Maps - Circle Shrink Rules, Drop Paths and Final Circles"
tags: [roblox, community-knowledge, maps, battle-royale, zone, pvp]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://apexlegends.wiki.gg/wiki/Ring
  - https://www.techradar.com/news/warzone-2-is-making-a-huge-change-to-the-battle-royales-circles
  - https://create.roblox.com/docs/education/battle-royale-series/project-setup
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
---
# Map - Battle Royale Zone Maps - Circle Shrink Rules, Drop Paths and Final Circles

In a battle royale the shrinking zone is the real level designer: it decides where every fight happens in the last ten minutes. A map that looks great but has flat, empty ground where the last circles can land ends matches with two players shooting across a field. Design the map and the circle rules together.

## How the big games pace the circle
The Apex Legends wiki lists the ring as six rounds. Each round has a wait, then a close, and the damage per tick rises each round (3, 4, 10, 15, 20, 25). Diameters after closing go roughly 1200 m, 650 m, 400 m, 200 m, 100 m and then almost zero, and the full ring takes about 20 minutes. Patch notes on the same page show the developers repeatedly fixing rings that ended on unplayable terrain and making the pull less predictable. Warzone 2.0 tried splitting the zone into several circles that later merge, to break a big lobby into smaller fights (TechRadar interview).

Patterns worth copying:
- **Each new circle is about half the previous diameter.** Shrinking by much more feels like a teleport; much less drags.
- **Waits get shorter, damage gets higher.** Early zones forgive; the late zone has to force movement.
- **The final circle closes slowly** so the last fight has a few seconds of movement, not an instant wipe.

## Scaling down for Roblox
A Roblox lobby is often 12-30 players, not 60-150. At `WalkSpeed` 16 a player crosses 640 studs in 40 seconds. A workable starting table for a ~2,000-stud map (tune it in playtests):

| Round | Wait (s) | Close (s) | End radius (studs) | Damage / s |
|---|---|---|---|---|
| 1 | 60 | 60 | 600 | 1 |
| 2 | 45 | 45 | 300 | 2 |
| 3 | 40 | 35 | 150 | 5 |
| 4 | 30 | 30 | 70 | 10 |
| 5 | 20 | 40 | 0 | 20 |

Rule of thumb: a player at the far edge of a circle should be able to run into the next one during wait + close with a little slack, or the zone kills people who did nothing wrong.

## Picking the next circle
The next circle must sit fully inside the current one: the offset of its centre from the current centre can be at most `currentRadius - nextRadius`. Pick a random point in that disk, then reject points that are bad ground.

```lua
-- Server: choose the next zone centre that is fully inside the current zone
local rng = Random.new()
local function nextCentre(cur: Vector3, curR: number, nextR: number): Vector3
	local maxOffset = curR - nextR
	for _ = 1, 30 do
		local r = maxOffset * math.sqrt(rng:NextNumber()) -- sqrt = uniform over the disk
		local a = rng:NextNumber() * math.pi * 2
		local p = cur + Vector3.new(math.cos(a) * r, 0, math.sin(a) * r)
		local hit = workspace:Raycast(p + Vector3.new(0, 500, 0), Vector3.new(0, -1000, 0))
		if hit and hit.Material ~= Enum.Material.Water and not hit.Instance:HasTag("NoZoneEnd") then
			return Vector3.new(p.X, cur.Y, p.Z)
		end
	end
	return cur -- fallback: shrink in place
end
```

Tag deep water, lava, cliffs and roofs you don't want as final circles with `NoZoneEnd`. Render the zone as a big cylinder with low `Transparency` and `CanCollide`/`CanQuery`/`CanTouch` off; deal damage on the server from distance checks, not from `Touched`.

## Building the map around the circle
- **Every possible final circle needs cover.** Walk the map and ask "if the last 70-stud circle landed here, is there anything to hide behind?" Add rocks, trees, ruins or terrain folds where the answer is no.
- **Named POIs with loot, open ground between.** Players drop on POIs, fight early, then cross the open ground under zone pressure. That rotation is the genre.
- **Rotations, not walls.** Rivers, ridges and fences should have several crossings so a circle on the far side never has only one route (a single bridge becomes a camping spot).
- **Drop path.** If players drop from a bus or plane, randomise its line across the map each match so the same POI is not always hot.
- **Edges count less.** Bias circle centres toward the middle (cap the offset at ~70% of the maximum) if your edges are mountains or sea.

## Pitfalls
- Zone damage that kills from full health in a few seconds in round 1.
- Late circles on rooftops only one player can reach.
- A zone mesh that blocks raycasts or bullets because `CanQuery` was left on.
- Forgetting streaming: players far away may not have the circle's terrain loaded; the zone visual should be a client-side part that always exists.

## Related
[[Maps - Hub]] - [[Arena Map Typologies - Bowl, Figure 8, Hub and Three Lane]] - [[Battle Royale Template by Ericthestein (MIT)]] - [[Sightlines, Cover and Chokepoints for PvP Maps]] - [[Open World Layout - POIs, Triangle Rule and Travel Time]]
