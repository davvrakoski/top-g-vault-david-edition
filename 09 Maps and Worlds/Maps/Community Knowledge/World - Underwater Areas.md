---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "World - Underwater Areas"
tags: [roblox, community-knowledge, maps, underwater, water, lighting]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Terrain
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/classes/SoundService
  - https://create.roblox.com/docs/environment/post-processing-effects
---
# World - Underwater Areas

Underwater zones (reefs, sunken ships, sea labs) are memorable because they change movement, sound and color all at once. They also confuse players fast: no horizon, slow movement and murky light. Design underwater spaces as **short, guided dives between air pockets**, not as an open ocean.

## Two ways to build "underwater"
| Approach | How | Good for |
|---|---|---|
| Terrain water | Real `Water` voxels; Humanoids swim automatically (`HumanoidStateType.Swimming`) | Reefs and lakes connected to a surface |
| Fake underwater | Dry room + blue tint + fog + slow walk/float | Sealed sea labs, aquarium tunnels, cheap mobile builds |

Fake underwater is often the better choice for interiors: full control of movement and no water-render cost.

## Layout plan
1. **Surface entry** with an obvious dive spot (a buoy, a hole in the ice, a sub dock).
2. **A guide line** to follow: a reef ridge, a cable, a trail of glowing coral or bubbles.
3. **Air pockets / safe rooms** every 20-40 seconds of swim time if you have an oxygen mechanic.
4. **One big reveal**: a wreck, a giant skeleton, a lit dome. Put it where the guide line ends.
5. **Floor and ceiling always visible** where possible - they are the only orientation cues.

## Lighting and effects
- Detect "camera underwater" on the client (check the terrain voxel or a region at the camera position) and apply: a `ColorCorrectionEffect` with a blue-green `TintColor` and slightly lower `Saturation`, a `BlurEffect` of size 2-4, and a darker `Atmosphere`.
- Terrain water look: `Terrain.WaterColor` (deep teal), `WaterTransparency` lower for murk, higher for tropical clarity.
- Light shafts: a few transparent beam or neon wedge parts from the surface; glowing coral/plants (`Neon` with low brightness, or small non-shadowed `PointLight`s) as navigation dots.
- `SoundService.AmbientReverb = Enum.ReverbType.UnderWater` while submerged, and muffle music volume.

## Performance budget
- Water surfaces and large transparent volumes are costly on mobile; keep the swimmable area compact.
- Fish: animate a few with client-side tweens or `AnimationController`, not hundreds of server-moved parts.
- Kelp and coral are perfect `CastShadow = false` props; you won't see their shadows in fog anyway.

## Common mistakes
- Open blue void with no floor in view: players lose up/down within seconds.
- Underwater effects left on after surfacing (always clear them on exit and on respawn).
- Oxygen timers so tight that a lag spike kills players.
- Sounds that keep playing at full volume underwater - muffle or cut them.

## Related
[[Maps - Hub]] - [[Terrain Water Gameplay - Swimming Checks, Disabling Swim and Water Settings]] - [[Biome Zone Detection for Lighting and Ambience Swaps]] - [[Guiding Players with Light, Color and Affordance]]
