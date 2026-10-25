---
area: "07 AI and Combat"
cluster: "Combat"
source_note: "25_Legendary_Production_Layer/08_Ability_and_Status_Framework"
title: "Ability and Status Framework"
tags: ["roblox", "legendary", "production", "cluster/combat"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# Ability and Status Framework

## Mission
A data-driven system for cooldown abilities, buffs, debuffs, damage-over-time and elemental states.

## Architecture / ownership
- Ability definition.
- activation requirements.
- resource/cooldown state.
- server executor.
- status container.
- stack/refresh/replace policy.
- presentation tags.

## Recommended build order
1. Write status stacking rules first.
2. make duration server-time based.
3. centralize immunity/resistance.
4. use IDs instead of storing function closures in save data.
5. replicate only presentation-relevant status.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **Multiple burn loops per target**.
- **Status never cleaned on death**.
- **Client deciding cooldown complete**.
- **Unbounded stack count**.
- **Effect-specific hacks inside character scripts**.

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
- [ ] apply same status repeatedly.
- [ ] cleanse during tick.
- [ ] death/respawn.
- [ ] network delay.
- [ ] resistance/immunity.
- [ ] stack cap and refresh behavior.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[Combat - Hub|Combat]]

**Related:** [[Legendary Production Hub]]
