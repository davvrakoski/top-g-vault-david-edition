---
area: "03 Scripting and Systems"
cluster: "Scripting"
source_note: "15_Code_Patterns/02_Weighted_Random"
title: "Weighted Random Selection"
tags: [roblox, premium, "cluster/scripting"]
verified: 2026-10-25
cssclasses: [tg-a03]
---

# Weighted Random Selection

```luau
--!strict
local function chooseWeighted<T>(items: {{value: T, weight: number}}, rng: Random?): T?
    local random = rng or Random.new()
    local total = 0
    for _, item in items do
        if item.weight > 0 then
            total += item.weight
        end
    end
    if total <= 0 then return nil end

    local roll = random:NextNumber(0, total)
    local running = 0
    for _, item in items do
        if item.weight > 0 then
            running += item.weight
            if roll <= running then return item.value end
        end
    end
    return items[#items].value
end
```

Weighted loot should also consider pity/fairness/economy design, not only probability math.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Scripting - Hub]]

**Related notes:** [[Service and Controller Boundaries]] · [[Events vs Polling]] · [[Cleanup Bag Pattern]] · [[Luau Programming]]

<!-- TDOD_GRAPH_END -->
