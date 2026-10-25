---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "Map - Control Point and King of the Hill Maps - Point Placement and Capture Zones"
tags: [roblox, community-knowledge, maps, pvp, king-of-the-hill, control-point]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://book.leveldesignbook.com/process/layout
  - https://book.leveldesignbook.com/process/layout/flow/circulation
  - https://www.pcgamer.com/au/team-fortress-2s-community-made-harvest-map
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
---
# Map - Control Point and King of the Hill Maps - Point Placement and Capture Zones

King of the Hill (one point that teams fight to hold) and multi-point control modes are easy to script and hard to map. The whole match happens within about 40 studs of the point, so the point's surroundings, its approaches and the distance from each spawn decide whether the mode is fun or a meat grinder.

## King of the Hill: one point, compressed map
PC Gamer's look at TF2 King of the Hill maps describes them as compressed around a single capture point, built from tight sections that favour different playstyles but always leave a counter. TF2 examples show the common shapes:
- **Central point in a building** (Harvest: a shed in the middle of a symmetrical farm).
- **Point on high ground** (Viaduct: teams start below and climb to the summit).
- **Covered point on an upper floor, radially symmetric** (Kong King).

Rules that come out of these:
1. **Equal distance from each spawn.** Measure with a stopwatch at default `WalkSpeed` 16; 10-15 seconds spawn-to-point keeps fights constant without spawn rushing.
2. **Three or more approaches per team**, at least one at a different height. A single entrance turns into a chokepoint stalemate.
3. **Cover on the point, not just around it.** Holders need somewhere to stand that isn't wide open, or nobody stays on it.
4. **No sightline from spawn to the point.** Otherwise one sniper holds it from safety.
5. **Something that changes the fight.** A hazard, a moving platform or a jump pad can give losers a way back in.

## Multi-point maps
The Level Design Book describes a **"beaded necklace"** typology (used for a control-point map): a long route with an arena "bead" around each point. Each bead is its own small map. Its circulation chapter adds that most competitive maps use **one to three lanes**; more becomes a maze where players miss each other. For a 3-point map (A - B - C):
- B (middle) is equidistant; A and C are close to one team's spawn each.
- Holding two points should feel winnable but not decisive; the far point should be hard to defend from your own spawn.
- Use forward spawns that move as points change hands, but never let a forward spawn see an enemy-held point.

## Capture zone script pattern
Do the check on the server on a timer, not with `Touched`, so standing still counts and exploiters can't fake touches.

```lua
-- Server: count players per team inside a capture zone part
local Players = game:GetService("Players")
local zone = workspace.Points.Hill -- a non-collidable part, CanQuery = true
local params = OverlapParams.new()
params.FilterType = Enum.RaycastFilterType.Include

local function countInZone(): { [BrickColor]: number }
	local chars = {}
	for _, p in Players:GetPlayers() do
		if p.Character then table.insert(chars, p.Character) end
	end
	params.FilterDescendantsInstances = chars
	local counts, seen = {}, {}
	for _, part in workspace:GetPartBoundsInBox(zone.CFrame, zone.Size, params) do
		local plr = Players:GetPlayerFromCharacter(part.Parent)
		local hum = part.Parent:FindFirstChildOfClass("Humanoid")
		if plr and not seen[plr] and hum and hum.Health > 0 then
			seen[plr] = true
			counts[plr.TeamColor] = (counts[plr.TeamColor] or 0) + 1
		end
	end
	return counts
end
```

Every second: if only one team is in the zone, move progress toward that team; if both are present, the point is **contested** and freezes. Many games let extra players speed up capture with diminishing returns (e.g. 1x, 1.5x, 1.8x, 2x), which rewards pushing as a group without making 6 players instant.

## Shape and readability
- Mark the zone edge on the floor (a coloured ring or Decal), sized exactly like the hit box. Players argue about edges.
- Make the zone a cylinder-ish area 20-40 studs across. Too small and one explosion clears it; too big and nobody can contest it.
- Keep ceiling heights above the point generous so jumping and cameras work (see [[Camera-Friendly Interiors - Occlusion Mode, Ceiling Height and Zoom Limits]]).
- Show the point state above it with a `BillboardGui` (`AlwaysOnTop` true) in team colour.

## Related
[[Maps - Hub]] - [[Sightlines, Cover and Chokepoints for PvP Maps]] - [[Spawn Area Design - SpawnLocation Rules, Protection and Exits]] - [[Arena Map Typologies - Bowl, Figure 8, Hub and Three Lane]]
