---
area: "09 Maps and Worlds"
cluster: "Maps"
source_note: "25_Legendary_Production_Layer/17_Large_World_Streaming_Architecture"
title: "Large World Streaming Architecture"
tags: ["roblox", "legendary", "production", "cluster/maps"]
verified: 2026-10-25
cssclasses: [tg-a09]
---

# Large World Streaming Architecture

## Mission
A world layout and code strategy that remains correct when clients only have nearby content loaded.

## Architecture / ownership
- district/cell ownership.
- stream-safe references.
- server-only asset storage.
- spawn/loading handshake.
- POI state independent of client presence.
- AI activation zones.
- LOD/persistence rules.

## Recommended build order
1. Enable streaming early.
2. replace global Workspace assumptions.
3. use tags/IDs rather than hard references where suitable.
4. keep ReplicatedStorage lean.
5. load content in chunks.
6. test fast travel and high-speed vehicles.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **WaitForChild on a streamed object that may never be local**.
- **Client searching entire Workspace for gameplay truth**.
- **Persistent models overused**.
- **All interiors replicated at join**.
- **NPC logic tied to visible render model**.

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
- [ ] fast vehicle across world.
- [ ] teleport to distant district.
- [ ] respawn far away.
- [ ] multiple players in different zones.
- [ ] object streams out during UI interaction.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[Maps - Hub|Maps]]

**Related:** [[Legendary Production Hub]]
