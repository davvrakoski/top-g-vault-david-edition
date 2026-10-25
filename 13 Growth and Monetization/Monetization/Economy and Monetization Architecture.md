---
area: "13 Growth and Monetization"
cluster: "Monetization"
source_note: "25_Legendary_Production_Layer/19_Economy_and_Monetization_Architecture"
title: "Economy and Monetization Architecture"
tags: ["roblox", "legendary", "production", "cluster/monetization"]
verified: 2026-10-25
cssclasses: [tg-a13]
---

# Economy and Monetization Architecture

## Mission
A player-trust-first economy tying sources, sinks, pricing, purchases, regional pricing and analytics together.

## Architecture / ownership
- soft/hard currency definitions.
- source/sink ledger.
- catalog.
- purchase entitlement/receipt handler.
- price display adapter.
- economy analytics.
- fraud/dupe protections.

## Recommended build order
1. Model the economy before selling boosts.
2. make purchases idempotent.
3. query/display runtime product pricing where needed.
4. track sources/sinks.
5. separate monetization from core save mutation through transaction APIs.
6. design value before popups.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **Hardcoded price text conflicting with managed/regional pricing**.
- **Receipt granted twice**.
- **Infinite currency source**.
- **Trade arbitrage ignored**.
- **Paywall before player understands game**.

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
- [ ] duplicate receipt callback.
- [ ] regional price UI.
- [ ] refund/entitlement change where applicable.
- [ ] full inventory purchase.
- [ ] server crash during grant.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[Monetization - Hub|Monetization]]

**Related:** [[Legendary Production Hub]]
