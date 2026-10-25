---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/sightlines-cover-chokepoints"
title: "Sightlines, Cover and Chokepoints for PvP Maps"
tags: [roblox, community, level-design, pvp, sightlines, cover, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://book.leveldesignbook.com/process/combat/balance
  - https://devforum.roblox.com/t/ruski%E2%80%99s-tutorial-3-how-to-design-a-pvp-map/2746055
  - https://create.roblox.com/docs/tutorials/curriculums/environmental-art/greybox-your-environment
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot#Raycast
---
# Sightlines, Cover and Chokepoints for PvP Maps

Most "this map is unfair" complaints come down to three things: a spot that sees too much, a lane with no cover, or a chokepoint one player can hold alone. This note gives the rules and a command-bar tool to measure sightlines in Studio.

## A framework for every spot on the map
The Level Design Book's balance chapter (CC BY-NC-SA 4.0, summarized here) asks three questions about each area:

| Question | Ask yourself |
|---|---|
| **Utility** | Why would a player go there or stay there? |
| **Cost** | How hard is it to reach or hold, and what does holding it leave open? |
| **Information** | Do players know it exists and what it covers? |

A spot that is useful, cheap to reach and obvious becomes the one place everyone camps. Give every strong spot a weakness: a long, exposed approach, a second entrance behind it, or a loud floor.

## Chokepoints
- The same chapter suggests **3-4 chokepoints across a multiplayer map, roughly one per lane**, and that **no single position should cover all of them**.
- Give each important room at least two entrances. Ruski's PvP tutorial (DevForum, 2023) says every room needs multiple entrances and no camping spots; Roblox's official laser-tag greybox caps combat pockets at about three exits so players don't face too many choices.
- Spawn rooms need at least two exits so one enemy can't seal them (the official greybox gives each spawn two exits). See [[Spawn Area Design - SpawnLocation Rules, Protection and Exits]].

## Sightlines
- Too many long sightlines overwhelm players; too few and they can't plan. Mix long, medium and short lines across the map.
- **Rounded or bevelled corners** give wider views than sharp corners; sharp T-junctions let a fleeing player break line of sight fast.
- **Match sightline length to your weapons.** If your longest-range weapon is accurate to 200 studs, a 600-stud open lane is a sniper alley no one else can cross.
- Break long lines with mid-height props, elevation changes and doorways rather than walls everywhere.

## Cover on Roblox: soft vs hard is a property choice
| Cover type | Meaning | How to build it on Roblox |
|---|---|---|
| Soft cover | Blocks sight, not shots | Foliage or cloth with `CanQuery = false` (raycast weapons pass through) and `CanCollide = false` |
| Hard cover | Blocks shots and sight | Normal parts with `CanQuery = true` |
| See-through hard cover | Blocks shots, not sight | Glass or grates with `CanQuery = true` and transparency |
| Half cover | Waist high | About half the character height; check it hides a crouching character if you have crouch |

Your weapon code decides what counts: if it raycasts with a filter, include or exclude the right folders. Write the cover rules down so builders and scripters agree.

Ruski's PvP tutorial uses a compact **400 x 400 stud** map with three **32-stud-wide** lanes and **perimeter walls 3-4x player height**, with barrels and boxes around corners and big props (cars, crates) along the borders. The Level Design Book warns against "cover boxes", rows of identical waist-high crates; blend cover into the architecture instead.

## Tool: measure sightlines from a spot (command bar)
Select one part placed at head height where a player would stand, then run this. It casts a ring of rays and draws the five longest lines (they are not saved with the place).

```lua
-- Command bar (edit mode). Select one marker part first.
local Selection = game:GetService("Selection")
local marker = Selection:Get()[1]
assert(marker and marker:IsA("BasePart"), "Select one marker part")

local RANGE, STEPS = 1000, 72
local params = RaycastParams.new()
params.FilterType = Enum.RaycastFilterType.Exclude
params.FilterDescendantsInstances = { marker }

local old = workspace:FindFirstChild("SightlineViz")
if old then old:Destroy() end
local viz = Instance.new("Folder")
viz.Name = "SightlineViz"
viz.Archivable = false -- never saved with the place
viz.Parent = workspace

local results = {}
local origin = marker.Position
for i = 0, STEPS - 1 do
	local a = (i / STEPS) * math.pi * 2
	local dir = Vector3.new(math.cos(a), 0, math.sin(a))
	local hit = workspace:Raycast(origin, dir * RANGE, params)
	local length = hit and (hit.Position - origin).Magnitude or RANGE
	table.insert(results, { angle = math.deg(a), length = length, dir = dir })
end
table.sort(results, function(x, y) return x.length > y.length end)

for i = 1, 5 do
	local r = results[i]
	print(string.format("#%d  %.0f deg  %.0f studs%s", i, r.angle, r.length, r.length >= RANGE and " (open)" or ""))
	local beam = Instance.new("Part")
	beam.Anchored, beam.CanCollide, beam.CanQuery, beam.CanTouch = true, false, false, false
	beam.Material = Enum.Material.Neon
	beam.Color = Color3.fromRGB(255, 80, 80)
	beam.Size = Vector3.new(0.3, 0.3, r.length)
	beam.CFrame = CFrame.lookAt(origin + r.dir * r.length / 2, origin + r.dir * r.length)
	beam.Parent = viz
end
```

Run it from every spawn exit, every chokepoint and every elevated spot. Any line longer than your effective weapon range is worth breaking.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[Greybox your environment]] · [[Arena Map Typologies - Bowl, Figure 8, Hub and Three Lane]] · [[Map Blockout to Art Pass Workflow]] · [[Position and Death Heatmaps for Map Playtests]]

<!-- TDOD_GRAPH_END -->
