---
area: "09 Maps and Worlds"
cluster: "Maps"
source_note: "28_Troubleshooting_Field_Guide/05_Streaming_Nil_References"
title: "Streaming causes nil/missing instances"
tags: [roblox, legendary, lab, "cluster/maps"]
verified: 2026-10-25
cssclasses: [tg-a09]
---

# Streaming causes nil/missing instances

## Symptoms
- works with streaming off.
- client WaitForChild hangs.
- teleport/fast vehicle breaks scripts.

## Likely causes
- client assumes full Workspace.
- persistent model misuse.
- hard object reference instead of ID/tag/state.

## Investigation order
1. Reproduce with exact steps and build/device/server conditions.
2. Capture logs/state/profiler evidence before changing code.
3. Disable or isolate one subsystem at a time.
4. Identify the owner layer: client presentation, server game state, network, data, physics, streaming, asset or device input.
5. Make the smallest root-cause fix.
6. Re-run the original reproduction plus edge cases.

## Fix directions
- enable streaming early.
- reproduce fast travel.
- use streamed-safe lookup/event.
- keep truth on server or replicated state.
- avoid infinite waits for optional world content.

## Do not do this
- Do not add random `task.wait()` calls just because timing looks suspicious.
- Do not rewrite the entire framework before proving the failing owner.
- Do not call something “optimized” because the code is shorter.
- Do not remove security validation to make a test pass.

## Regression evidence
Record what changed, why it fixed the root cause, and a test that would fail if the bug returns.

## Knowledge graph connections
**Primary cluster:** [[Maps - Hub|Maps]]

**Related:** [[Debugging Playbook]]
