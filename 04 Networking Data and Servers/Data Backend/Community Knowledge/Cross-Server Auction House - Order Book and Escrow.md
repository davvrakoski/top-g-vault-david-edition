---
area: "04 Networking Data and Servers"
cluster: "Data Backend"
title: "Cross-Server Auction House - Order Book and Escrow"
tags: [roblox, community-knowledge, data-backend, memorystore, trading, auction, economy]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/cloud-services/memory-stores
  - https://create.roblox.com/docs/cloud-services/memory-stores/sorted-map
  - https://create.roblox.com/docs/cloud-services/data-stores-vs-memory-stores
  - https://devforum.roblox.com/t/i-implemented-global-trading-for-my-rpg/4754701
---
# Cross-Server Auction House - Order Book and Escrow

A global market (list an item in one server, someone buys it from another) is one of the strongest retention features for RPGs and simulators, and one of the easiest ways to create a duplication exploit. The Roblox docs name "cross-server trading and auctioning" as a sorted-map use case; a 2026 DevForum write-up of a working RPG market adds the production details (price-time sort keys, sharding, dead-letter delivery). This note combines them into one safe design.

## Two layers, two jobs

| Layer | Holds | Why |
| --- | --- | --- |
| MemoryStore sorted map | Live listings / order book | Fast, ordered, shared by all servers |
| DataStore | Escrowed items, balances, delivery records | Persistent; MemoryStore items expire (45 days max) and can be flushed |

Rule: **the item leaves the seller's inventory into escrow before it appears in the order book**, and the order book entry is only a pointer to the escrow record.

## Sort keys

Sorted maps order by sort key, then by key. Encode price and time so the cheapest, oldest listing comes first (FIFO at equal price):

```lua
-- one sorted map per item type, e.g. "Market_Sword_01"
local function listingKey(price: number, listedAt: number, listingId: string): string
	-- zero-pad so string order equals numeric order
	return string.format("%012d_%012d_%s", price, listedAt, listingId)
end
```

The value holds `{listingId, sellerId, price, qty}`. Keep it small (sorted map values share the 32 KB limit with hash maps).

## Listing flow (seller's server)

1. Server validates ownership and price bounds (min/max per item to block money laundering between alts).
2. In the seller's session-locked save: remove the item, write `escrow[listingId] = item`. Save.
3. `SetAsync` the listing into the item's sorted map with an expiration (for example 3-7 days).
4. If step 3 fails, return the item from escrow; nothing was visible yet.

## Buying flow (buyer's server)

1. Read the first page (`GetRangeAsync(Enum.SortDirection.Ascending, 10)`) for that item.
2. **Claim** the listing atomically: `UpdateAsync` on its key returning `nil` if it is already marked sold, otherwise mark `soldTo = buyerId`. Only the server whose transform wins proceeds.
3. Charge the buyer in their session data and grant the item, recording the listingId as applied (idempotency).
4. Remove the listing from the sorted map.
5. Deliver the money to the seller: if the seller is online, MessagingService tells their server; if offline, write a delivery record the seller's server applies on next join. The DevForum author used ProfileStore's `MessageAsync` for this plus a DataStore "dead-letter" fallback for failed deliveries.

## Expiry and cancel

A listing that expires from MemoryStore does not return the item by itself. On the seller's join (and from a "My listings" screen), compare escrow records with live listings; anything not listed and not sold goes back to the inventory. Cancel = claim your own listing with the same atomic `UpdateAsync`, so a cancel and a buy can never both succeed.

## Scale

- One sorted map lives on one partition (about 30,000 request units/min before throttling). Popular items need **shards**: `Market_Sword_01_s1..s4`; buyers read the first page of every shard and pick the cheapest. The DevForum post used a random 1-5 suffix.
- Cache order-book pages per server for 5-15 s; do not hit MemoryStore every time a player opens the UI.
- Count request units: each item returned by `GetRangeAsync` costs one unit.

## Abuse checks

- Price floors/ceilings and a listing tax (also an economy sink).
- Per-player listing caps and rate limits on the Remote.
- Log every claim with buyer, seller, price and time to an analytics or logging store; alt-account funneling shows up as repeated trades between the same two IDs at extreme prices.

## Related
[[Data Backend - Hub]] - [[Trading and Duplication Threat Model]] - [[Anti-Dupe Transaction Blueprint]] - [[MemoryStore Queues and Sorted Maps for Matchmaking]]
