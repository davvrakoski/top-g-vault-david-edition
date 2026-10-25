---
area: "07 AI and Combat"
cluster: "Combat"
source_note: "26_Practical_Luau_Library/08_Status_Effect_Container"
title: "Status Effect Container"
tags: ["roblox", "legendary", "production", "cluster/combat"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# Status Effect Container

Store statuses as data with explicit stacking rules.

```lua
-- Conceptual state
statuses[targetId] = {
    Burning = {expiresAt = 120.5, stacks = 2},
    Slowed = {expiresAt = 118.0, magnitude = 0.35},
}
```

Define per status: duration, max stacks, refresh policy, tick interval, immunity tags, cleanse category and presentation ID. Run status ticking from a central scheduler rather than spawning one endless coroutine per effect.

## Test checklist
- [ ] Normal input works.
- [ ] Invalid/malformed input fails safely.
- [ ] Cleanup path is tested.
- [ ] Performance impact is measured if this runs frequently.
- [ ] The example is adapted to the project rather than pasted blindly.

## Knowledge graph connections

**Primary cluster:** [[Combat - Hub|Combat]]

**Related:** [[Practical Luau Pattern Library]]
