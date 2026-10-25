---
area: "40 Community Resources"
cluster: "Free VFX and FX"
source_note: "community/free-vfx/unity-labs-cc0-flipbooks"
title: "Unity Labs CC0 Flipbooks - Smoke, Fire and Explosions"
tags: [roblox, community, vfx, free-assets, cc0, flipbook, "cluster/free-vfx-and-fx"]
verified: 2026-10-25
license: "CC0 1.0"
sources:
  - https://unity.com/blog/engine-platform/free-vfx-image-sequences-flipbooks
  - https://create.roblox.com/docs/effects/particle-emitters
  - https://devforum.roblox.com/t/particles’-flipbook-release/2029388
cssclasses: [tg-a40]
---

# Unity Labs CC0 Flipbooks - Smoke, Fire and Explosions

In November 2016 **Thomas Iché (Unity Labs Paris)** published a set of Houdini-simulated smoke, fire and explosion image sequences under **CC0 1.0**. They are plain zip downloads from Unity's site, not Unity Asset Store items, so the Asset Store EULA does not apply. They are among the few free, *realistic* simulated flipbooks with a clean license. The [[Brackeys VFX Bundle (CC0)]] credits Thomas Iché for its flipbooks, so expect overlap.

## What is in the set

| Group | Assets | License | Redistribute? | Link |
|---|---|---|---|---|
| Smoke | CandleSmoke01, DiscSmoke01, WispySmoke01-03, WispySmoke03b | CC0 | Yes | [Unity blog post](https://unity.com/blog/engine-platform/free-vfx-image-sequences-flipbooks) |
| Clouds | Cloud01-04 | CC0 | Yes | same |
| Explosions | Explosion00, 01 (+ light / nofire variants), 02, 02HD | CC0 | Yes | same |
| Fireballs | FireBall01-04 | CC0 | Yes | same |
| Flames | Flame02, Flame03 (+ hollow), SmallFlame01 variants, temperature maps | CC0 | Yes | same |

Each asset has three zips: **Flipbooks** (pre-assembled sheets), **EXR sequence** (HDR linear) and **TGA sequence**. The download links on the post were still live on 2026-10-25. Credit is not required; a courtesy line is "Unity Labs / Thomas Iché, CC0".

## Getting them into Roblox

1. **Start from the Flipbooks zip**, not EXR (Roblox images are 8-bit PNG/JPG/TGA; EXR is not accepted).
2. Check the sheet. Roblox needs a **square, power-of-two** texture (8 to 1024 px per side) in a **2x2, 4x4, 8x8** or custom grid. If the sheet is not square or has a different frame count, re-pack it: [[Converting Sprite Sheets into Roblox Flipbooks]].
3. Downscale to **1024x1024 max** (8x8 = 128 px frames, 4x4 = 256 px frames). Roblox caps uploaded images at 1024 px per side.
4. Upload as an Image, put it in `ParticleEmitter.Texture`, then set:
   - `FlipbookLayout` = matching grid; `FlipbookMode = OneShot` for explosions/fireballs (frames spread over each particle's Lifetime); `Loop` for flames and wisps.
   - Explosions: `LightEmission` 0.3-0.6 so the fire glows but the smoke reads; Lifetime 0.6-1.2; `Emit()` 2-4 particles with random `Rotation`.
   - Smoke/wisps: `LightEmission = 0`, `LightInfluence = 1`, `FlipbookStartRandom = true` so neighbours are out of sync.
5. Leave spacing around frames. Roblox's docs and the 2022 flipbook release post both recommend it to avoid mip bleeding.

**Budget:** flipbooks cost texture memory, and Roblox turns them off on low-memory clients. Reuse one explosion sheet across many effects rather than uploading five. See [[ParticleEmitter Bursts, Flipbooks and Budgets]].

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free VFX and FX - Hub]]

**Related notes:** [[Explosion and Fireball Production — Layered, Fast, Readable]] · [[Fire, Smoke, Lightning and Destruction]] · [[Particle emitters]] · [[Texture Memory and Triangle Budgets for Roblox Scenes]]

<!-- TDOD_GRAPH_END -->
