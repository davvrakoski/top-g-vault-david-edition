---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
source_note: "25_Legendary_Production_Layer/13_VFX_Framework"
title: "VFX Framework"
tags: ["roblox", "legendary", "production", "cluster/vfx"]
verified: 2026-10-25
cssclasses: [tg-a11]
---

# VFX Framework

## Mission
A reusable client-side presentation system for hits, powers, explosions, trails, weather and environmental effects.

## Architecture / ownership
- Effect ID + payload.
- effect registry.
- attachment/position targeting.
- pooling for hot paths.
- quality tier.
- distance culling.
- lifetime cleanup.

## Recommended build order
1. Author one effect as layers: anticipation, peak, decay, residue.
2. use server event only for gameplay-confirmed outcome.
3. client chooses quality variant.
4. pool expensive/repeated emitters.
5. cap decals and persistent residue.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **One giant emitter doing everything**.
- **Server clones/tweens every cosmetic part**.
- **Unbounded debris**.
- **Particle count used to compensate for weak timing**.
- **No accessibility settings for intense flashes/shake**.

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
- [ ] spam effect 100x.
- [ ] view at minimum graphics.
- [ ] view from far distance.
- [ ] target destroyed mid-effect.
- [ ] two effects overlap on same attachment.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[VFX - Hub|VFX]]

**Related:** [[Legendary Production Hub]]
