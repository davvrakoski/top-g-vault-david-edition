---
area: "04 Networking Data and Servers"
cluster: "Data Backend"
source_note: "28_Troubleshooting_Field_Guide/08_Save_Data_Reset_or_Corruption"
title: "Save data resets or corrupts"
tags: [roblox, legendary, lab, "cluster/data-backend"]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# Save data resets or corrupts

## Symptoms
- returning player loses progress.
- old versions fail.
- partial tables become nil.

## Likely causes
- schema changed without migration.
- defaults overwrite loaded data.
- Studio touched production.
- write failure treated as success.

## Investigation order
1. Reproduce with exact steps and build/device/server conditions.
2. Capture logs/state/profiler evidence before changing code.
3. Disable or isolate one subsystem at a time.
4. Identify the owner layer: client presentation, server game state, network, data, physics, streaming, asset or device input.
5. Make the smallest root-cause fix.
6. Re-run the original reproduction plus edge cases.

## Fix directions
- preserve old fixture.
- validate before mutating.
- migrate version-by-version.
- isolate test data.
- log and surface load/save failure state.

## Do not do this
- Do not add random `task.wait()` calls just because timing looks suspicious.
- Do not rewrite the entire framework before proving the failing owner.
- Do not call something “optimized” because the code is shorter.
- Do not remove security validation to make a test pass.

## Regression evidence
Record what changed, why it fixed the root cause, and a test that would fail if the bug returns.

## Knowledge graph connections
**Primary cluster:** [[Data Backend - Hub|Data Backend]]

**Related:** [[Debugging Playbook]]
