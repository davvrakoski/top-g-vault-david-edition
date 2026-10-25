---
area: "12 UI Audio and Camera"
cluster: "Audio"
source_note: "25_Legendary_Production_Layer/15_Audio_Framework"
title: "Audio Framework"
tags: ["roblox", "legendary", "production", "cluster/audio"]
verified: 2026-10-25
cssclasses: [tg-a12]
---

# Audio Framework

## Mission
A layered audio architecture for music, ambience, combat, UI, dialogue, vehicles and weather.

## Architecture / ownership
- mix groups.
- spatial world emitters.
- music state machine.
- surface-based footsteps.
- voice/dialogue ducking.
- occlusion/zone logic.
- priority/concurrency rules.

## Recommended build order
1. Create category loudness targets.
2. randomize variants carefully.
3. use animation markers for footsteps.
4. crossfade music states.
5. limit repeated impact spam.
6. test with effects/music/voice independently muted.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **Every sound same loudness**.
- **Identical footstep repeated**.
- **Music restarted on every state flip**.
- **3D sounds heard through entire map**.
- **No subtitle/voice controls**.

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
- [ ] combat + storm + dialogue simultaneously.
- [ ] rapid automatic weapon.
- [ ] indoors/outdoors transition.
- [ ] spectator camera.
- [ ] low-volume device.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[Audio - Hub|Audio]]

**Related:** [[Legendary Production Hub]]
