---
area: "07 AI and Combat"
cluster: "AI"
source_note: "05_Performance_Engineering/04_NPC_Update_Scheduler"
title: "Scalable NPC Update Scheduler"
tags: [roblox, premium, "cluster/ai"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# Scalable NPC Update Scheduler

The goal is to avoid 100 NPCs all running expensive perception/path logic on the same frame.

```luau
--!strict
local Scheduler = {}
Scheduler.__index = Scheduler

function Scheduler.new()
    return setmetatable({buckets = {}, cursor = 1}, Scheduler)
end

function Scheduler:Add(callback: () -> (), bucketCount: number?)
    local count = bucketCount or 8
    if #self.buckets == 0 then
        for i = 1, count do self.buckets[i] = {} end
    end
    local smallest = 1
    for i = 2, #self.buckets do
        if #self.buckets[i] < #self.buckets[smallest] then smallest = i end
    end
    table.insert(self.buckets[smallest], callback)
end

function Scheduler:Step()
    if #self.buckets == 0 then return end
    local bucket = self.buckets[self.cursor]
    for _, callback in bucket do
        callback()
    end
    self.cursor = self.cursor % #self.buckets + 1
end

return Scheduler
```

This is only a pattern. Production code needs unregister/cleanup and per-NPC state.

### Tiered thinking

- Near/combat: frequent sensing.
- Nearby but idle: reduced sensing.
- Far: occasional high-level state check.
- Very far: sleep/despawn/simplify.

Never make pathfinding the only movement tool. If a target is directly reachable, simple movement can be cheaper and smoother.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[AI - Hub]]

**Related notes:** [[Production NPC State Machine]] · [[NPC Vision and Hearing Model]] · [[Pathfinding Engineering]] · [[Git Branch and Review Workflow]]

<!-- TDOD_GRAPH_END -->
