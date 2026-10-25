---
area: "03 Scripting and Systems"
cluster: "Scripting"
source_note: "25_Legendary_Production_Layer/01_Service_Controller_Reference_Architecture"
title: "Service Controller Reference Architecture"
tags: ["roblox", "legendary", "production", "cluster/architecture"]
verified: 2026-10-25
cssclasses: [tg-a03]
---

# Service Controller Reference Architecture

## Mission
A maintainable split between server services, client controllers, shared definitions and presentation.

## Architecture / ownership
- ServerScriptService/Services owns authoritative gameplay and cloud calls.
- StarterPlayerScripts/Controllers owns input, camera and local presentation.
- ReplicatedStorage/Shared contains types, immutable configs and pure utilities.
- Remote endpoints are defined centrally instead of scattered through gameplay scripts.

## Recommended build order
1. Build one vertical slice before making a framework package.
2. Create clear module ownership: one system owns one kind of state.
3. Expose narrow APIs; avoid reaching into another service’s internal tables.
4. Initialize dependencies in a deterministic bootstrap phase.
5. Add logging and cleanup paths before scaling content.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **Circular module dependencies**.
- **God services with unrelated responsibilities**.
- **Shared modules that secretly mutate server state**.
- **Automatic magic that makes call flow impossible to trace**.

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
- [ ] Can a new developer locate the owner of inventory, damage, saving and input in under two minutes?.
- [ ] Can each service be tested with a minimal harness?.
- [ ] Can a controller be removed without breaking server truth?.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[Scripting - Hub|Scripting]]

**Related:** [[Legendary Production Hub]]
