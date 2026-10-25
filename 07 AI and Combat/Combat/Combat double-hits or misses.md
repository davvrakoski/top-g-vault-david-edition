---
area: "07 AI and Combat"
cluster: "Combat"
source_note: "28_Troubleshooting_Field_Guide/07_Combat_Double_Hits"
title: "Combat double-hits or misses"
tags: [roblox, legendary, lab, "cluster/combat"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# Combat double-hits or misses

## Symptoms
- one swing damages twice.
- fast attacks miss.
- same target hit on multiple limbs.

## Likely causes
- Touched events duplicated.
- hitbox queried multiple active frames without attack ID set.
- no per-attack target set.
- animation/server windows disagree.

## Investigation order
1. Reproduce with exact steps and build/device/server conditions.
2. Capture logs/state/profiler evidence before changing code.
3. Disable or isolate one subsystem at a time.
4. Identify the owner layer: client presentation, server game state, network, data, physics, streaming, asset or device input.
5. Make the smallest root-cause fix.
6. Re-run the original reproduction plus edge cases.

## Fix directions
- assign attack ID.
- track targets hit per attack.
- use deliberate overlap/raycast window.
- log attack start/active/end.
- validate under latency.

## Do not do this
- Do not add random `task.wait()` calls just because timing looks suspicious.
- Do not rewrite the entire framework before proving the failing owner.
- Do not call something “optimized” because the code is shorter.
- Do not remove security validation to make a test pass.

## Regression evidence
Record what changed, why it fixed the root cause, and a test that would fail if the bug returns.

## Knowledge graph connections
**Primary cluster:** [[Combat - Hub|Combat]]

**Related:** [[Debugging Playbook]]
