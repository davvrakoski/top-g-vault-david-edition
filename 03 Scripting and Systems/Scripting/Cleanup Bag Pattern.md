---
area: "03 Scripting and Systems"
cluster: "Scripting"
source_note: "15_Code_Patterns/03_Cleanup_Bag"
title: "Cleanup Bag Pattern"
tags: [roblox, premium, "cluster/scripting"]
verified: 2026-10-25
cssclasses: [tg-a03]
---

# Cleanup Bag Pattern

Long-lived systems leak when connections/tasks/instances are not cleaned up.

```luau
--!strict
local Cleanup = {}
Cleanup.__index = Cleanup

function Cleanup.new()
    return setmetatable({items = {}}, Cleanup)
end

function Cleanup:Add(item: any)
    table.insert(self.items, item)
    return item
end

function Cleanup:Destroy()
    for i = #self.items, 1, -1 do
        local item = self.items[i]
        local kind = typeof(item)
        if kind == "RBXScriptConnection" then
            item:Disconnect()
        elseif kind == "Instance" then
            item:Destroy()
        elseif type(item) == "function" then
            item()
        elseif type(item) == "table" and type(item.Destroy) == "function" then
            item:Destroy()
        end
        self.items[i] = nil
    end
end

return Cleanup
```

Production teams may prefer established utilities such as Trove/Maid patterns after reviewing the dependency and license.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Scripting - Hub]]

**Related notes:** [[Events vs Polling]] · [[Weighted Random Selection]] · [[Luau Programming]] · [[Remote Protocol Versioning]]

<!-- TDOD_GRAPH_END -->
