---
area: "10 3D Art and Materials"
cluster: "Materials Textures"
title: "Pixel Art and Retro Textures - ResampleMode Pixelated and Crisp Low-Res Looks"
tags: [roblox, community-knowledge, materials, pixel-art, retro, resamplemode, stylized]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/SurfaceAppearance
  - https://create.roblox.com/docs/reference/engine/enums/ResamplerMode
  - https://create.roblox.com/docs/reference/engine/classes/ImageLabel
  - https://create.roblox.com/docs/art/modeling/texture-specifications
---
# Pixel Art and Retro Textures - ResampleMode Pixelated and Crisp Low-Res Looks

Retro "PS1", voxel and Minecraft-like styles are popular on Roblox because they are cheap to produce and instantly readable. The catch: by default every texture is smoothed with bilinear filtering, so a 32×32 pixel-art texture turns into a blurry smear on a big surface. The fix is nearest-neighbour sampling, which Roblox exposes as `Enum.ResamplerMode.Pixelated` on a few classes. Knowing where it works (and where it does not) decides how you build the asset.

## Where Pixelated is available

From the current API reference:

| Class | Property | Effect |
| --- | --- | --- |
| `SurfaceAppearance` | `ResampleMode` | Applies to all its maps; `Pixelated` keeps hard pixel edges |
| `ImageLabel`, `ImageButton` | `ResampleMode` | Crisp pixel-art UI |
| `VideoDisplay` | `ResampleMode` | Video in UI |

`MeshPart.TextureID`, `Decal`, `Texture` and `MaterialVariant` did **not** list a `ResampleMode` property in the reference checked on 2026-10-25. So:

- **Pixel-art meshes**: put the texture in a `SurfaceAppearance` (`ColorMap`) and set `ResampleMode = Pixelated`, rather than using `TextureID`.
- **Pixel-art blocks** (Parts): built-in materials and `Texture` objects will be smoothed. Common workarounds are MeshPart cubes with a SurfaceAppearance, or authoring textures at higher resolution with pixels pre-scaled (each art pixel drawn as 8×8 or 16×16 real pixels) so smoothing only softens edges slightly.

## Authoring rules for crisp results

1. **Pick one pixels-per-stud value** for the whole game, e.g. 16 art pixels per 4-stud block.
2. **UVs on pixel boundaries**: in Blender, enable UV pixel snapping (UV editor > snap to pixels) so island edges sit exactly on texel edges; otherwise neighbouring pixels bleed in.
3. **Pad islands** with duplicated edge pixels, or leave one-pixel gaps of the same colour, because mipmaps still sample neighbours at a distance.
4. **Export PNG** (no JPEG; compression artefacts are obvious at this scale) and keep the image power-of-two (16, 32, 64, 128).
5. **Flat shading** on the mesh (Shade Flat) to match the style.

## Mipmaps and distance

The docs do not say whether `Pixelated` also disables mipmapping (unverified). In practice, expect far surfaces to look softer or simpler, and remember texture streaming may serve a lower resolution first. This is usually fine (distant pixel art should simplify), but very tiny textures (8×8) can turn into a single flat colour at range. Test at real gameplay distances.

## Upscaled-pixel approach (works everywhere)

If you need pixel art on `Decal` or `Texture` or a MaterialVariant:

- Scale the art up with nearest-neighbour in your image editor (Krita, GIMP, Photopea: "None"/"Nearest" resampling) to 256-512 px.
- Upload that. Bilinear smoothing now only touches the outer edge of each big pixel.
- Cost: more texture memory per asset; keep the palette of such textures small.

## Lighting for retro looks

- Lowering `Lighting.EnvironmentSpecularScale` reduces environment reflections (the SurfaceAppearance reference notes metalness has no effect at 0), which suits flat pixel art.
- Use `ColorCorrectionEffect` for palette tinting rather than repainting every texture.

## Pitfalls

- Mixing pixel textures at different pixel densities is the number one style breaker.
- Pixelated normal maps look harsh; most pixel styles skip normal maps entirely.
- Studio thumbnails may look smoothed even when in-game rendering is crisp; judge in Play mode.

## Related
[[Materials Textures - Hub]] · [[Texture vs Decal vs SurfaceAppearance - Which Surface Tool to Use]] · [[Low-Poly Colour Workflows - Palette Atlas vs Vertex Colours]] · [[Free 2D Art Apps - Krita, GIMP, Photopea and Pixel Editors]]
