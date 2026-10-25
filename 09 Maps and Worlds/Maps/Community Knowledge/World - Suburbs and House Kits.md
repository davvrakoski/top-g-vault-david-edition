---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "World - Suburbs and House Kits"
tags: [roblox, community-knowledge, maps, suburb, houses, roleplay]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://kenney.nl/assets/city-kit-suburban
  - https://kenney.nl/assets/furniture-kit
  - https://create.roblox.com/docs/workspace/streaming
  - https://create.roblox.com/docs/parts/models
---
# World - Suburbs and House Kits

Suburbs are the backbone of roleplay and hangout games: every player wants "their" house, and a street of homes is the easiest place to make a map feel lived-in. The trick is variety from a small kit, and interiors that are cheap enough to have 20+ of them in one server.

## Layout plan
- **Cul-de-sacs and curving streets** instead of the city grid. A loop road with 3-4 cul-de-sacs gives natural "neighbourhoods" and short sightlines.
- **Plot size:** about 60 x 80 studs per house (house + yard + driveway). Leave 6-10 studs between fences.
- **Front yard faces the road, back yard faces the next street's back yard.** That shared back fence line is a great place for hidden paths and secrets.
- **One civic anchor per neighbourhood:** a park, a school, a corner shop. Players orient by these, not by houses.

## A small kit that looks big
Build 3 house shells (small, medium, two-storey) and vary them with:
- Mirrored layout (flip the model; check door hinges and text).
- 4-5 wall color palettes and 2-3 roof colors.
- Swappable porch, garage, chimney and window boxes as separate child models.
- Different yard props per plot (trampoline, pool, garden, broken car).

Kenney **City Kit (Suburban)** and **Furniture Kit** (both CC0, bundle-safe, in the local FBX library) cover shells and interiors; KayKit furniture is a softer alternative.

## Interiors
- Interior floor-to-ceiling around 12-14 studs for a third-person camera (real 9.6 studs feels cramped once the camera is inside).
- Doors at least 4-5 studs wide x 8 studs tall so Rthro avatars and the camera both fit.
- Only furnish what roleplay needs: kitchen, bedroom, bathroom, living room. Empty corners are fine.
- Put each interior's furniture in its own Model so streaming and "edit my house" systems can treat it as a unit.

## Lighting tips
- Warm interior `PointLight`s (around 3000 K-ish orange) against a cool blue evening `OutdoorAmbient` makes houses look inviting at night.
- Only one or two shadowed lights per house. Window glow can be a `SurfaceLight` on a window pane facing outward, no shadows.

## Performance budget
- 20 houses x 60 furniture pieces = 1,200 models; reuse meshes aggressively and keep props `CastShadow = false` unless large.
- Fences are the silent killer: hundreds of tiny posts. Use long fence segments (one mesh per 16-32 studs).
- With streaming on, the shells can stay visible from afar while furniture streams in only near the player; keep each interior as its own model so it streams as a unit.

## Common mistakes
- Every house identical and the map reads as a template.
- Stairs too steep: keep risers small (about 1 stud) and add an invisible ramp part for smooth walking.
- Locked doors players cannot enter with no hint; mark enterable houses with a lit porch or open door.
- Yards with no boundary - players can't tell where "their" plot ends.

## Related
[[Maps - Hub]] - [[Camera-Friendly Interiors - Occlusion Mode, Ceiling Height and Zoom Limits]] - [[Tycoon Plot Layout and Plot Assignment]] - [[Scale in Studs - Real-World Sizes Converted]]
