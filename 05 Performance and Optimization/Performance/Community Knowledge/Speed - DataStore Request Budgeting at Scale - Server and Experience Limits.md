---
area: "05 Performance and Optimization"
cluster: "Performance"
title: "Speed - DataStore Request Budgeting at Scale - Server and Experience Limits"
tags: [roblox, community-knowledge, performance, datastore, rate-limits, live-ops, server]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/cloud-services/data-stores/error-codes-and-limits
  - https://create.roblox.com/docs/reference/engine/classes/DataStoreService
---
# Speed - DataStore Request Budgeting at Scale - Server and Experience Limits

DataStore limits now work at **two levels**: a per-server rate limit (configurable by you) and an experience-wide limit shared by every server and by Open Cloud. A save system that is fine at 200 players can throttle at 20,000, and a live-ops tool calling Open Cloud can starve your game servers of reads. This note turns the current official numbers into a budget you can write down. Always recheck the limits page before launch; these values change.

## Level 1: per server (default, requests per minute)

| Request type (enum) | Covers | Default |
|---|---|---|
| `StandardRead` | GetAsync, GetVersionAsync, GetVersionAtTimeAsync, UpdateAsync | 60 + numPlayers x 40 |
| `StandardWrite` | SetAsync, IncrementAsync, UpdateAsync | 60 + numPlayers x 40 |
| `StandardList` | ListDataStoresAsync, ListKeysAsync, ListVersionsAsync | 5 + numPlayers x 2 |
| `StandardRemove` | RemoveAsync | 60 + numPlayers x 40 |
| `OrderedRead` | GetAsync, BatchGetAsync, UpdateAsync | 60 + numPlayers x 40 |
| `OrderedWrite` | SetAsync, IncrementAsync, UpdateAsync | 30 + numPlayers x 5 |
| `OrderedList` | GetSortedAsync | 5 + numPlayers x 2 |

- `UpdateAsync` consumes **both** a read and a write.
- New servers get a one-time startup burst. `DataStoreService:GetRequestBudgetForRequestType(type)` reports what this server can spend right now.
- Studio Run mode uses separate, possibly lower static limits; test rate limits in Team Create.

## Level 2: whole experience (shared with Open Cloud)

| Request type | Experience limit per minute |
|---|---|
| Standard read | 300 + concurrentUsers x 40 |
| Standard write | 300 + concurrentUsers x 20 |
| Standard list | 300 + concurrentUsers x 2 |
| Standard remove | 300 + concurrentUsers x 40 |
| Ordered read / write / list / remove | 300 + CCU x 40 / 20 / 2 / 40 |

Exceeding it returns errors such as `StandardWriteExperienceThrottled`. Note that writes per user are **20/min experience-wide** but **40/min per server by default**: if every server spends its full per-server write budget, the experience limit is what stops you.

## Level 3: per key throughput (all servers combined)

- Read: **25 MB per minute** per key. Write: **4 MB per minute** per key.
- Each request is rounded **up to the next KB** (800 bytes counts as 1 KB).
- A single global key that every server writes (a global counter, a shared "event state" key) is the classic `KeyThrottled` source. Shard it or move it to MemoryStore.

## Example budget: 50-player server, autosave every 120 s

| Activity | Reads/min | Writes/min |
|---|---|---|
| Join loads (assume 10 joins/min) | 10 | 0 |
| Autosave via UpdateAsync, 50 players / 2 min | 25 | 25 |
| Leave saves (10/min) via UpdateAsync | 10 | 10 |
| Ordered leaderboard refresh, 1 per min | (OrderedList 1) | 0 |
| Ordered score submit on leave | 0 | OrderedWrite 10 |
| **Total** | **45** of 2,060 | **35** of 2,060; ordered 10 of 280 |

Per server this is tiny. Experience-wide at 20,000 CCU, writes are about 35/50 = 0.7 per user per minute against a limit of 20 per user: also safe. The budget breaks when code writes per action (every coin, every kill) instead of per save interval.

## Controlling your own share

`DataStoreService:SetRateLimitForRequestType(requestType, baseLimit, perPlayerLimit)` sets this server's limit as `baseLimit + perPlayerLimit x numPlayers`. Call it **once per request type at server start**, not during play. Allowed ranges differ by type (for example `StandardWrite` base 0 to 10,000, per player 0 to 200); `UpdateAsync` and `OnUpdate` cannot be configured. Use it to:

- cap a server so a bug cannot burn the experience-wide budget;
- reserve headroom for Open Cloud tools (live-ops dashboards, moderation) that share the same pool. For Open Cloud scripts the docs suggest waiting `60 / desiredRequestsPerMinute` seconds between calls, or a leaky-bucket limiter.

## Queue behaviour

When throttled, requests wait in per-type queues (set, ordered set, get, ordered get). Each queue holds **30** requests; beyond that, calls fail with codes 301 to 306. A burst of saves at shutdown can hit this, so save with a short stagger in `BindToClose`.

## Checklist

- [ ] No DataStore call inside a per-action remote handler
- [ ] Autosave interval set from the budget table, not guessed
- [ ] Shared global keys sharded or moved to MemoryStore
- [ ] Budget checked with `GetRequestBudgetForRequestType` before non-critical calls
- [ ] Open Cloud tools rate-limited and accounted for

## Related
[[Performance - Hub]] · [[DataStore Abuse Prevention - Remotes That Hit Your Budget]] · [[DataStore Session Locking, Retries, Versioning and Erasure]] · [[MemoryStore HashMap Patterns and Quota Math]]
