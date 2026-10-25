---
area: "11 VFX Lighting and Weather"
cluster: "Lighting"
source_note: "28_Troubleshooting_Field_Guide/12_Lighting_Too_Dark_or_Overprocessed"
title: "Lighting too dark / overprocessed"
tags: [roblox, legendary, lab, "cluster/lighting"]
verified: 2026-10-25
cssclasses: [tg-a11]
---

# Lighting too dark / overprocessed

## Symptoms
- players cannot read enemies.
- bloom nukes UI.
- interiors black out.
- stylized scene looks like AI render.

## Likely causes
- post effects stacked without hierarchy.
- no gameplay value check.
- exposure/contrast extremes.
- materials and lighting fight.

## Investigation order
1. Reproduce with exact steps and build/device/server conditions.
2. Capture logs/state/profiler evidence before changing code.
3. Disable or isolate one subsystem at a time.
4. Identify the owner layer: client presentation, server game state, network, data, physics, streaming, asset or device input.
5. Make the smallest root-cause fix.
6. Re-run the original reproduction plus edge cases.

## Fix directions
- view grayscale/value structure.
- disable post layers one by one.
- test gameplay target readability.
- compare low graphics.
- use one art-direction goal.

## Do not do this
- Do not add random `task.wait()` calls just because timing looks suspicious.
- Do not rewrite the entire framework before proving the failing owner.
- Do not call something “optimized” because the code is shorter.
- Do not remove security validation to make a test pass.

## Regression evidence
Record what changed, why it fixed the root cause, and a test that would fail if the bug returns.

## Knowledge graph connections
**Primary cluster:** [[Lighting - Hub|Lighting]]

**Related:** [[Debugging Playbook]]
