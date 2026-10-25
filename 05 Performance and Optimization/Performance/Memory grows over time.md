---
area: "05 Performance and Optimization"
cluster: "Performance"
source_note: "28_Troubleshooting_Field_Guide/04_Memory_Grows_Over_Time"
title: "Memory grows over time"
tags: [roblox, legendary, lab, "cluster/performance"]
verified: 2026-10-25
cssclasses: [tg-a05]
---

# Memory grows over time

## Symptoms
- session starts fine then crashes.
- memory graph climbs after rounds.
- old UI/VFX/NPCs persist.

## Likely causes
- event connections retained.
- tables keep instance/player refs.
- effects never destroyed/released.
- round content not cleaned.

## Investigation order
1. Reproduce with exact steps and build/device/server conditions.
2. Capture logs/state/profiler evidence before changing code.
3. Disable or isolate one subsystem at a time.
4. Identify the owner layer: client presentation, server game state, network, data, physics, streaming, asset or device input.
5. Make the smallest root-cause fix.
6. Re-run the original reproduction plus edge cases.

## Fix directions
- repeat one round/action 20x.
- compare memory after each loop.
- trace lifecycle owner.
- disconnect/clear/release on teardown.
- verify plateau after GC opportunity.

## Do not do this
- Do not add random `task.wait()` calls just because timing looks suspicious.
- Do not rewrite the entire framework before proving the failing owner.
- Do not call something “optimized” because the code is shorter.
- Do not remove security validation to make a test pass.

## Regression evidence
Record what changed, why it fixed the root cause, and a test that would fail if the bug returns.

## Knowledge graph connections
**Primary cluster:** [[Performance - Hub|Performance]]

**Related:** [[Debugging Playbook]]
