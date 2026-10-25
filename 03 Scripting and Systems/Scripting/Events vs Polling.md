---
area: "03 Scripting and Systems"
cluster: "Scripting"
source_note: "18_Advanced_Architecture/02_Event_vs_Polling"
title: "Events vs Polling"
tags: [roblox, premium, "cluster/scripting"]
verified: 2026-10-25
cssclasses: [tg-a03]
---

# Events vs Polling

Prefer event-driven work when the question is "did something change?"

Bad:
```luau
RunService.Heartbeat:Connect(function()
    if player:GetAttribute("Coins") ~= oldCoins then ... end
end)
```

Better:
```luau
player:GetAttributeChangedSignal("Coins"):Connect(function()
    -- update only when value changes
end)
```

Polling is valid when the quantity truly changes continuously or there is no useful event. Even then, consider a lower update rate than every frame.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Scripting - Hub]]

**Related notes:** [[Cooldown Module]] · [[Service and Controller Boundaries]] · [[Weighted Random Selection]] · [[Cleanup Bag Pattern]]

<!-- TDOD_GRAPH_END -->
