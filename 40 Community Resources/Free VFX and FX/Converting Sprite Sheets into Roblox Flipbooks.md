---
area: "40 Community Resources"
cluster: "Free VFX and FX"
source_note: "community/free-vfx/converting-sprite-sheets"
title: "Converting Sprite Sheets into Roblox Flipbooks"
tags: [roblox, community, vfx, flipbook, technique, "cluster/free-vfx-and-fx"]
verified: 2026-10-25
license: "n/a - technique note"
sources:
  - https://devforum.roblox.com/t/particles’-flipbook-release/2029388
  - https://create.roblox.com/docs/effects/particle-emitters
  - https://create.roblox.com/docs/reference/engine/enums/ParticleFlipbookLayout
  - https://devforum.roblox.com/t/having-some-problems-creating-particles-and-using-flipbook-stuff/2979491
  - https://imagemagick.org/license/
cssclasses: [tg-a40]
---

# Converting Sprite Sheets into Roblox Flipbooks

Most free effect sheets (OpenGameArt, itch.io, Unity) are **horizontal strips** or odd grids with frame counts like 50, 56 or 60. Roblox wants something stricter. This is the conversion recipe; the property reference lives in [[ParticleEmitter Bursts, Flipbooks and Budgets]] and [[Particle emitters]].

## Roblox's rules (official docs + 2022 release post)

| Rule | Value |
|---|---|
| Texture shape | Square, power-of-two: 8, 16, 32, 64, 128, 256, 512 or **1024** px per side |
| Layouts | `Grid2x2` (4 frames), `Grid4x4` (16), `Grid8x8` (64), or `Custom` (`FlipbookSizeX` x `FlipbookSizeY`) |
| Spacing | Leave transparent space around frames; mip filtering can bleed neighbours |
| Framerate | `FlipbookFramerate` max 30 fps (ignored in `OneShot`, which spreads frames over Lifetime) |
| Memory | Low-memory clients switch flipbooks off, so reuse sheets and keep them small |
| Script enum | `Enum.ParticleFlipbookLayout.Grid8x8`. The old names (`EightByEight`, etc.) were renamed in 2022, and `Enum.ParticleEmitterFlipbookLayout` does not exist (a common DevForum error) |

## Step 1: pick a target grid

| Source frames | Target | Frame size at 1024 | How |
|---|---|---|---|
| 60-64 | 8x8 | 128 px | Use all, pad or drop to 64 |
| 40-59 | 8x8 or 4x4 | 128 / 256 px | Use every frame plus duplicate the last few, **or** every 3rd frame into 4x4 |
| 12-30 | 4x4 | 256 px | Pick 16 evenly spaced frames |
| 4-8 | 2x2 | 512 px | Pick 4 key frames |

For fast effects (explosions, hits), **16 frames at 256 px usually looks better** than 64 tiny frames, because the frames are bigger on screen and memory stays the same.

## Step 2: slice and re-pack with ImageMagick (free; command line)

```bash
# 1) cut a strip/grid of 100x100 frames into numbered files
magick explosion.png -crop 100x100 +repage frame_%02d.png

# 2) (optional) keep every 3rd frame for a 16-frame 4x4 sheet: copy/rename the ones you want

# 3) montage into a 4x4 grid, 256 px cells = 248 px frame + 4 px padding each side
magick montage frame_*.png -tile 4x4 -geometry 248x248+4+4 -background none sheet_4x4.png

# 4) make sure it is exactly 1024x1024
magick sheet_4x4.png -gravity center -background none -extent 1024x1024 sheet_4x4.png
```

Rule of thumb: cell size = 1024 / columns, and frame size = cell minus 2 x padding. GUI alternative: [[Free Tools for Making Your Own VFX Textures]] (Free Texture Packer, Krita).

## Step 3: settings in Studio

1. Upload the PNG as an Image, then put it in `ParticleEmitter.Texture`.
2. `FlipbookLayout` = your grid.
3. `FlipbookMode`:
   - `OneShot`: explosions, impacts, puffs (one play per particle, timed by Lifetime).
   - `Loop`: fire, auras, torches (set `FlipbookFramerate` 12-30).
   - `PingPong`: breathing glows. `Random`: flicker/static.
4. `FlipbookStartRandom = true` for loops, so particles are out of sync. Official tip: `FlipbookStartRandom = true` **plus** `FlipbookFramerate = 0` makes each particle a random static frame. That turns a sheet of 16 debris chunks into 16 variants in one emitter.
5. Check at gameplay distance. If frames pop, lengthen Lifetime or add frames.

## Common failures

- **Frames "slide" or show neighbours**: grid count wrong, or no padding.
- **Sheet looks blurry**: the source was upscaled past its native size, or Roblox downscaled an image larger than 1024.
- **Black fringes**: alpha bleeding; see [[Fixing Black Outlines on Particle Textures]].
- **Animation never plays on some phones**: memory fallback. Have the first frame read well on its own.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free VFX and FX - Hub]]

**Related notes:** [[ParticleEmitter Bursts, Flipbooks and Budgets]] · [[Unity Labs CC0 Flipbooks - Smoke, Fire and Explosions]] · [[OpenGameArt CC0 VFX Sprite Sheets]] · [[ParticleFlipbookLayout]]

<!-- TDOD_GRAPH_END -->
