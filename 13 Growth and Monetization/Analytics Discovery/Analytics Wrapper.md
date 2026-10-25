---
area: "13 Growth and Monetization"
cluster: "Analytics Discovery"
source_note: "26_Practical_Luau_Library/11_Analytics_Wrapper"
title: "Analytics Wrapper"
tags: ["roblox", "legendary", "production", "cluster/analytics-discovery"]
verified: 2026-10-25
cssclasses: [tg-a13]
---

# Analytics Wrapper

Centralize analytics names so typos do not create fragmented dashboards.

```lua
local Analytics = {}

local allowed = {
    TutorialStep = true,
    BossDefeated = true,
    ItemCrafted = true,
}

function Analytics:Log(name, player, fields)
    assert(allowed[name], "unknown event")
    -- Call the appropriate AnalyticsService event API here.
    -- Keep Roblox-specific API use in one module so limits/schema changes are easy to update.
end

return Analytics
```

Decide the product question first. Avoid logging thousands of unique event names when a stable event plus custom fields answers the question better.

## Test checklist
- [ ] Normal input works.
- [ ] Invalid/malformed input fails safely.
- [ ] Cleanup path is tested.
- [ ] Performance impact is measured if this runs frequently.
- [ ] The example is adapted to the project rather than pasted blindly.

## Knowledge graph connections

**Primary cluster:** [[Analytics Discovery - Hub|Analytics Discovery]]

**Related:** [[Practical Luau Pattern Library]]
