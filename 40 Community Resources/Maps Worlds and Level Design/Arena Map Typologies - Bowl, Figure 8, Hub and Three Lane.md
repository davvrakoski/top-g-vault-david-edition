---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/arena-map-typologies"
title: "Arena Map Typologies - Bowl, Figure 8, Hub and Three Lane"
tags: [roblox, community, level-design, pvp, arena, symmetry, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://book.leveldesignbook.com/process/layout/typology
  - https://book.leveldesignbook.com/process/combat/balance
  - https://create.roblox.com/docs/tutorials/curriculums/environmental-art/greybox-your-environment
  - https://devforum.roblox.com/t/ruski%E2%80%99s-tutorial-3-how-to-design-a-pvp-map/2746055
---
# Arena Map Typologies - Bowl, Figure 8, Hub and Three Lane

Roblox's official environmental art curriculum teaches one PvP layout in depth: the **three lane** map (see [[Greybox your environment]]). This note covers the other common shapes, when to use each, and how to make a fair map with symmetry without breaking your meshes.

## Typologies (names from The Level Design Book)
| Typology | Shape | Plays like | Good for on Roblox |
|---|---|---|---|
| **Combat bowl / ring around the rosie** | Small open area with solid cover in the middle | Players circle the centre pillar | Sword fights, 1v1 duels, boss arenas, horror chase loops |
| **Arena / point of interest** | Open area, several lanes in, central cover, one landmark | Fights around a focal point | King of the hill, battlegrounds games |
| **Figure 8** | Two loops sharing a centre | Constant flanking, no dead ends | Capture the flag, team deathmatch |
| **Hub and spoke** | Central hub, spokes out to areas | Everyone passes the middle | Free-for-all, lobbies (see [[Social Hub and Lobby Layout]]) |
| **Three lane** | Two spawns, three long lanes, cross lanes | Lane choice = playstyle choice | 4v4 to 8v8 shooters (official curriculum) |
| **Connector / pivot** | Bases linked by routes to capture points | Rotations between objectives | Objective modes, bomb/defuse |

## Choosing by player count
Ruski's PvP tutorial compares compact 6v6 maps with large 32v32 maps and keeps FPS maps small (400 x 400 studs) so players meet often. As a rule: if players spend more than ~15 seconds running without seeing anyone, the map is too big for the player count, or it needs more spawns closer to the action. At the default walk speed of 16 studs/s, 15 seconds is 240 studs.

## Symmetry: mirror vs rotational
The Level Design Book lists two kinds of symmetry:

- **Mirror (bilateral):** flip one half across the centre line. Most common; it can look artificial, so give each side its own art.
- **Rotational (radial):** copy and rotate the half (or third, or quarter) around the centre. Works for 3-4 teams too.

On Roblox there is a practical difference. A true mirror flips "handedness": a mesh with text, a staircase that turns left, or any asymmetric mesh needs a separately mirrored asset (plugins like Stravant's Model Reflect handle parts, see [[Free Building Plugins - Stravant, F3X and Archimedes]]). A **180-degree rotation** keeps every mesh valid, so for a two-team map it is often the faster route.

```lua
-- Command bar: copy the selected half of the map, rotated 180 degrees around a centre point.
-- Put a part named "MapCenter" at the exact middle of the map first.
local Selection = game:GetService("Selection")
local ChangeHistoryService = game:GetService("ChangeHistoryService")

local center = workspace.MapCenter.Position
local pivotAround = CFrame.new(center) * CFrame.Angles(0, math.pi, 0) * CFrame.new(-center)

local rec = ChangeHistoryService:TryBeginRecording("RotateCopyHalf")
local copies = {}
for _, item in Selection:Get() do
	if item:IsA("PVInstance") then
		local copy = item:Clone()
		copy.Parent = item.Parent
		copy:PivotTo(pivotAround * item:GetPivot())
		table.insert(copies, copy)
	end
end
if rec then ChangeHistoryService:FinishRecording(rec, Enum.FinishRecordingOperation.Commit) end
Selection:Set(copies)
print("Copied", #copies, "objects")
```

## Asymmetric maps
Asymmetry feels more natural but takes far longer to balance. Two tricks from the balance chapter help:
- **Swap sides** between rounds so each team suffers the same imbalance.
- Aim for close to a 50% win rate per side; log round results by side and check them (see [[Zone and Stage Funnels with AnalyticsService]]).

## Battle royale and shrinking zones
Large open maps with a shrinking safe zone use the territory idea: the zone forces players into fewer chokepoints over time. Make sure every possible final circle has some cover; a final circle on a flat field ends matches badly.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[Sightlines, Cover and Chokepoints for PvP Maps]] · [[Greybox your environment]] · [[Spawn Area Design - SpawnLocation Rules, Protection and Exits]] · [[Map Rotation and Voting - Loading Maps from ServerStorage]]

<!-- TDOD_GRAPH_END -->
