---
area: "12 UI Audio and Camera"
cluster: "UI UX"
source_note: "27_Production_Labs/08_Cross_Platform_UI_Lab"
title: "Cross-Platform UI Lab"
tags: [roblox, legendary, lab, "cluster/ui-ux"]
verified: 2026-10-25
cssclasses: [tg-a12]
---

# Cross-Platform UI Lab

## Goal
Build one inventory/shop screen that is usable with mouse, touch and gamepad without separate incompatible versions.

## Build procedure
1. Define design tokens.
2. Build reusable button/card/list components.
3. Use responsive layouts/constraints.
4. Implement gamepad focus graph.
5. Add touch-sized targets.
6. Handle safe areas.
7. Test long localization strings.
8. Test loading/error/empty states.

## Evidence to collect
- before/after profiler screenshots or measurements when performance is involved;
- logs for rejected/failed actions;
- a short capture of the happy path;
- a note describing the worst failure discovered;
- exact build/device/server conditions.

## Test matrix
- [ ] small phone.
- [ ] tablet.
- [ ] 1080p.
- [ ] ultrawide.
- [ ] controller only.
- [ ] 200% text-like stress.
- [ ] empty/full inventory.

## Pass condition
Pass when every primary action is reachable without a mouse and no critical text is clipped at target layouts.

## Failure review
If the lab fails, do not paper over it with waits, more particles, more retries or a giant refactor. Identify which layer owns the failure: state, timing, networking, data, physics, streaming, presentation, device input, or content. Fix the owner, then rerun the same test.

## Knowledge graph connections
**Primary cluster:** [[UI UX - Hub|UI UX]]

**Related:** [[Legendary Production Hub]]
