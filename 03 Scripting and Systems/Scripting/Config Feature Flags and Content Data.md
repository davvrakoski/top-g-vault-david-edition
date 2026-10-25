---
area: "03 Scripting and Systems"
cluster: "Scripting"
source_note: "25_Legendary_Production_Layer/03_Config_Feature_Flags_and_Content_Data"
title: "Config Feature Flags and Content Data"
tags: ["roblox", "legendary", "production", "cluster/architecture"]
verified: 2026-10-25
cssclasses: [tg-a03]
---

# Config Feature Flags and Content Data

## Mission
Separating tunable content from executable code so balancing and live changes do not require rewriting logic.

## Architecture / ownership
- Immutable weapon/enemy/item definitions.
- feature flags for staged rollouts.
- environment/game-mode configuration.
- server-owned truth with client-readable presentation copies.
- versioned config schema.

## Recommended build order
1. Define schemas/types.
2. load config before dependent services.
3. validate IDs at startup.
4. treat missing definitions as explicit errors.
5. use flags to disable risky new systems quickly.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **Duplicated magic numbers**.
- **Client-supplied prices/damage**.
- **Renaming IDs without migrations**.
- **Configuration with arbitrary executable code**.

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
- [ ] Start server with a missing ID.
- [ ] flip a feature off while code remains deployed.
- [ ] load old save data referencing retired content.
- [ ] compare config across test and production.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[Scripting - Hub|Scripting]]

**Related:** [[Legendary Production Hub]]
