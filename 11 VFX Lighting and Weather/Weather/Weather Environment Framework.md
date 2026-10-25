---
area: "11 VFX Lighting and Weather"
cluster: "Weather"
source_note: "25_Legendary_Production_Layer/12_Weather_Environment_Framework"
title: "Weather Environment Framework"
tags: ["roblox", "legendary", "production", "cluster/weather"]
verified: 2026-10-25
cssclasses: [tg-a11]
---

# Weather Environment Framework

## Mission
A state-driven environment system for clear, rain, storms, fog, snow, wind and day/night presentation.

## Architecture / ownership
- WeatherState.
- transition timeline.
- Lighting/Atmosphere/Cloud controls.
- local precipitation volume.
- audio layer.
- surface response.
- gameplay modifiers kept separate from cosmetics.

## Recommended build order
1. Define visual states.
2. interpolate properties instead of snapping.
3. localize rain/snow near relevant cameras.
4. detect interiors conservatively.
5. delay thunder by strike distance for feel.
6. build low/medium/high effect tiers.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **World-sized rain emitters**.
- **Hundreds of raycasts per frame per player**.
- **Rapid lightning flashes without accessibility control**.
- **Weather changing gameplay silently**.
- **Server creating all cosmetic droplets**.

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
- [ ] enter building during storm.
- [ ] teleport biome.
- [ ] low graphics/device tier.
- [ ] multiple weather transitions queued.
- [ ] respawn mid-storm.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[Weather - Hub|Weather]]

**Related:** [[Legendary Production Hub]]
