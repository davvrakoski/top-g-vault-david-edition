---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
title: "Anime Power-Up Aura - Flame Shell, Rising Sparks and Ground Pressure"
tags: [roblox, community-knowledge, vfx, anime, aura, transformation]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/effects/particle-emitters
  - https://create.roblox.com/docs/reference/engine/classes/ParticleEmitter
  - https://create.roblox.com/docs/reference/engine/classes/Highlight
  - https://devforum.roblox.com/t/feedback-on-particle-effects/323675
  - https://www.vfxapprentice.com/blog/the-soul-of-effects-what-is-timing-in-vfx
---
# Anime Power-Up Aura - Flame Shell, Rising Sparks and Ground Pressure

The "powering up" aura (a flickering shell of energy around the body, sparks rising, the ground cracking and dust pushed outward) is the most requested effect in anime battlegrounds and RNG aura games. It is also one of the easiest to overdo: a feedback thread in the sources points out that a strong aura can hide the character it is on, and suggests toning the aura down and adding a highlight instead. The recipe below keeps the character readable.

## Rig

Attach everything to the character, client-side, from a template folder:

- `AuraCore` attachment at `HumanoidRootPart` (centre).
- `AuraFeet` attachment at the root, offset (0, -3, 0) (ground level for R15 default height).
- One attachment per limb if you want limb-hugging flames (optional, costs more).

## Layer 1: flame shell

ParticleEmitter on the `HumanoidRootPart` itself (not an attachment), so particles spawn inside the part's box:

- `Shape = Box`, `ShapeStyle = Volume`. Scale is from the root part; for a full-body shell, put the emitter on an invisible, massless, non-colliding part welded to the root and sized about (3, 5, 2).
- `Orientation = FacingCameraWorldUp` so flames stay upright when the camera tilts.
- `Speed = 2-4`, `EmissionDirection = Top`, `Acceleration = (0, 6, 0)`.
- `Lifetime = 0.35-0.6`, `Rate = 40-70`.
- `Size` 1.2 -> 0.2, `Transparency` 0.3 -> 1, `LightEmission = 1`, `LightInfluence = 0`.
- Flame flipbook texture (4x4 or 8x8) with `FlipbookMode = OneShot` and `FlipbookStartRandom = true`.
- `ZOffset = -1` so the flames sort slightly behind the body; the character's silhouette stays in front.

## Layer 2: rising sparks

- From `AuraFeet`, `Shape = Disc` (radius about 2), `EmissionDirection = Top`, `Speed = 6-12`.
- `Orientation = VelocityParallel`, `Squash` around 1 to stretch them.
- Tiny (`Size` 0.1-0.2), bright, `Rate = 15`, `Lifetime = 0.8`. A few sparks do more than many.

## Layer 3: ground pressure

- Dust ring: emitter at `AuraFeet` with `Shape = Disc`, `ShapeInOut = Outward`, `Speed = 8`, `Drag = 3`, grey-brown, `LightInfluence = 1`. Check the push direction in Studio (a disc can push along its face normal rather than sideways; rotate the attachment or switch to a flat `Cylinder` with `ShapeStyle = Surface` if the dust goes up instead of out).
- Optional cracked-ground decal under the feet that fades in over 0.5 s.
- Small rocks floating upward (anchored parts tweened up 2-4 studs and spun slowly) for the "pressure lifting debris" anime look.

## Layer 4: rim highlight

A `Highlight` on the character with the aura colour: `OutlineTransparency = 0.2`, `FillTransparency = 0.85`, `DepthMode = Occluded`. This keeps the silhouette crisp even under heavy particles and is cheaper than more emitters. Respect the engine's highlight limit; give only active, nearby auras a highlight.

## Timing: charge, burst, sustain

Use the wind-up / climax / fall-off idea from VFX timing:

1. **Charge (0.6-1.0 s):** sparks only, `Rate` ramping up; small inward-moving particles (`ShapeInOut = Inward`) show energy gathering.
2. **Burst (one frame):** `Emit(30)` large flames, a shockwave ring, a camera shake, and a brief `ColorCorrection` bump.
3. **Sustain:** shell at normal rate. The VFX Apprentice timing article suggests that pacing faster than a heartbeat feels aggressive; a pulsing aura can use a flicker around 1-2 Hz for menace, slower for calm "holy" auras.
4. **End:** set `Enabled = false` and let particles finish naturally; never `Destroy()` mid-life (particles vanish instantly).

## Budget

One aura is around 100-150 live particles. In a 20-player server where everyone can have an aura, add distance LOD: beyond 60 studs disable sparks and dust; beyond 120 studs keep only the highlight.

## Related
[[VFX - Hub]] · [[VFX Color Language and Readability]] · [[Highlight Instance - Outlines, X-Ray and the 255 Limit]] · [[DevForum Impact Frame Techniques]] · [[VFX Performance, LOD and Pooling]]
