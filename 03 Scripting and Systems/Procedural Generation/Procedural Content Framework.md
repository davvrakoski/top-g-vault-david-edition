---
area: "03 Scripting and Systems"
cluster: "Procedural Generation"
source_note: "25_Legendary_Production_Layer/18_Procedural_Content_Framework"
title: "Procedural Content Framework"
tags: ["roblox", "legendary", "production", "cluster/procedural-generation"]
verified: 2026-10-25
cssclasses: [tg-a03]
---

# Procedural Content Framework

## Mission
Deterministic procedural rooms, biomes, loot and encounters without turning the game into untestable randomness.

## Architecture / ownership
- seed.
- generator version.
- rule set.
- content catalog.
- constraint solver.
- validation pass.
- save only seed + player changes where appropriate.

## Recommended build order
1. Separate generation from decoration.
2. make seed reproducible.
3. add hard constraints before random choice.
4. validate reachability.
5. record generator version for migrations.
6. provide hand-authored escape hatches.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **Random placement without collision/reachability checks**.
- **Changing algorithm breaks old seeds**.
- **Procedural content ignores streaming budgets**.
- **Loot rolled differently client/server**.

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
- [ ] same seed repeated.
- [ ] minimum/maximum room counts.
- [ ] blocked critical path.
- [ ] generator update with old save.
- [ ] performance worst-case seed.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[Procedural Generation - Hub|Procedural Generation]]

**Related:** [[Legendary Production Hub]]
