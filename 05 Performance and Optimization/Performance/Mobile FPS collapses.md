---
area: "05 Performance and Optimization"
cluster: "Performance"
source_note: "28_Troubleshooting_Field_Guide/03_Mobile_FPS_Collapse"
title: "Mobile FPS collapses"
tags: [roblox, legendary, lab, "cluster/performance"]
verified: 2026-10-25
cssclasses: [tg-a05]
---

# Mobile FPS collapses

## Symptoms
- desktop fine; phone stutters.
- device heats then slows.
- combat/weather causes spikes.

## Likely causes
- GPU transparency/particles/lights.
- script CPU.
- memory pressure.
- thermal throttling.

## Investigation order
1. Reproduce with exact steps and build/device/server conditions.
2. Capture logs/state/profiler evidence before changing code.
3. Disable or isolate one subsystem at a time.
4. Identify the owner layer: client presentation, server game state, network, data, physics, streaming, asset or device input.
5. Make the smallest root-cause fix.
6. Re-run the original reproduction plus edge cases.

## Fix directions
- benchmark 10+ minutes.
- turn off effect layers one category at a time.
- inspect MicroProfiler/memory.
- create quality tiers.
- reduce decorative work before gameplay signals.

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
