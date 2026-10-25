---
area: "08 Vehicles"
cluster: "Vehicles"
source_note: "28_Troubleshooting_Field_Guide/06_Vehicle_Jitter_or_Ownership"
title: "Vehicle jitters / wrong player controls physics"
tags: [roblox, legendary, lab, "cluster/vehicles"]
verified: 2026-10-25
cssclasses: [tg-a08]
---

# Vehicle jitters / wrong player controls physics

## Symptoms
- driver input delayed.
- passenger entry changes feel.
- vehicle snaps.

## Likely causes
- network ownership assigned unexpectedly.
- server ownership too strict for controller.
- assembly split/anchored unexpectedly.

## Investigation order
1. Reproduce with exact steps and build/device/server conditions.
2. Capture logs/state/profiler evidence before changing code.
3. Disable or isolate one subsystem at a time.
4. Identify the owner layer: client presentation, server game state, network, data, physics, streaming, asset or device input.
5. Make the smallest root-cause fix.
6. Re-run the original reproduction plus edge cases.

## Fix directions
- visualize network owners.
- test seat order.
- inspect assemblies.
- set ownership deliberately where justified.
- server-validate outcomes separately from responsive physics.

## Do not do this
- Do not add random `task.wait()` calls just because timing looks suspicious.
- Do not rewrite the entire framework before proving the failing owner.
- Do not call something “optimized” because the code is shorter.
- Do not remove security validation to make a test pass.

## Regression evidence
Record what changed, why it fixed the root cause, and a test that would fail if the bug returns.

## Knowledge graph connections
**Primary cluster:** [[Vehicles - Hub|Vehicles]]

**Related:** [[Debugging Playbook]]
