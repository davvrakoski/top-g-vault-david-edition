---
area: "07 AI and Combat"
cluster: "AI"
source_note: "26_Practical_Luau_Library/13_NPC_Tick_Budgeter"
title: "NPC Tick Budgeter"
tags: ["roblox", "legendary", "production", "cluster/ai"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# NPC Tick Budgeter

Give nearby/engaged NPCs more thinking time and distant NPCs less.

```lua
local function desiredHz(distance, inCombat)
    if inCombat or distance < 60 then return 15 end
    if distance < 160 then return 5 end
    if distance < 300 then return 2 end
    return 0.5
end
```

These numbers are examples, not universal budgets. Combine with staggered update phases so 100 NPCs do not all sense/path on the same frame.

## Test checklist
- [ ] Normal input works.
- [ ] Invalid/malformed input fails safely.
- [ ] Cleanup path is tested.
- [ ] Performance impact is measured if this runs frequently.
- [ ] The example is adapted to the project rather than pasted blindly.

## Knowledge graph connections

**Primary cluster:** [[AI - Hub|AI]]

**Related:** [[Practical Luau Pattern Library]]
