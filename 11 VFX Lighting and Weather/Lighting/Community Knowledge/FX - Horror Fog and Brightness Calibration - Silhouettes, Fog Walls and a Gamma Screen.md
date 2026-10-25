---
area: "11 VFX Lighting and Weather"
cluster: "Lighting"
title: "Horror Fog and Brightness Calibration - Silhouettes, Fog Walls and a Gamma Screen"
tags: [roblox, community-knowledge, lighting, horror, fog, accessibility, readability]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/environment/atmosphere
  - https://create.roblox.com/docs/reference/engine/classes/Atmosphere
  - https://create.roblox.com/docs/reference/engine/classes/Lighting
  - https://create.roblox.com/docs/reference/engine/classes/ColorCorrectionEffect
---
# Horror Fog and Brightness Calibration - Silhouettes, Fog Walls and a Gamma Screen

Horror games live on the line between "I can't see what's out there" (scary) and "I can't see anything" (players quit). The vault already covers horror lighting values and readable darkness; this note covers the two tools that most decide which side you land on: **what colour and density your fog is**, and **whether each player's screen is calibrated**. Roblox players use everything from dim phones to bright TVs, so a fixed darkness level is wrong for most of them.

## Dark fog vs light fog

| Fog | Look | What reads | Use for |
|---|---|---|---|
| Near-black fog (Atmosphere `Color` ~ (15, 15, 20), high `Density`) | Things vanish into darkness | Only lit objects | Pure dread, flashlight-driven games |
| Grey or pale fog (`Color` ~ (120, 120, 125)) | Things become dark silhouettes against the fog | Shapes of monsters and landmarks at mid range | Classic "something in the fog" horror |
| Tinted fog (sickly green, red) | Stylised, unreal | Silhouettes with mood | Supernatural zones, boss arenas |

The key insight: **a dark shape against light fog is very readable at a distance, but tells you nothing about detail.** That is the ideal horror information: "something is there, I don't know what." Dark fog hides the threat entirely, which can feel unfair when it attacks.

## Atmosphere knobs (from the docs)

- `Density`: how much the air hides distant objects. Horror: 0.45-0.65.
- `Offset`: controls how light transmits between the camera and the sky. Raising it silhouettes distant objects against the sky; lowering it blends them into the sky (too low can cause "ghosting" where the skybox shows through terrain, per the docs). Tune it with `Density` until a monster 40-60 studs away is a silhouette and one at 100+ is gone.
- `Color` and `Decay`: the fog colour and the hue away from the sun (Decay only shows with `Haze` and `Glare` above 0). For horror, keep them close to each other.
- `Haze` and `Glare`: keep `Glare` low in horror (little sun halo), some `Haze` for depth.

Legacy `Lighting.FogStart`/`FogEnd` give a hard linear fog that also works, but Atmosphere looks more natural; the fog options note compares them.

## Fake flashlight beams in fog

Roblox lights do not light up the fog itself, so a flashlight in fog shows a spot on the wall but no visible beam. Fake it:

- A `Beam` from the flashlight attachment forward 15-25 studs, `Width0 = 0.5`, `Width1 = 6`, `FaceCamera = true`, very transparent (0.85 -> 1), soft white, `LightEmission = 0.5`. In first person, keep it very faint or players see a flat cone.
- Dust motes in the beam: a few slow particles inside the cone, `LightInfluence = 1`, so they only show where the light hits.

## Fog walls as level design

- Use fog density per zone to control how far players can see: open graveyard (density 0.45), forest path (0.55), the monster's area (0.65).
- Fade between zone values over 2-3 s when crossing; a sudden change is noticed.
- Never fog the objective: give key landmarks (the exit sign, a lit window) light or `Neon` so they punch through.

## Brightness calibration screen

Add a first-launch screen ("Adjust brightness until the left symbol is barely visible"):

1. Show two symbols on a black UI panel: one at very dark grey (for example (12, 12, 12)), one at dark grey ((30, 30, 30)).
2. A slider maps to a client-side setting applied to a `ColorCorrectionEffect` (`Brightness` around -0.1 to +0.15) and `Lighting.ExposureCompensation` (around -0.3 to +0.6).
3. The player moves the slider until the faint symbol just disappears and the other is visible.
4. Save the value with your settings system; reapply on join. Offer it in the settings menu too.

This one screen fixes most "it's too dark" reviews without making the game less scary for players with good screens. Apply it on the client only: the server should never set per-player brightness.

## Test checklist

- [ ] On a phone at minimum brightness, can you find the path forward?
- [ ] Is the main threat visible as a silhouette before it can hurt you?
- [ ] Do fog changes between zones go unnoticed?
- [ ] Does the calibration setting persist across sessions?

## Related
[[Lighting - Hub]] · [[Fog Options - Lighting Fog vs Atmosphere vs Local Fog Volumes]] · [[Horror Map Design - Pacing, Loops and Readable Darkness]] · [[Story - Horror Flashlights - Aim, Battery, Replication and Shadow Budget]] · [[Lighting too dark - overprocessed]]
