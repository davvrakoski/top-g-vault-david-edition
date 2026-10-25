---
area: "05 Performance and Optimization"
cluster: "Performance"
source_note: "25_Legendary_Production_Layer/23_Performance_Engineering_Operating_System"
title: "Performance Engineering Operating System"
tags: ["roblox", "legendary", "production", "cluster/performance"]
verified: 2026-10-25
cssclasses: [tg-a05]
---

# Performance Engineering Operating System

## Mission
A measurement-first process for frame time, memory, networking, physics, join time and server capacity.

## Architecture / ownership
- benchmark scene/route.
- MicroProfiler capture.
- Script Profiler.
- memory snapshots.
- network traffic observations.
- server heartbeat/CPU.
- quality tiers.

## Recommended build order
1. Reproduce worst case.
2. identify CPU/GPU/memory/network bottleneck.
3. remove work before micro-optimizing.
4. lower update frequency.
5. sleep distant systems.
6. stream large worlds.
7. client-render cosmetics.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **Optimizing polygon count while script CPU is bottleneck**.
- **Per-frame table scans**.
- **Remote spam**.
- **Preloading whole world**.
- **Server creating visual-only effects**.
- **Unbounded particles/lights**.

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
- [ ] 10-minute mobile thermal run.
- [ ] maximum NPC encounter.
- [ ] maximum player count target.
- [ ] teleport/streaming stress.
- [ ] long-session memory growth.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[Performance - Hub|Performance]]

**Related:** [[Legendary Production Hub]]
