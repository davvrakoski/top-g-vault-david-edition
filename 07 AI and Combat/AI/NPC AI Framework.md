---
area: "07 AI and Combat"
cluster: "AI"
source_note: "25_Legendary_Production_Layer/09_NPC_AI_Framework"
title: "NPC AI Framework"
tags: ["roblox", "legendary", "production", "cluster/ai"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# NPC AI Framework

## Mission
A scalable perception→decision→navigation→action architecture for enemies, civilians, companions and bosses.

## Architecture / ownership
- Perception sensors.
- memory/blackboard.
- decision state.
- navigation adapter.
- action executor.
- animation/presentation.
- sleep/LOD tier.

## Recommended build order
1. Start with deterministic states.
2. separate hearing events from constant polling.
3. path only when needed.
4. stagger brain ticks.
5. direct-move when valid.
6. record last-seen/heard positions.
7. build stuck recovery.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **Every NPC raycasts/pathfinds every frame**.
- **Path recomputed when target moves one stud**.
- **Animations drive game truth**.
- **No timeout on stuck state**.
- **Distant NPCs fully simulated**.

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
- [ ] blocked path.
- [ ] target teleports.
- [ ] target streams out on client.
- [ ] many NPCs acquire one player.
- [ ] door closes mid-path.
- [ ] player leaves server.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[AI - Hub|AI]]

**Related:** [[Legendary Production Hub]]
