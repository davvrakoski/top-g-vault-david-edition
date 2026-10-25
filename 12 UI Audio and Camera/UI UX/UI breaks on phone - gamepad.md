---
area: "12 UI Audio and Camera"
cluster: "UI UX"
source_note: "28_Troubleshooting_Field_Guide/09_UI_Breaks_on_Phone_or_Gamepad"
title: "UI breaks on phone/gamepad"
tags: [roblox, legendary, lab, "cluster/ui-ux"]
verified: 2026-10-25
cssclasses: [tg-a12]
---

# UI breaks on phone/gamepad

## Symptoms
- buttons clipped.
- no focus path.
- touch too small.
- modal traps controller.

## Likely causes
- fixed pixel layout.
- mouse-only interactions.
- missing selection/focus graph.
- no safe-area consideration.

## Investigation order
1. Reproduce with exact steps and build/device/server conditions.
2. Capture logs/state/profiler evidence before changing code.
3. Disable or isolate one subsystem at a time.
4. Identify the owner layer: client presentation, server game state, network, data, physics, streaming, asset or device input.
5. Make the smallest root-cause fix.
6. Re-run the original reproduction plus edge cases.

## Fix directions
- test smallest target viewport.
- navigate without mouse.
- stress long text.
- use layouts/constraints/tokens.
- define back/cancel behavior.

## Do not do this
- Do not add random `task.wait()` calls just because timing looks suspicious.
- Do not rewrite the entire framework before proving the failing owner.
- Do not call something “optimized” because the code is shorter.
- Do not remove security validation to make a test pass.

## Regression evidence
Record what changed, why it fixed the root cause, and a test that would fail if the bug returns.

## Knowledge graph connections
**Primary cluster:** [[UI UX - Hub|UI UX]]

**Related:** [[Debugging Playbook]]
