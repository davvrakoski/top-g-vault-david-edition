---
area: "14 Testing and QA"
cluster: "Testing"
source_note: "25_Legendary_Production_Layer/22_Testing_and_QA_Operating_System"
title: "Testing and QA Operating System"
tags: ["roblox", "legendary", "production", "cluster/testing"]
verified: 2026-10-25
cssclasses: [tg-a14]
---

# Testing and QA Operating System

## Mission
A practical testing system that covers functionality, regression, devices, network conditions, saves and production incidents.

## Architecture / ownership
- acceptance criteria.
- unit/pure-function tests where valuable.
- integration harness.
- multiplayer test.
- device matrix.
- performance benchmark.
- release smoke test.

## Recommended build order
1. Write test before risky refactor.
2. keep reproduction steps exact.
3. build fixtures for old save schemas.
4. test exploit payloads.
5. test full/empty inventories.
6. record build/version/device.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **“works on my PC”**.
- **Only solo Studio tests**.
- **No regression after bug fix**.
- **No production-like data fixtures**.
- **Manual test steps that change every run**.

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
- [ ] new user.
- [ ] returning user.
- [ ] disconnect during transaction.
- [ ] high latency.
- [ ] server full.
- [ ] low memory device.
- [ ] controller-only navigation.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[Testing - Hub|Testing]]

**Related:** [[Legendary Production Hub]]
