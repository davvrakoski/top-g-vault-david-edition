---
area: "06 Characters and Animation"
cluster: "Animation"
source_note: "25_Legendary_Production_Layer/16_Character_Animation_Framework"
title: "Character Animation Framework"
tags: ["roblox", "legendary", "production", "cluster/animation"]
verified: 2026-10-25
cssclasses: [tg-a06]
---

# Character Animation Framework

## Mission
A character presentation stack for locomotion, actions, IK, reactions, ragdolls and customization.

## Architecture / ownership
- gameplay state.
- animation state/priority.
- marker events.
- IK/procedural offsets.
- equipment pose set.
- reaction layer.
- ragdoll transition.
- customization attachments.

## Recommended build order
1. Establish rig contract.
2. build locomotion first.
3. sync gameplay windows to markers but keep server authority.
4. separate additive reactions from full-body actions.
5. test extreme body/clothing poses.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **Two scripts fighting animator**.
- **Footsteps timed by task.wait instead of markers**.
- **Ragdoll joints not restored**.
- **Weapon pose incompatible with sprint**.
- **Clothes clip only in extreme animations**.

## Performance and scale pass
- Identify what runs per-frame, per-player, per-NPC, per-instance, per-transaction, and only-on-change. The multiplicative category is usually the risk.
- Add distance, visibility, sleep, batching, caching, pooling, streaming, or lower-frequency updates only where they preserve correctness.
- Keep cosmetic work on clients when the server only needs the gameplay result.
- Profile the worst realistic scenario, not an empty test place.

## Security and data pass
- Treat client payloads as requests, not truth.
- Validate types, ranges, ownership, state, permissions, rate, and duplicate/replay behavior when relevant.
- For persistent or paid outcomes, design the operation so retrying it does not duplicate rewards.

## Test gates
- [ ] attack interrupted.
- [ ] weapon swap mid-animation.
- [ ] ragdoll on stairs.
- [ ] respawn while animation loaded.
- [ ] different avatar scales.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[Animation - Hub|Animation]]

**Related:** [[Legendary Production Hub]]
