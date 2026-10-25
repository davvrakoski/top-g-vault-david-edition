---
area: "07 AI and Combat"
cluster: "Combat"
source_note: "25_Legendary_Production_Layer/07_Combat_Framework"
title: "Combat Framework"
tags: ["roblox", "legendary", "production", "cluster/combat"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# Combat Framework

## Mission
A combat spine that supports melee, ranged, abilities, status effects, hit reactions and different weapon animation sets.

## Architecture / ownership
- Input intent.
- local anticipation/prediction.
- server action gate.
- hit query/validation.
- damage resolver.
- reaction/status.
- presentation event.

## Recommended build order
1. Define combat state machine.
2. authoritative cooldown/resource checks.
3. choose hit test per weapon.
4. separate damage formula from animation.
5. add hit feedback after correctness.
6. instrument latency and invalid request counts.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **Damage tied to animation length rather than marker/window**.
- **Touched-only melee**.
- **Client sends damage number**.
- **Multiple systems applying knockback differently**.
- **Camera/VFX hiding unclear hit timing**.

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
- [ ] attack during stun/death.
- [ ] high latency combo.
- [ ] multiple targets in one swing.
- [ ] target disappears mid-action.
- [ ] friendly fire rules.
- [ ] wall/line-of-sight cases.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[Combat - Hub|Combat]]

**Related:** [[Legendary Production Hub]]
