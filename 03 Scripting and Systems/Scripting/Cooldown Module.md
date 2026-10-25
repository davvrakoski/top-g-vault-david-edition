---
area: "03 Scripting and Systems"
cluster: "Scripting"
source_note: "15_Code_Patterns/01_Cooldown_Module"
title: "Cooldown Module"
tags: [roblox, premium, "cluster/scripting"]
verified: 2026-10-25
cssclasses: [tg-a03]
---

# Cooldown Module

```luau
--!strict
local Cooldown = {}
Cooldown.__index = Cooldown

function Cooldown.new()
    return setmetatable({times = {}}, Cooldown)
end

function Cooldown:IsReady(key: any, duration: number): boolean
    local now = os.clock()
    local last = self.times[key]
    return last == nil or now - last >= duration
end

function Cooldown:Use(key: any)
    self.times[key] = os.clock()
end

function Cooldown:Clear(key: any)
    self.times[key] = nil
end

return Cooldown
```

For server-authoritative actions, the server owns this cooldown state.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Scripting - Hub]]

**Related notes:** [[Luau Programming]] · [[Remote Protocol Versioning]] · [[Service and Controller Boundaries]] · [[Events vs Polling]]

<!-- TDOD_GRAPH_END -->
