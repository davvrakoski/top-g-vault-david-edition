---
area: "04 Networking Data and Servers"
cluster: "Data Backend"
source_note: "25_Legendary_Production_Layer/05_Persistence_Transactions_and_Migrations"
title: "Persistence Transactions and Migrations"
tags: ["roblox", "legendary", "production", "cluster/data-backend"]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# Persistence Transactions and Migrations

## Mission
Durable player state that survives schema changes, purchase retries, server crashes and concurrent updates.

## Architecture / ownership
- Version field on save document.
- default schema.
- migration chain.
- atomic or idempotent transaction design.
- session/load guards.
- separate persistent from ephemeral state.

## Recommended build order
1. Load and validate.
2. migrate old versions.
3. work on server-owned in-memory profile.
4. checkpoint intelligently.
5. save on important transitions and shutdown opportunities.
6. record purchase receipts/transaction IDs when idempotency matters.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **Overwriting production data from Studio**.
- **Saving every frame**.
- **Assuming PlayerRemoving is the only save**.
- **Changing item IDs without migration**.
- **Granting purchases before durable receipt handling**.

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
- [ ] load empty/new profile.
- [ ] load every old schema fixture.
- [ ] simulate failed write.
- [ ] process same purchase receipt twice.
- [ ] server crash during transaction.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[Data Backend - Hub|Data Backend]]

**Related:** [[Legendary Production Hub]]
