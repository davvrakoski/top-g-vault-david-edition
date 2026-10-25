---
area: "05 Performance and Optimization"
cluster: "Performance"
source_note: "26_Practical_Luau_Library/12_Quality_Tier_Settings"
title: "Quality Tier Settings"
tags: ["roblox", "legendary", "production", "cluster/performance"]
verified: 2026-10-25
cssclasses: [tg-a05]
---

# Quality Tier Settings

Design degradation intentionally instead of waiting for the engine/player to suffer.

```lua
local tiers = {
    Low = {Particles=0.35, DynamicLights=false, Foliage=0.45, Debris=0.25},
    Medium = {Particles=0.65, DynamicLights=true, Foliage=0.70, Debris=0.60},
    High = {Particles=1.00, DynamicLights=true, Foliage=1.00, Debris=1.00},
}
```

Never degrade information required to play: enemy telegraphs, interact prompts, objective markers or accessibility signals. Prefer reducing decorative density, shadows, secondary wisps, distant vegetation and debris.

## Test checklist
- [ ] Normal input works.
- [ ] Invalid/malformed input fails safely.
- [ ] Cleanup path is tested.
- [ ] Performance impact is measured if this runs frequently.
- [ ] The example is adapted to the project rather than pasted blindly.

## Knowledge graph connections

**Primary cluster:** [[Performance - Hub|Performance]]

**Related:** [[Practical Luau Pattern Library]]
