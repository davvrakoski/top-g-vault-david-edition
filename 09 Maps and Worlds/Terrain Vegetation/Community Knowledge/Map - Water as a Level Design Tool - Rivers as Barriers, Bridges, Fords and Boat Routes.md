---
area: "09 Maps and Worlds"
cluster: "Terrain Vegetation"
title: "Map - Water as a Level Design Tool - Rivers as Barriers, Bridges, Fords and Boat Routes"
tags: [roblox, community-knowledge, terrain-vegetation, water, level-design, rivers]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.raphkoster.com/?p=2597
  - https://book.leveldesignbook.com/process/layout/flow/circulation
  - https://create.roblox.com/docs/reference/engine/classes/Terrain
  - https://create.roblox.com/docs/reference/engine/enums/HumanoidStateType
---
# Map - Water as a Level Design Tool - Rivers as Barriers, Bridges, Fords and Boat Routes

Water is the most natural way to shape movement on a terrain map. A river says "go around" without an invisible wall, a bridge says "cross here", and a lake opens long sightlines. The existing water notes cover how terrain water works (swim checks, settings, shorelines). This one is about **what water does to the layout**: where people cross, where they fight, and how fast they move.

## What water changes
| Effect | Why it matters |
|---|---|
| **Movement speed** | Swimming is slower and usually can't jump or shoot normally; measure your swim speed in your game and use it in travel times |
| **Exposure** | Swimmers are visible, slow and often unarmed: water is a danger zone in PvP |
| **Sightlines** | Flat open water gives long views; a lake between two areas is a sniper lane |
| **Routing** | Few crossings become chokepoints; Raph Koster's zone lessons list bridges and mountain passes as natural gates within a region |
| **Pace** | A river crossing is a moment of tension: a good place for a beat change |

## Crossings are the design
Count and place crossings deliberately:
- **Bridges** are fast, safe from drowning, and exposed. One bridge = a hard chokepoint; two or more = a choice. In PvP, never make one bridge the only route between halves of the map, or it becomes a permanent standoff.
- **Fords** (shallow water a player can wade, 1-2 studs deep) are slower than bridges but wider. They're a good "risky shortcut": open, slow, but not a full swim. Make depth readable with lighter water colour and visible rocks.
- **Swimming** anywhere is the fallback. If you allow it, the whole river is a crossing; if you don't (deadly or disabled swimming), mark the danger clearly.
- **Stepping stones and logs** turn a crossing into a small parkour challenge, useful in adventure maps.

Rule of thumb for team maps: **2-3 crossings** per river between bases, spread out so rotating between them takes 10-20 seconds. That matches the Level Design Book's guidance that most competitive maps use one to three main lanes.

## Rivers as boundaries
- A wide, fast-looking river (foam, rapids sound, strong current) reads as "don't cross" better than a calm one.
- Map edges: rivers and sea work as soft boundaries; combine with a server check for players who swim out anyway.
- **Don't trap swimmers**: every bank needs a way out (a ramp, a beach). Cliffs at the waterline mean players swim until they quit.

## Lakes and coasts
- **Lakes as hubs.** A lake with POIs around its shore gives a natural loop route and a big landmark from any side.
- **Islands** are rewards: loot or a secret visible from shore, reachable by swimming or boat.
- **Coasts as map edges** in open worlds (islands are the classic battle royale shape because the sea is a free boundary).

## Boat routes
If players have boats:
- Rivers are **roads**. Make them wide enough for two boats (2.5x boat width) and avoid sharp bends.
- Put docks at POIs and at both ends of long rivers so boats are a real travel option.
- Hide shortcuts in side channels for players who explore.
- Test boat physics with full server counts; buoyancy on terrain water depends on part density.

## Water and gameplay states
Detect swimmers with the `Swimming` humanoid state (`Enum.HumanoidStateType.Swimming`) and apply rules on the server: disable tools, drain stamina, slow capture progress. Keep the rule visible: an icon or a short tip the first time a player enters water.

## Checklist
- [ ] Every river has a planned crossing count and the reason for it
- [ ] Fords readable (colour, rocks), and depth tested for wading vs swimming
- [ ] Every bank has an exit
- [ ] Long water sightlines broken with islands, reeds or bends where they hurt the PvP balance
- [ ] Boat lanes wide enough and docked at POIs

## Related
[[Terrain Vegetation - Hub]] - [[Terrain Water Gameplay - Swimming Checks, Disabling Swim and Water Settings]] - [[Roads, Paths and Rivers on Terrain - Carving Along a Curve]] - [[Lake, Dock and Stylized Water Scene]] - [[Sightlines, Cover and Chokepoints for PvP Maps]]
