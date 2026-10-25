---
area: "04 Networking Data and Servers"
cluster: "Networking Security"
source_note: "26_Practical_Luau_Library/06_Remote_Payload_Validation"
title: "Remote Payload Validation"
tags: ["roblox", "legendary", "production", "cluster/networking-security"]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# Remote Payload Validation

Validate both **shape** and **meaning**.

```lua
local function validateAttack(payload)
    if typeof(payload) ~= "table" then return false end
    if typeof(payload.weaponId) ~= "string" then return false end
    if #payload.weaponId > 64 then return false end
    if typeof(payload.origin) ~= "Vector3" then return false end
    if payload.origin.X ~= payload.origin.X then return false end -- NaN guard example
    return true
end
```

After type checks, validate: player owns weapon, action state allows attack, cooldown/resource is ready, origin is plausible relative to server state, target/query is recomputed or constrained by server logic, and request rate is acceptable.

## Test checklist
- [ ] Normal input works.
- [ ] Invalid/malformed input fails safely.
- [ ] Cleanup path is tested.
- [ ] Performance impact is measured if this runs frequently.
- [ ] The example is adapted to the project rather than pasted blindly.

## Knowledge graph connections

**Primary cluster:** [[Networking Security - Hub|Networking Security]]

**Related:** [[Practical Luau Pattern Library]]
