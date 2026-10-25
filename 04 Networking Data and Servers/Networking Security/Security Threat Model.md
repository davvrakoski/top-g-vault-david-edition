---
area: "04 Networking Data and Servers"
cluster: "Networking Security"
source_note: "25_Legendary_Production_Layer/24_Security_Threat_Model"
title: "Security Threat Model"
tags: ["roblox", "legendary", "production", "cluster/networking-security"]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# Security Threat Model

## Mission
A repeatable abuse analysis for remotes, physics, saving, purchases, trading, admin tools and external services.

## Architecture / ownership
- assets worth protecting.
- trust boundaries.
- remote/API surface.
- abuse cases.
- validation rules.
- rate limits.
- audit logs.
- recovery/reversal plan.

## Recommended build order
1. Assume client is hostile.
2. validate semantic state not only types.
3. treat network-owned physics as untrusted for critical outcomes.
4. make transactions idempotent.
5. protect secrets in supported secret storage.
6. least privilege for external tooling.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **Security by obscure remote name**.
- **Client-side anti-cheat treated as authority**.
- **Admin command exposed through generic remote**.
- **Trade without transaction lock**.
- **API key committed to repository**.

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
- [ ] fuzz remote values.
- [ ] replay old request.
- [ ] NaN/Inf where physics/numbers matter.
- [ ] race two transactions.
- [ ] spoof impossible location/ownership.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[Networking Security - Hub|Networking Security]]

**Related:** [[Legendary Production Hub]]
