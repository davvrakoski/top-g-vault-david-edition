---
area: "04 Networking Data and Servers"
cluster: "Networking Security"
source_note: "26_Practical_Luau_Library/01_Rate_Limiter"
title: "Rate Limiter"
tags: ["roblox", "legendary", "production", "cluster/networking-security"]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# Rate Limiter

Use a token bucket or sliding-window limiter when a remote/action can be spammed. Rate limiting is **not** validation; it only controls frequency.

```lua
--!strict
local RateLimiter = {}
RateLimiter.__index = RateLimiter

function RateLimiter.new(capacity: number, refillPerSecond: number)
    return setmetatable({
        capacity = capacity,
        refill = refillPerSecond,
        state = {},
    }, RateLimiter)
end

function RateLimiter:allow(key: any, cost: number?): boolean
    cost = cost or 1
    local now = os.clock()
    local s = self.state[key]
    if not s then
        s = {tokens = self.capacity, t = now}
        self.state[key] = s
    end
    local dt = math.max(0, now - s.t)
    s.t = now
    s.tokens = math.min(self.capacity, s.tokens + dt * self.refill)
    if s.tokens < cost then return false end
    s.tokens -= cost
    return true
end

function RateLimiter:remove(key: any)
    self.state[key] = nil
end

return RateLimiter
```

**Production notes:** clean player keys on leave; choose limits from legitimate burst behavior; log sustained abuse; do not kick on a single rejected request; still validate state/distance/ownership.

## Test checklist
- [ ] Normal input works.
- [ ] Invalid/malformed input fails safely.
- [ ] Cleanup path is tested.
- [ ] Performance impact is measured if this runs frequently.
- [ ] The example is adapted to the project rather than pasted blindly.

## Knowledge graph connections

**Primary cluster:** [[Networking Security - Hub|Networking Security]]

**Related:** [[Practical Luau Pattern Library]]
