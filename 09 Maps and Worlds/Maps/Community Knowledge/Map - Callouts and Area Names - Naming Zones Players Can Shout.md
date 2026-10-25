---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "Map - Callouts and Area Names - Naming Zones Players Can Shout"
tags: [roblox, community-knowledge, maps, callouts, navigation, team-play]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://book.leveldesignbook.com/process/layout
  - https://www.raphkoster.com/?p=2597
  - https://create.roblox.com/docs/tutorials/curriculums/environmental-art/greybox-your-environment
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
---
# Map - Callouts and Area Names - Naming Zones Players Can Shout

When teammates can't say where something is, they can't cooperate. "He's over there!" is useless; "two at Red Bridge" wins rounds. Competitive maps get named areas (callouts) from their designers or their community, and the Level Design Book's layout chapter recommends planning callouts during layout for competitive maps. Naming areas also helps every other genre: quests, minimaps, analytics and patch notes all need the same place names.

## What makes a good callout
- **Short:** one or two words, ideally under three syllables per word ("Tower", "Pit", "Red Bridge").
- **Unique:** no two areas share a word that matters. "North Garage" and "North Gate" get confused under pressure.
- **Seen, not memorised:** named after something visible in that area: a coloured container, a statue, a broken bus. If players can't see why it's called that, they won't use it.
- **Sided:** in symmetric team maps, use team colour or "ours / theirs" prefixes ("Blue Tower", "Red Tower") with identical root names, so players learn one map.
- **Stable:** don't rename after launch; players and videos depend on the names.

## Build the name into the space
Raph Koster's zone lessons argue each zone should have its own sense of place, built with art, lighting and boundaries. For callouts that means:
1. **One distinct prop or colour per area** that matches its name. Roblox's greybox curriculum uses a distinct floor colour per side of the map and a separate colour for outdoors so players always know where they are; keep that idea through the art pass.
2. **Signs where it makes sense** (shop names, painted numbers on warehouses, street signs). In-world signs beat floating text.
3. **Edges at doorways, stairs or corners**, so players know when they've moved from one area to the next.

## Area size
- PvP maps: 15-30 named areas for a mid-size map; each one roughly what a player can see from its centre.
- Open worlds: name POIs (big) and sub-areas only where quests or fights happen.
- Avoid naming every corridor. If two neighbouring areas are always called out together, merge them.

## Show names in the game
- **Zone banner:** when a player enters a new area, show its name at the top of the screen for 2 seconds (client-side zone detection with boxes; see the zone detection note).
- **Minimap labels:** the same names on the map, at the same positions.
- **Ping system:** when a player pings, include the area name in the message ("Enemy spotted - Red Bridge").
- **Kill feed or objective text:** "Flag dropped at Courtyard".

## One source of truth (original pattern)
Keep areas as invisible parts in a folder, each with a `Name` and optional `Callout` attribute. Every system reads the same data.

```lua
-- ReplicatedStorage/Areas.lua - which named area contains a position?
local Areas = {}
local folder = workspace:WaitForChild("Areas") -- non-collidable, CanQuery = true, Transparency = 1
local params = OverlapParams.new()
params.FilterType = Enum.RaycastFilterType.Include
params.FilterDescendantsInstances = { folder }

function Areas.at(position: Vector3): string?
	local parts = workspace:GetPartBoundsInRadius(position, 0.5, params)
	local best: BasePart? = nil
	for _, p in parts do -- smallest box wins, so sub-areas override big zones
		if not best or p.Size.Magnitude < best.Size.Magnitude then best = p end
	end
	return best and (best:GetAttribute("Callout") or best.Name) or nil
end

return Areas
```
With streaming on, put the `Areas` folder in a `Model` set to `Persistent` streaming mode, or store the boxes as data in `ReplicatedStorage`, so every client has all areas.

## Use names in analytics
Use the same area names as dimensions in heatmaps and funnels ("deaths by area"). Patch notes that say "Widened the Pit exit" are understood by players because they already use the name.

## Checklist
- [ ] Every frequently fought-over area has a short, unique, visible name
- [ ] Names shown in banners, minimap and pings consistently
- [ ] Symmetric maps use the same root names on both sides
- [ ] Area boxes available on every client (persistent or as data)

## Related
[[Maps - Hub]] - [[Wayfinding with Landmarks and Weenies]] - [[Zone Detection - ZonePlus, QuickZone and Doing It Yourself]] - [[Zone and Stage Funnels with AnalyticsService]] - [[Map - Minimap and World Map UI - Projection, Rotation, Clipping and Fog of War]]
