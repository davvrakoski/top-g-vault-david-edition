---
area: "40 Community Resources"
cluster: "Free VFX and FX"
source_note: "community/free-vfx/lightning-beams"
title: "Lightning Beams Module (MIT)"
tags: [roblox, community, vfx, open-source, mit, lightning, beams, "cluster/free-vfx-and-fx"]
verified: 2026-10-25
license: "MIT"
sources:
  - https://devforum.roblox.com/t/843534
  - https://github.com/SamyBlue/Lightning-Beams
cssclasses: [tg-a40]
---

# Lightning Beams Module (MIT)

**Creator:** Quasiduck on the DevForum (GitHub: SamyBlue) · **Posted:** 29 Oct 2020 (v1.1) · **License:** MIT (GitHub) · About 87 GitHub stars; last push March 2022.

The go-to free procedural lightning for Roblox. Bolts are made of animated, Perlin-noise-displaced segments along an optional Bezier curve, so they crackle instead of blinking in and out.

| Resource | What | License | Redistribute? | Link |
|---|---|---|---|---|
| Lightning Beams | Client-side lightning bolts, sparks and explosion helpers | MIT | Yes (keep the MIT notice) | https://github.com/SamyBlue/Lightning-Beams |

## API in one screen (from the README)

| Constructor | Use |
|---|---|
| `LightningBolt.new(Attachment0, Attachment1, PartCount)` | Bolt between two attachments |
| `LightningSparks.new(bolt, MaxSparkCount)` | Small sparks flying off a bolt |
| `LightningExplosion.new(Position, Size, NumBolts, Color, BoltColor, UpVector)` | Radial burst of bolts |
| `:Destroy()` | Cleanup on each object |

Main bolt properties: `CurveSize0/1`, `MinRadius/MaxRadius`, `Frequency`, `AnimationSpeed`, `Thickness`, `Min/MaxThicknessMultiplier`, `Min/MaxTransparency`, `PulseSpeed`, `PulseLength`, `FadeLength`, `ContractFrom`, `Color` (Color3 or ColorSequence), `ColorOffsetSpeed`.

**Note:** the DevForum post warns the Sparks and Explosion sub-modules were not fully compatible with v1.1 when it was posted. Test them before relying on them.

## Production pattern

1. The **server** decides a hit, then fires a RemoteEvent with the two positions.
2. **Each client** creates attachments and `LightningBolt.new(...)`, sets `PulseSpeed` / `FadeLength` for a one-shot strike, and destroys after about 0.5 s.
3. Add a bright, short `PointLight` flash and a camera bump ([[RbxCameraShaker for VFX Impacts (MIT)]]).
4. Bloom with a lowered threshold makes the bolt glow (the author's suggestion). Keep bloom subtle: [[Post-Processing - Bloom, Color and DOF]].
5. Disable or skip bolts far from the camera. v1.1 already pools parts with PartCache.

Credit line: "Lightning Beams by Quasiduck / SamyBlue - MIT".

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free VFX and FX - Hub]]

**Related notes:** [[Fire, Smoke, Lightning and Destruction]] · [[Beams, Trails and Attachments - Production Setups]] · [[Elemental Weapon VFX System — Fire, Ice, Arcane, Holy and Dark]]

<!-- TDOD_GRAPH_END -->
