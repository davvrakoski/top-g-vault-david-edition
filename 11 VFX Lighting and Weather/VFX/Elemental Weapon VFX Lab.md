---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
source_note: "27_Production_Labs/06_Elemental_Weapon_VFX_Lab"
title: "Elemental Weapon VFX Lab"
tags: [roblox, legendary, lab, "cluster/vfx"]
verified: 2026-10-25
cssclasses: [tg-a11]
---

# Elemental Weapon VFX Lab

## Goal
Turn one sword into fire, ice and arcane variants using shared gameplay logic and separate presentation data.

## Build procedure
1. Keep one weapon gameplay definition.
2. Create per-element presentation definition.
3. Use attachments/trails/particles/light carefully.
4. Add element-specific impact VFX/audio.
5. Map server status ID to client presentation.
6. Add distance culling.
7. Add quality tiers.
8. Stress-test repeated swings.

## Evidence to collect
- before/after profiler screenshots or measurements when performance is involved;
- logs for rejected/failed actions;
- a short capture of the happy path;
- a note describing the worst failure discovered;
- exact build/device/server conditions.

## Test matrix
- [ ] weapon unequipped mid-effect.
- [ ] target destroyed.
- [ ] 100 rapid effects.
- [ ] minimum graphics.
- [ ] multiple elements overlap.

## Pass condition
Pass when swapping element presentation does not change trusted damage logic and effects clean themselves up.

## Failure review
If the lab fails, do not paper over it with waits, more particles, more retries or a giant refactor. Identify which layer owns the failure: state, timing, networking, data, physics, streaming, presentation, device input, or content. Fix the owner, then rerun the same test.

## Knowledge graph connections
**Primary cluster:** [[VFX - Hub|VFX]]

**Related:** [[Legendary Production Hub]]
