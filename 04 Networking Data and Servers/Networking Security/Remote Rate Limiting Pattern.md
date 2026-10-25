---
area: "04 Networking Data and Servers"
cluster: "Networking Security"
source_note: "03_Networking_Security/02_Remote_Rate_Limiter"
title: "Remote Rate Limiting Pattern"
tags: [roblox, premium, "cluster/networking-security"]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# Remote Rate Limiting Pattern

Use a token bucket or sliding-window style limiter for requests that an exploiter could spam.

```luau
--!strict
local RateLimiter = {}
RateLimiter.__index = RateLimiter

export type Limiter = {
    capacity: number,
    refillPerSecond: number,
    buckets: {[Player]: {tokens: number, last: number}},
    Allow: (self: Limiter, player: Player, cost: number?) -> boolean,
    Remove: (self: Limiter, player: Player) -> (),
}

function RateLimiter.new(capacity: number, refillPerSecond: number): Limiter
    return setmetatable({
        capacity = capacity,
        refillPerSecond = refillPerSecond,
        buckets = {},
    }, RateLimiter) :: any
end

function RateLimiter:Allow(player: Player, cost: number?): boolean
    local now = os.clock()
    local requestCost = cost or 1
    local bucket = self.buckets[player]

    if not bucket then
        bucket = {tokens = self.capacity, last = now}
        self.buckets[player] = bucket
    end

    local elapsed = math.max(0, now - bucket.last)
    bucket.tokens = math.min(self.capacity, bucket.tokens + elapsed * self.refillPerSecond)
    bucket.last = now

    if bucket.tokens < requestCost then
        return false
    end

    bucket.tokens -= requestCost
    return true
end

function RateLimiter:Remove(player: Player)
    self.buckets[player] = nil
end

return RateLimiter
```

### Design notes

- Give expensive requests a higher cost.
- Rate limiting is not validation; use both.
- Do not instantly ban for one limit hit. Network bursts and buggy UI can happen.
- Track abusive patterns over time if moderation action is considered.
- Clear per-player state on `PlayerRemoving`.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Networking Security - Hub]]

**Related notes:** [[Anti-Dupe Transaction Blueprint]] · [[Threat Modeling Every Roblox Feature]] · [[MCP Security and Setup Principles]] · [[Remote Type and Allowlist Validation]]

<!-- TDOD_GRAPH_END -->
