---
area: "02 Game Design and Economy"
cluster: "Inventory Economy"
source_note: "26_Practical_Luau_Library/15_Weighted_Loot_Table"
title: "Weighted Loot Table"
tags: ["roblox", "legendary", "production", "cluster/inventory-economy"]
verified: 2026-10-25
cssclasses: [tg-a02]
---

# Weighted Loot Table

Use explicit weights and test the distribution.

```lua
local function choose(entries, rng)
    local total=0
    for _,e in entries do total += e.weight end
    local roll=rng:NextNumber(0,total)
    local acc=0
    for _,e in entries do
        acc += e.weight
        if roll <= acc then return e.id end
    end
    return entries[#entries].id
end
```

For rare rewards, also design player experience: pity/bad-luck protection, duplicate conversion and transparent rules may matter more than pure probability math.

## Test checklist
- [ ] Normal input works.
- [ ] Invalid/malformed input fails safely.
- [ ] Cleanup path is tested.
- [ ] Performance impact is measured if this runs frequently.
- [ ] The example is adapted to the project rather than pasted blindly.

## Knowledge graph connections

**Primary cluster:** [[Inventory Economy - Hub|Inventory Economy]]

**Related:** [[Practical Luau Pattern Library]]
