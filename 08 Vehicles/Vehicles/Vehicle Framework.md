---
area: "08 Vehicles"
cluster: "Vehicles"
source_note: "25_Legendary_Production_Layer/11_Vehicle_Framework"
title: "Vehicle Framework"
tags: ["roblox", "legendary", "production", "cluster/vehicles"]
verified: 2026-10-25
cssclasses: [tg-a08]
---

# Vehicle Framework

## Mission
A modular vehicle architecture covering input, chassis, seats, camera, surface response, network ownership, damage and recovery.

## Architecture / ownership
- vehicle definition.
- driver authority/input.
- physics/chassis controller.
- seat/occupant service.
- camera controller.
- damage/impact.
- surface VFX/audio.
- reset/recovery.

## Recommended build order
1. Prototype one vehicle.
2. establish ownership strategy.
3. tune suspension/grip with repeatable course.
4. server-validate gameplay impacts.
5. keep dust/skid presentation local.
6. support keyboard/gamepad/touch.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **Passenger owning whole physics assembly unexpectedly**.
- **Touched dealing repeated damage every frame**.
- **Camera coupled to chassis implementation**.
- **Mud particles replicated from server**.
- **No upside-down recovery**.

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
- [ ] driver/passenger handoff.
- [ ] high ping.
- [ ] vehicle hits player.
- [ ] vehicle flips.
- [ ] streaming boundary.
- [ ] surface changes pavement→dirt→water.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[Vehicles - Hub|Vehicles]]

**Related:** [[Legendary Production Hub]]
