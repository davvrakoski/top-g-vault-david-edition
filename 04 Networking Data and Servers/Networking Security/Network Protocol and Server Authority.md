---
area: "04 Networking Data and Servers"
cluster: "Networking Security"
source_note: "25_Legendary_Production_Layer/04_Network_Protocol_and_Server_Authority"
title: "Network Protocol and Server Authority"
tags: ["roblox", "legendary", "production", "cluster/networking-security"]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# Network Protocol and Server Authority

## Mission
A deliberate protocol for remotes, prediction, validation and reconciliation instead of ad-hoc RemoteEvents.

## Architecture / ownership
- Request names and payload schemas.
- server validation and rate limits.
- sequence IDs/nonces where duplicate processing matters.
- client prediction for feel.
- authoritative correction for important outcomes.

## Recommended build order
1. Document every remote.
2. validate type/range/state/ownership/distance/cooldown.
3. send deltas or events instead of full state every frame.
4. make cosmetic VFX local when server only needs outcome data.
5. log abusive patterns without treating latency as cheating.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **Trusting hit target supplied by client**.
- **Remote spam**.
- **Server tweens cosmetic objects**.
- **Touched used as unvalidated damage truth**.
- **Reliable remote used for disposable high-frequency presentation**.

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
- [ ] fuzz every remote with wrong types.
- [ ] replay the same purchase/action request.
- [ ] simulate latency and duplicate packets conceptually.
- [ ] attempt impossible distance/cooldown actions.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[Networking Security - Hub|Networking Security]]

**Related:** [[Legendary Production Hub]]
