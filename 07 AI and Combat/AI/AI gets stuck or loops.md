---
area: "07 AI and Combat"
cluster: "AI"
source_note: "28_Troubleshooting_Field_Guide/14_AI_Gets_Stuck"
title: "AI gets stuck or loops"
tags: [roblox, legendary, lab, "cluster/ai"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# AI gets stuck or loops

## Symptoms
- NPC vibrates at doorway.
- repaths forever.
- search never ends.

## Likely causes
- no Path.Blocked recovery.
- goal invalid/unreachable.
- state has no timeout.
- navigation recomputed too aggressively.

## Investigation order
1. Reproduce with exact steps and build/device/server conditions.
2. Capture logs/state/profiler evidence before changing code.
3. Disable or isolate one subsystem at a time.
4. Identify the owner layer: client presentation, server game state, network, data, physics, streaming, asset or device input.
5. Make the smallest root-cause fix.
6. Re-run the original reproduction plus edge cases.

## Fix directions
- visualize target/path/state.
- add timeout/fallback.
- repath only on meaningful change.
- choose direct movement when valid.
- record last good waypoint.

## Do not do this
- Do not add random `task.wait()` calls just because timing looks suspicious.
- Do not rewrite the entire framework before proving the failing owner.
- Do not call something “optimized” because the code is shorter.
- Do not remove security validation to make a test pass.

## Regression evidence
Record what changed, why it fixed the root cause, and a test that would fail if the bug returns.

## Knowledge graph connections
**Primary cluster:** [[AI - Hub|AI]]

**Related:** [[Debugging Playbook]]
