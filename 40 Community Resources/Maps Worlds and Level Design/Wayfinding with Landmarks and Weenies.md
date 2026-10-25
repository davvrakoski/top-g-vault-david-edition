---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/wayfinding-landmarks-weenies"
title: "Wayfinding with Landmarks and Weenies"
tags: [roblox, community, level-design, wayfinding, landmarks, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://www.above-the-garage.com/wienies/
  - https://ecampusontario.pressbooks.pub/studioskills/?p=172
  - https://devforum.roblox.com/t/ruskis-tutorial-5-how-to-design-an-open-world-map/3554962
  - https://book.leveldesignbook.com/process/layout/typology
  - https://create.roblox.com/docs/workspace/streaming/slim
---
# Wayfinding with Landmarks and Weenies

Players on Roblox rarely read signs and often play on a phone with a small screen and a camera they barely rotate. A map they can "read" without a minimap keeps them playing; a map where every street looks alike sends them back to the home page. Two old ideas from outside games do most of the work.

## Idea 1: the "weenie" (Disneyland)
Walt Disney called the tall landmarks in his parks "weenies": things you can see from far away that pull people toward an area. Stephen Clarke-Willson's article *Level Layout, Disneyland Style* (above-the-garage.com) turns this into game lessons:

| Lesson | What it means in a Roblox map |
|---|---|
| Weenie | One tall, unique shape per zone, visible from the zone's entrance (tower, crane, giant tree, glowing crystal) |
| Tall pointy things | Vertical silhouettes read from far away better than wide, low ones |
| Audible weenie | A sound you hear before you see the place (waterfall, machinery, music from the arena) |
| Anti-weenie | A plain, unlit, uninteresting path or door tells players "nothing here" - use it for places you don't want them to go |
| Enticement | A path that curves out of view invites people to follow it |
| Hub and spoke | A central hub with a weenie at the end of each spoke (see [[Social Hub and Lobby Layout]]) |
| Hide the edges | Tall terrain and distant scenery keep players from thinking about the map boundary |
| Keep sightlines | Later additions (trees, signs, props) can hide a weenie; re-check after every art pass |

## Idea 2: Kevin Lynch's five elements (The Image of the City, 1960)
Urban planner Kevin Lynch found that people remember cities through five kinds of elements. They map neatly onto Roblox builds:

| Element | City meaning | Roblox map version |
|---|---|---|
| **Paths** | Routes people move along | Roads, corridors, terrain trails in a lighter or darker material than the ground |
| **Edges** | Linear boundaries that are not paths | Rivers, cliffs, walls, map borders |
| **Districts** | Areas with one shared identity | Zones with their own material palette, colour and lighting |
| **Nodes** | Points where people gather or change direction | Plazas, crossroads, spawn areas, shop clusters |
| **Landmarks** | Reference points seen from outside | Your weenies |

A useful detail from Lynch's work: the same road is a *path* for a driver and an *edge* for a pedestrian. If your game mixes vehicles and walking, check the map in both modes.

## Practical rules for Roblox
- **One landmark per district, not ten.** If every block has a "unique" tower, none of them is a landmark.
- **Put landmarks where players turn.** Ruski's open-world tutorial (DevForum, 2025) recommends street corners in cities, because players slow down there.
- **Silhouette first, detail later.** At 500+ studs a landmark is a few pixels on a phone. Test the shape as a greybox block before you spend time on the mesh.
- **Colour and value per district.** A red-roofed district and a blue-roofed district are easier to tell apart than two districts with different props.
- **Landmarks must survive streaming.** With `StreamingEnabled` (on by default for new places) and the default `StreamingTargetRadius` of 1024 studs, a tower 1,500 studs away is not on the client at all. Set the landmark model's `LevelOfDetail` to `SLIM` so a lightweight stand-in still renders far away (see [[SLIM, RenderFidelity and LOD Choices for Map Builders]]), or keep a very small number of landmark models `Persistent`.
- **Name zones the way players will.** Use the same names in the map, the UI, quests and analytics (see [[Zone and Stage Funnels with AnalyticsService]]).

## Quick test (5 minutes)
1. Hide your HUD and minimap.
2. Ask a tester to go from spawn to three named places.
3. Write down every time they stop and spin the camera. That spot needs a landmark, a path material change or a light (see [[Guiding Players with Light, Color and Affordance]]).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[Advanced Map Readability and Navigation]] · [[Map Blockout to Art Pass Workflow]] · [[Open World Layout - POIs, Triangle Rule and Travel Time]] · [[Large Maps, Streaming and World Design]]

<!-- TDOD_GRAPH_END -->
