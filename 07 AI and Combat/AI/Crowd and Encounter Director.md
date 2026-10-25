---
area: "07 AI and Combat"
cluster: "AI"
source_note: "25_Legendary_Production_Layer/10_Crowd_and_Encounter_Director"
title: "Crowd and Encounter Director"
tags: ["roblox", "legendary", "production", "cluster/ai"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# Crowd and Encounter Director

## Mission
Global population and pacing control for horde games, survival, tower defense and open-world encounters.

## Architecture / ownership
- zone population target.
- spawn/despawn/recycle budget.
- visibility and distance rules.
- difficulty pressure.
- active-combat cap.
- spawn candidate cache.

## Recommended build order
1. Separate director from individual brains.
2. spawn in small batches.
3. avoid visible pop-in.
4. pool or recycle when useful.
5. degrade AI detail with distance.
6. use encounter envelopes so difficulty can recover.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **All NPCs decide global population independently**.
- **Spawning behind the camera but directly visible in mirrors/open space**.
- **Mass spawn spikes**.
- **Never reducing population after players move**.

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
- [ ] sprint through zones.
- [ ] teleport players.
- [ ] all players split apart.
- [ ] server at NPC cap.
- [ ] large combat VFX spike while spawn director active.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[AI - Hub|AI]]

**Related:** [[Legendary Production Hub]]
