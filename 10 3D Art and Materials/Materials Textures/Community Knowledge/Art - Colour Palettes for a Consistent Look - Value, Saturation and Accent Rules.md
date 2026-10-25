---
area: "10 3D Art and Materials"
cluster: "Materials Textures"
title: "Colour Palettes for a Consistent Look - Value, Saturation and Accent Rules"
tags: [roblox, community-knowledge, materials, colour, palette, art-direction]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/ColorCorrectionEffect
  - https://create.roblox.com/docs/reference/engine/classes/SurfaceAppearance
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
  - https://lospec.com/palette-list
---
# Colour Palettes for a Consistent Look - Value, Saturation and Accent Rules

Most "this game looks messy" feedback is a colour problem, not a modeling problem: every prop picked its own saturated colour, so nothing reads as important. A small, written palette with rules for value (lightness), saturation and accent use makes free models, AI textures and hand-made props sit together, and it tells players where to look. The technique for applying colours to meshes (atlas vs vertex colours) is in [[Low-Poly Colour Workflows - Palette Atlas vs Vertex Colours]]; this note is about choosing the colours and enforcing them.

## Build the palette in four groups

1. **Environment base (5-8 colours):** ground, walls, wood, stone, foliage. Low to mid saturation. These cover 60-70% of the screen.
2. **Secondary (3-5):** props and trims, a little more saturated than the base.
3. **Accent (1-3):** reserved for gameplay: pickups, interactables, team colours, danger. The most saturated colours in the game, used sparingly.
4. **Neutrals (3):** near-black, mid-grey, near-white, slightly tinted toward your scene's temperature (warm or cool), never pure `#000000` / `#FFFFFF`.

A common split is roughly 60% base, 30% secondary, 10% accent. Lospec's palette list is a good free place to study small, deliberate palettes for stylized games.

## Rules that keep it working

- **Value first:** convert a screenshot to greyscale. Player, interactables and paths should still separate clearly. If they do not, fix lightness before hue.
- **Saturation ladder:** background lowest, props middle, accents highest. A saturated wall steals attention from the pickup in front of it.
- **One temperature per zone:** warm lights with slightly cool shadows (or the reverse). Per-biome palettes can shift hue but keep the same value structure.
- **Accent = meaning:** if gold means "collectable", nothing decorative is gold.
- **Albedo limits:** for PBR materials keep base colours inside realistic brightness ranges ([[PBR Value Cheat Sheet - Albedo, Metalness and Roughness Ranges]]); very dark or very bright albedo breaks lighting.

## Applying it in Roblox

- **Single source of truth:** store the palette as a ModuleScript of named `Color3` values (`Palette.Wood`, `Palette.Accent_Pickup`) and use it in build tools, UI and scripts so colours never drift.

```lua
-- ReplicatedStorage/Palette (example values, pick your own)
return {
	Ground = Color3.fromRGB(96, 110, 78),
	Wood = Color3.fromRGB(122, 86, 60),
	Accent_Pickup = Color3.fromRGB(255, 196, 64),
}
```

- **Tintable assets:** textures made in greyscale with a tint mask can take palette colours at runtime ([[SurfaceAppearance AlphaMode and TintMask - Recolorable Assets]]).
- **Global grade:** `ColorCorrectionEffect` in `Lighting` (`Brightness`, `Contrast`, `Saturation`, `TintColor`) pulls mixed sources together. Keep it subtle (for example Saturation -0.1 to +0.1); it cannot rescue a bad palette and it also tints UI-like world elements.
- **Lighting is part of the palette:** `Lighting.Ambient`, `OutdoorAmbient` and sky colour shift every surface. Lock lighting before final colour picks, and test palettes under day and night.

## Checking imported content

1. Drop the asset next to palette swatch blocks in a test place.
2. Greyscale screenshot (any image editor) to check value.
3. Adjust hue and saturation of its textures, or switch it to a tinted greyscale version.
4. Reject or recolour anything using an accent colour without gameplay meaning.

## Pitfalls

- Pure white parts under bright sun: clipped highlights and no form.
- Different reds for "danger" across UI and world.
- Picking colours in a dark Studio theme at night and shipping a washed-out game; check on a phone at full brightness.

## Related
[[Materials Textures - Hub]] - [[Low-Poly Colour Workflows - Palette Atlas vs Vertex Colours]] - [[Stylized vs Realistic Art Direction on Roblox]] - [[Visual Style Guide Template]]
