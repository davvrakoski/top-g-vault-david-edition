---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
source_note: "28_Troubleshooting_Field_Guide/10_VFX_Looks_Good_But_Kills_FPS"
title: "VFX looks good but kills FPS"
tags: [roblox, legendary, lab, "cluster/vfx"]
verified: 2026-10-25
cssclasses: [tg-a11]
---

# VFX looks good but kills FPS

## Symptoms
- explosion causes frame drop.
- many swords/emissions overwhelm scene.
- mobile unreadable.

## Likely causes
- too many transparent particles.
- too many lights/shadows.
- persistent residue.
- server replicated cosmetic instances.

## Investigation order
1. Reproduce with exact steps and build/device/server conditions.
2. Capture logs/state/profiler evidence before changing code.
3. Disable or isolate one subsystem at a time.
4. Identify the owner layer: client presentation, server game state, network, data, physics, streaming, asset or device input.
5. Make the smallest root-cause fix.
6. Re-run the original reproduction plus edge cases.

## Fix directions
- isolate each VFX layer.
- measure peak effect count.
- add low/medium/high variants.
- distance-cull.
- pool repeated holders.
- client-render cosmetic outcome.

## Do not do this
- Do not add random `task.wait()` calls just because timing looks suspicious.
- Do not rewrite the entire framework before proving the failing owner.
- Do not call something “optimized” because the code is shorter.
- Do not remove security validation to make a test pass.

## Regression evidence
Record what changed, why it fixed the root cause, and a test that would fail if the bug returns.

## Knowledge graph connections
**Primary cluster:** [[VFX - Hub|VFX]]

**Related:** [[Debugging Playbook]]
