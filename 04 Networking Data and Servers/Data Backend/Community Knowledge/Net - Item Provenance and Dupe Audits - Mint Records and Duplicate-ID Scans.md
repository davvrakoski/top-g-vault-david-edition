---
area: "04 Networking Data and Servers"
cluster: "Data Backend"
title: "Item Provenance and Dupe Audits - Mint Records and Duplicate-ID Scans"
tags: [roblox, community-knowledge, data-backend, anti-dupe, trading, audit, guid]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/anti-item-dupe-system/2091062
  - https://devforum.roblox.com/t/unique-serial-system-implementation/4023678
  - https://create.roblox.com/docs/cloud-services/data-stores/best-practices
  - https://create.roblox.com/docs/reference/engine/classes/DataStore
  - https://create.roblox.com/docs/cloud-services/memory-stores/hash-map
---
# Item Provenance and Dupe Audits - Mint Records and Duplicate-ID Scans

Session locking and atomic trades stop most duplication, but no game ships bug-free. When a dupe does happen, the question becomes: *which copy is real, how many exist, and which code path made them?* If every valuable item carries a unique id from birth and you log where ids come from, you can answer that in minutes. Without it, you are guessing from player reports. As one devforum reply puts it, stop duping rather than chasing duped items, and use detection as the smoke alarm that tells you where to look.

## The provenance fields

Give every **unique, tradeable** item (see [[Net - Inventory Data Models - Stacks, Unique Items and Item IDs]]) these fields when the server creates it:

| Field | Meaning |
| --- | --- |
| `uid` | `HttpService:GenerateGUID(false)`, minted on the server |
| `t` | Unix time of minting |
| `src` | Short source code: `egg`, `shop`, `quest`, `trade_in`, `admin`, `promo` |
| `job` | First 8 chars of `game.JobId` where it was minted (optional, helps trace a bad server) |

A trade does **not** create a new uid: the same record moves from one inventory to the other. Only minting creates ids. That invariant is what makes a duplicate detectable: two inventories holding the same uid is always a bug.

## Mint log (append-only)

Write a compact log entry per mint so you can later count how many of an item legitimately exist. Options, cheapest first:

1. **AnalyticsService custom/economy events** for counts and trends (no per-id lookup).
2. **Daily shard keys in a DataStore**: `mint_2026-10-25_07` (hour shard) holding an array of `{uid, d, src}` appended with `UpdateAsync`. Shard by hour or by `uid` prefix so one key never takes all writes; the docs warn about hot keys and recommend sharding.
3. **External backend** via HttpService with batching, if you already run one.

For high-value or limited items only, keep an **ownership index**: `owner_<uid> -> userId`, updated inside the same flow that moves the item. Do not do this for common drops; the write budget will not allow it (a concern also raised in the devforum anti-dupe thread).

## Detecting duplicates

**Per player, at load:** walk `items`, build a set of uids, flag any repeat inside one save (bad merge code).

**Across players, cheaply:** when an item with an ownership index enters an inventory (trade receive, load), check `owner_<uid>`. If it names someone else, quarantine the incoming copy instead of deleting it.

**Live session check with MemoryStore:** on join, for each limited item, `SetAsync` a hash map entry `live_<uid> = userId` with a short expiration (for example 2 hours, refreshed while the player is online). A second player arriving with the same uid while the first is online is a strong signal. The hash map docs give a 32 KB value limit and per-key write limits, so keep entries tiny and only for limited items.

## Quarantine, then decide

Never auto-delete on detection; false positives (a stale index after a crash) will anger honest players. Instead:

1. Mark the record `q = true` (cannot trade, sell or equip).
2. Log `{uid, userA, userB, src, t}` to your evidence store ([[Exploit Strike Scores - Decaying Suspicion, Evidence Logs and Response Ladders]]).
3. A staff member reviews: the copy with the earlier valid ownership chain wins; the other is removed with a logged admin action ([[Net - Staff Audit Logs - Recording Every Admin Action]]).
4. Find the code path: `src` and `job` usually point straight at it.

## Known dupe shapes to test against

- Give-then-crash: A gives to B, B leaves and saves, A's server crashes before A's save (devforum thread). Fix: trades commit both sides atomically, never "remove from A later".
- Rejoin race: player rejoins a new server before the old one released the lock. Fix: session locking ([[DataStore Session Locking, Retries, Versioning and Erasure]]).
- Retry overwrite: an old save retries after a newer one succeeded. The data store best-practices page warns about exactly this; process retries in order per key.
- Mint without uid: admin commands or promo codes that create items through a side path. Route every grant through one `mint()` function.

A step-by-step QA script for these cases is in [[Test - Dupe Hunting Test Script - Trades, Gifts, Drops and Rejoins]].

## Checklist

- [ ] One `mint()` function; every unique item gets uid, t, src.
- [ ] Trades move records; they never mint.
- [ ] Load-time duplicate-uid check per player.
- [ ] Ownership index only for limited items.
- [ ] Quarantine flag and staff review instead of auto-delete.

## Related
[[Data Backend - Hub]] · [[Anti-Dupe Transaction Blueprint]] · [[Trading and Duplication Threat Model]] · [[Idempotent Transaction Ledger]]
