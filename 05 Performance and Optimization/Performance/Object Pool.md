---
area: "05 Performance and Optimization"
cluster: "Performance"
source_note: "26_Practical_Luau_Library/05_Object_Pool"
title: "Object Pool"
tags: ["roblox", "legendary", "production", "cluster/performance"]
verified: 2026-10-25
cssclasses: [tg-a05]
---

# Object Pool

Pooling is useful for objects that are expensive/frequent to create and destroy. Do not pool everything automatically.

```lua
local Pool = {}
Pool.__index = Pool

function Pool.new(factory, reset)
    return setmetatable({free={}, factory=factory, reset=reset}, Pool)
end

function Pool:acquire()
    return table.remove(self.free) or self.factory()
end

function Pool:release(obj)
    self.reset(obj)
    table.insert(self.free, obj)
end

return Pool
```

Good candidates can include repeated VFX holders or projectile visuals. Bad candidates include objects created rarely or objects whose reset cost is as high as recreation.

## Test checklist
- [ ] Normal input works.
- [ ] Invalid/malformed input fails safely.
- [ ] Cleanup path is tested.
- [ ] Performance impact is measured if this runs frequently.
- [ ] The example is adapted to the project rather than pasted blindly.

## Knowledge graph connections

**Primary cluster:** [[Performance - Hub|Performance]]

**Related:** [[Practical Luau Pattern Library]]
