---
area: "04 Networking Data and Servers"
cluster: "Data Backend"
source_note: "26_Practical_Luau_Library/09_Save_Schema_Migrations"
title: "Save Schema Migrations"
tags: ["roblox", "legendary", "production", "cluster/data-backend"]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# Save Schema Migrations

Never assume today's save shape existed forever.

```lua
local migrations = {}

migrations[1] = function(data)
    data.Settings = data.Settings or {Music = 1, SFX = 1}
    data.Version = 2
    return data
end

migrations[2] = function(data)
    data.Currencies = {Coins = data.Coins or 0}
    data.Coins = nil
    data.Version = 3
    return data
end

local function migrate(data, latest)
    data.Version = data.Version or 1 -- saves made before versioning have no Version field
    while data.Version < latest do
        local fn = migrations[data.Version]
        assert(fn, "missing migration")
        data = fn(data)
    end
    return data
end
```

Keep fixtures of old schemas and run every migration chain in tests before publishing.

## Test checklist
- [ ] Normal input works.
- [ ] Invalid/malformed input fails safely.
- [ ] Cleanup path is tested.
- [ ] Performance impact is measured if this runs frequently.
- [ ] The example is adapted to the project rather than pasted blindly.

## Knowledge graph connections

**Primary cluster:** [[Data Backend - Hub|Data Backend]]

**Related:** [[Practical Luau Pattern Library]]
