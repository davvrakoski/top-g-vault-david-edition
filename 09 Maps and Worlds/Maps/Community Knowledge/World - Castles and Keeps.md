---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "World - Castles and Keeps"
tags: [roblox, community-knowledge, maps, castle, medieval, fantasy]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://kenney.nl/assets/castle-kit
  - https://kenney.nl/assets/fantasy-town-kit
  - https://kenney.nl/assets/retro-fantasy-kit
  - https://create.roblox.com/docs/environment/lighting
  - https://www.above-the-garage.com/wienies/
---
# World - Castles and Keeps

A castle is the ultimate landmark: tall, central and visible from the whole map. In Roblox it also doubles as a defensible PvP space, a roleplay court, or a dungeon entrance. Design it as layers of defence that read from outside and are fun to move through inside. (For the village around it, see the low-poly village note.)

## Layout plan
1. **Rings of defence:** moat or ditch -> curtain wall with towers -> outer bailey (yard, stables, smithy) -> inner wall -> keep. Each ring is a gameplay step.
2. **Gatehouse as the main entry**, with a second hidden entry (sally port, sewer, cliff path). Attackers and explorers both need the alternative.
3. **Walls you can walk.** Wall-walks 8-12 studs wide with crenellations, linked by tower stairs. They give the castle a second, elevated route.
4. **The keep's great hall** is the hub: throne, banners, big hearth. Upper floors for quarters, the top for the view and a flag that's visible map-wide.
5. **Site it on a rise.** A castle in a valley loses its landmark value.

## Scale
- Curtain walls 30-50 studs tall feel imposing at Roblox avatar size; towers 10-20 studs taller than the walls.
- Gate opening at least 16 studs wide and 20 tall so groups, mounts and the camera fit.
- Spiral stairs: wide (10+ stud diameter) with an invisible ramp, or players snag on steps.

## Key kits
- Kenney **Castle Kit** (walls, towers, gates), **Fantasy Town Kit** and **Retro Fantasy Kit**: CC0, bundle-safe.
- KayKit medieval hexagon pack (CC0) for a stylised surrounding world.
- ambientCG stone wall, cobblestone and wooden plank sets (CC0).

## Lighting tips
- Day: warm sun, light haze; stone reads best with a low-ish sun angle (`ClockTime` 9-10 or 15-16) that rakes across the wall texture.
- Night: torches every 16-24 studs on walls (`Fire` + small non-shadowed `PointLight`), the great hall lit by one big shadowed hearth light.
- Stained-glass windows: colored transparent parts with a `SurfaceLight` behind them throw colored glow into the hall.

## Performance budget
- Walls are long; build them from a few long segments, not many small stones.
- Crenellations and arrow slits: part of the wall mesh, not separate parts.
- Banners and flags: a few with cloth-like animation, the rest static.
- Big castles: turn on streaming and keep the keep interior a separate streamed model.

## Common mistakes
- Real medieval proportions: narrow stairs and passages that the camera can't handle.
- Flat-topped walls with nothing on them - add the wall-walk.
- A single entrance, so PvP becomes a doorway meat grinder.
- Uniform grey stone everywhere: vary with mossy bases, wooden hoardings, banners in faction colors.

## Related
[[Maps - Hub]] - [[Low-Poly Village Kit — Clean Stylized Production]] - [[Wayfinding with Landmarks and Weenies]] - [[Sightlines, Cover and Chokepoints for PvP Maps]]
