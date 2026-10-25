---
area: "10 3D Art and Materials"
cluster: "Materials Textures"
title: "Glowing Surfaces - Neon Material, Emissive Masks and Bloom"
tags: [roblox, community-knowledge, materials, emissive, neon, bloom, lighting]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/SurfaceAppearance
  - https://create.roblox.com/docs/reference/engine/classes/Decal
  - https://create.roblox.com/docs/art/modeling/texture-specifications
  - https://create.roblox.com/docs/parts/materials
  - https://devforum.roblox.com/t/on-hold-emissives/4034414
  - https://devforum.roblox.com/t/decal-texture-emissive-maps/4743835
---
# Glowing Surfaces - Neon Material, Emissive Masks and Bloom

Glowing screens, sci-fi panels, lava cracks, magic runes and car lights all need surfaces that look self-lit. On Roblox you have three tools: the built-in **Neon** material (whole part glows), **emissive maps** on `SurfaceAppearance`, `MaterialVariant` and now `Decal` (only masked pixels glow), and **lights** that actually illuminate the surroundings. Mixing them correctly gives a convincing glow at low cost.

## Tool 1: Neon material

- Set `BasePart.Material = Neon`; the part renders bright in its `Color` and feeds the bloom post effect.
- The whole part glows, so model glowing pieces as **separate parts** (the light strip, not the whole lamp).
- `Transparency` on Neon parts softens the glow and is a classic "light beam" trick.
- Cheap and works on every device; this is still the default choice for blocky and stylized games.

## Tool 2: emissive masks

The API reference now lists on `SurfaceAppearance` (and on `MaterialVariant` and `Decal`):

| Property | Meaning |
| --- | --- |
| `EmissiveMaskContent` | Greyscale image: black = no glow, white = full glow (8-bit single channel per the texture spec). |
| `EmissiveStrength` | Multiplier. Large values clamp and can look flat white. |
| `EmissiveTint` | `Color3` tint for the glow. |

The emissive contribution is added to lighting, then multiplied by the albedo, so **the albedo colour under the mask decides the glow colour**. A black albedo behind a white mask will not glow; paint the glowing pixels in the colour you want (or bright neutral and use `EmissiveTint`).

Status note: a DevForum announcement for emissive maps in a Studio beta was marked "on hold" for investigation at one point. The properties are in the current API reference, but check the latest announcement before shipping a game that depends on them (status as of 2026-10-25 not confirmed).

## Tool 3: real lights

Neither Neon nor emissive maps light up the world around them. Add a `PointLight`, `SpotLight` or `SurfaceLight` where the glow should spill onto walls or the floor, at low `Brightness` and short `Range`. Many dark-themed games use one light per **group** of glowing panels rather than one per panel, because many shadow-casting lights are expensive.

## Bloom and post

- `Lighting > BloomEffect` (`Intensity`, `Size`, `Threshold`) turns bright pixels into glow halos. Lower `Threshold` makes more things glow, including sky and white walls; raise it so only Neon/emissive passes.
- Too much bloom makes UI and white avatars look smeared; test on daytime scenes too.

## Authoring emissive maps

1. Paint glow areas on a separate layer; export as greyscale mask (PNG).
2. If you supply an RGB image, the announcement says only the red channel is used; keep masks greyscale to be safe.
3. Keep masks low resolution when possible (128-256 px) for small panels; glow edges are blurred by bloom anyway.
4. Animate glow by changing `EmissiveStrength` or `EmissiveTint` (pulsing runes), not by swapping textures.

## Which to use

| Case | Tool |
| --- | --- |
| Blocky neon signs, light strips | Neon parts + optional light |
| Screen or panel with detailed glowing pattern | Emissive mask on SurfaceAppearance |
| Glowing cracks on a big rock floor | Emissive on the MaterialVariant (if supported) or Neon decal-like mesh strips |
| Light that must illuminate a room | Real light + glowing source visual |

## Related
[[Materials Textures - Hub]] · [[SurfaceAppearance AlphaMode and TintMask - Recolorable Assets]] · [[Materials, PBR and Textures]] · [[Guiding Players with Light, Color and Affordance]]
