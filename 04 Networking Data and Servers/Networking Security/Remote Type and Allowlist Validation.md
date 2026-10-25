---
area: "04 Networking Data and Servers"
cluster: "Networking Security"
source_note: "15_Code_Patterns/05_Remote_Type_Validation"
title: "Remote Type and Allowlist Validation"
tags: [roblox, premium, "cluster/networking-security"]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# Remote Type and Allowlist Validation

```luau
local ValidActions = {
    Equip = true,
    Drop = true,
    Use = true,
}

Remote.OnServerEvent:Connect(function(player, action, itemId)
    if typeof(action) ~= "string" then return end
    if typeof(itemId) ~= "string" then return end
    if not ValidActions[action] then return end
    if #itemId > 80 then return end

    -- Look up the item from server-owned inventory.
    -- Never trust the client's item properties.
end)
```

Validate shape, bounds, and semantics. Type checks alone do not make a remote secure.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Networking Security - Hub]]

**Related notes:** [[Remote Rate Limiting Pattern]] · [[MCP Security and Setup Principles]] · [[Security and Anti-exploit Design]] · [[Trading and Duplication Threat Model]]

<!-- TDOD_GRAPH_END -->
