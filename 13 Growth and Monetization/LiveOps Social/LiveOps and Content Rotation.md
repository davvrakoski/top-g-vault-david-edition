---
area: "13 Growth and Monetization"
cluster: "LiveOps Social"
source_note: "25_Legendary_Production_Layer/21_LiveOps_and_Content_Rotation"
title: "LiveOps and Content Rotation"
tags: ["roblox", "legendary", "production", "cluster/liveops-social"]
verified: 2026-10-25
cssclasses: [tg-a13]
---

# LiveOps and Content Rotation

## Mission
Operating a game after launch through events, rotations, configuration, rollback and community communication.

## Architecture / ownership
- release calendar.
- feature flags/configs.
- content rotations.
- event state.
- reward claims.
- telemetry.
- rollback plan.
- community announcement.

## Recommended build order
1. Ship small reversible changes.
2. separate content data from executable code.
3. stage risky features.
4. define event start/end in server time.
5. keep expired content data migration-safe.
6. write postmortem.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **Event requires emergency code edit to stop**.
- **Local client clock controls rewards**.
- **Rotated item deleted from saved inventories**.
- **No fallback when external dependency fails**.

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
- [ ] event begins while servers are old version.
- [ ] player joins during rollover.
- [ ] reward claimed twice.
- [ ] rollback after schema change.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[LiveOps Social - Hub|LiveOps Social]]

**Related:** [[Legendary Production Hub]]
