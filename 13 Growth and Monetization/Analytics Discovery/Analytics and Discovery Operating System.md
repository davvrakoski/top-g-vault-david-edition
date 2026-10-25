---
area: "13 Growth and Monetization"
cluster: "Analytics Discovery"
source_note: "25_Legendary_Production_Layer/20_Analytics_and_Discovery_Operating_System"
title: "Analytics and Discovery Operating System"
tags: ["roblox", "legendary", "production", "cluster/analytics-discovery"]
verified: 2026-10-25
cssclasses: [tg-a13]
---

# Analytics and Discovery Operating System

## Mission
A measurement loop connecting onboarding, retention, play quality, economy and discovery decisions.

## Architecture / ownership
- event taxonomy.
- onboarding/progression/shop funnels.
- economy source/sink events.
- custom behavior events.
- release annotations.
- weekly decision review.

## Recommended build order
1. Choose questions before events.
2. keep event names stable and use fields for dimensions.
3. log from server where Roblox requires.
4. compare cohorts after releases.
5. fix bounce/onboarding before buying traffic.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **Tracking everything with no decision attached**.
- **Renaming events every release**.
- **Client-only analytics truth**.
- **Optimizing thumbnail clicks while first-play bounce is terrible**.

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
- [ ] verify event fires once.
- [ ] dashboard delay expectations documented.
- [ ] new/returning player funnels.
- [ ] A/B thumbnail interpretation uses downstream quality not only CTR.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[Analytics Discovery - Hub|Analytics Discovery]]

**Related:** [[Legendary Production Hub]]
