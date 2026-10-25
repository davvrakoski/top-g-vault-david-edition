---
area: "06 Characters and Animation"
cluster: "Animation"
source_note: "28_Troubleshooting_Field_Guide/13_Animation_Foot_Slide_or_State_Fight"
title: "Animation foot slide / state fighting"
tags: [roblox, legendary, lab, "cluster/animation"]
verified: 2026-10-25
cssclasses: [tg-a06]
---

# Animation foot slide / state fighting

## Symptoms
- walk cycle slides.
- attack interrupted strangely.
- two tracks compete.

## Likely causes
- animation speed mismatched to movement.
- priority/state ownership unclear.
- multiple scripts load same action.
- markers ignored.

## Investigation order
1. Reproduce with exact steps and build/device/server conditions.
2. Capture logs/state/profiler evidence before changing code.
3. Disable or isolate one subsystem at a time.
4. Identify the owner layer: client presentation, server game state, network, data, physics, streaming, asset or device input.
5. Make the smallest root-cause fix.
6. Re-run the original reproduction plus edge cases.

## Fix directions
- log state and active tracks.
- match locomotion speed to motion.
- centralize action state.
- use markers for timed presentation.
- test interruption rules.

## Do not do this
- Do not add random `task.wait()` calls just because timing looks suspicious.
- Do not rewrite the entire framework before proving the failing owner.
- Do not call something “optimized” because the code is shorter.
- Do not remove security validation to make a test pass.

## Regression evidence
Record what changed, why it fixed the root cause, and a test that would fail if the bug returns.

## Knowledge graph connections
**Primary cluster:** [[Animation - Hub|Animation]]

**Related:** [[Debugging Playbook]]
