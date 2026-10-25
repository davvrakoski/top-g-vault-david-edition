---
area: "13 Growth and Monetization"
cluster: "Thumbnails"
source_note: "28_Troubleshooting_Field_Guide/15_Thumbnail_Clicks_But_Players_Leave"
title: "Thumbnail clicks but players leave"
tags: [roblox, legendary, lab, "cluster/thumbnails"]
verified: 2026-10-25
cssclasses: [tg-a13]
---

# Thumbnail clicks but players leave

## Symptoms
- good impressions/clicks but high first-play bounce.
- players say game differs from image.

## Likely causes
- misleading thumbnail.
- slow join.
- first objective unclear.
- thumbnail promises unavailable feature.

## Investigation order
1. Reproduce with exact steps and build/device/server conditions.
2. Capture logs/state/profiler evidence before changing code.
3. Disable or isolate one subsystem at a time.
4. Identify the owner layer: client presentation, server game state, network, data, physics, streaming, asset or device input.
5. Make the smallest root-cause fix.
6. Re-run the original reproduction plus edge cases.

## Fix directions
- compare thumbnail promise to first 60 seconds.
- measure join/onboarding.
- remove misleading imagery.
- stage screenshot from actual game style.
- optimize retention before chasing more clicks.

## Do not do this
- Do not add random `task.wait()` calls just because timing looks suspicious.
- Do not rewrite the entire framework before proving the failing owner.
- Do not call something “optimized” because the code is shorter.
- Do not remove security validation to make a test pass.

## Regression evidence
Record what changed, why it fixed the root cause, and a test that would fail if the bug returns.

## Knowledge graph connections
**Primary cluster:** [[Thumbnails - Hub|Thumbnails]]

**Related:** [[Debugging Playbook]]
