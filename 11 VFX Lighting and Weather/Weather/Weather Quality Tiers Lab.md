---
area: "11 VFX Lighting and Weather"
cluster: "Weather"
source_note: "27_Production_Labs/05_Weather_Quality_Tiers_Lab"
title: "Weather Quality Tiers Lab"
tags: [roblox, legendary, lab, "cluster/weather"]
verified: 2026-10-25
cssclasses: [tg-a11]
---

# Weather Quality Tiers Lab

## Goal
Build a storm that looks dramatic on high settings while remaining readable and affordable on lower devices.

## Build procedure
1. Create weather state data.
2. Create smooth clear→storm transition.
3. Localize precipitation around camera/player.
4. Add indoor suppression.
5. Add thunder/lightning timing.
6. Create Low/Medium/High VFX variants.
7. Add flash/shake accessibility setting.
8. Benchmark worst storm during combat.

## Evidence to collect
- before/after profiler screenshots or measurements when performance is involved;
- logs for rejected/failed actions;
- a short capture of the happy path;
- a note describing the worst failure discovered;
- exact build/device/server conditions.

## Test matrix
- [ ] enter/exit building.
- [ ] teleport biome.
- [ ] low graphics.
- [ ] storm plus 30 NPCs.
- [ ] rapid weather transition request.

## Pass condition
Pass when gameplay telegraphs remain visible and low tier removes decoration rather than essential information.

## Failure review
If the lab fails, do not paper over it with waits, more particles, more retries or a giant refactor. Identify which layer owns the failure: state, timing, networking, data, physics, streaming, presentation, device input, or content. Fix the owner, then rerun the same test.

## Knowledge graph connections
**Primary cluster:** [[Weather - Hub|Weather]]

**Related:** [[Legendary Production Hub]]
