---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "World - Obby Themes and Visual Language"
tags: [roblox, community-knowledge, maps, obby, theming, readability]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://kenney.nl/assets/platformer-kit
  - https://create.roblox.com/docs/parts/materials
  - https://create.roblox.com/docs/environment/lighting
  - https://book.leveldesignbook.com/process/preproduction/pacing
---
# World - Obby Themes and Visual Language

Obby players judge a game from the thumbnail and the first three stages, and the theme is what makes one obby different from a thousand others. But a theme must never hide the rules: every theme needs the same **visual language** for "safe", "deadly", "moving" and "checkpoint". This note is about theming worlds; stage difficulty and checkpoints are in the obby stage note.

## The fixed language (keep across every theme)
| Meaning | Rule |
|---|---|
| Safe platform | Matte, mid-bright, the theme's main color |
| Kill part | Saturated red/orange or glowing; same color in every world |
| Moving / timed | A distinct accent (for example cyan) and a motion hint |
| Bounce / boost | Bright green or yellow with an arrow decal |
| Checkpoint | Large, glowing, with a flag; visible from the previous one |

Players learn this in world 1 and carry it through every reskin. Changing kill-part color per theme is the most common obby readability bug.

## Theme recipes (world = 8-15 stages)
- **Candy / dessert:** pastel platforms, wafer bridges, chocolate rivers as kill floor (keep the "deadly" accent on the river edge). Kenney **Food Kit** (CC0) for props.
- **Lava / volcano:** dark basalt platforms, glowing lava floor, orange rim light. The danger is everywhere, so make safe tops lighter and flatter.
- **Sky islands / clouds:** white and soft blue; use dark outlines or shadows under platforms so depth reads against the sky.
- **Space:** dark background, so platforms need glowing edges; lower `Workspace.Gravity` for one world only, and say so.
- **Ice:** low-friction parts (`CustomPhysicalProperties` with low `Friction`) as the mechanic; blue-white palette, kill parts stay red.
- **Jungle / ruins:** vines as climbable `TrussPart`s, stone platforms, waterfall kill floors.
- **City rooftops:** parkour across buildings; neon signs as checkpoints.

## Layout per world
1. Entry stage that teaches the world's new mechanic safely.
2. 3-5 stages that combine it with old ones.
3. A "postcard" stage with a view of the next world (the reveal that pulls players on).
4. World end: a portal or bridge themed like both worlds.

## Lighting tips
- One lighting preset per world, switched by zone detection: lava warm and dark, sky bright and cool, space near-black ambient.
- Keep `Brightness` and exposure high enough that platform edges are clear on a phone at low graphics quality.
- The Kenney **Platformer Kit** (CC0) is a ready-made colorful base for a starter world.

## Performance budget
- Obbies are long and thin: stream them, and keep each world in its own folder/model.
- Kill parts with `CanTouch` on; everything decorative `CanTouch` and `CanQuery` off.
- Moving platforms: tween on the client or drive with constraints; a hundred server-tweened parts stutter.

## Common mistakes
- Theme props in the jump path, so players hit invisible collision. Keep decor off the route or `CanCollide = false`.
- Background colors identical to platform colors.
- Kill floors that look like water you can swim in.
- Ten worlds with ten different visual rules.

## Related
[[Maps - Hub]] - [[Obby Stage Design - Difficulty Ramp, Checkpoints and Readable Hazards]] - [[Guiding Players with Light, Color and Affordance]] - [[Biome Zone Detection for Lighting and Ambience Swaps]]
