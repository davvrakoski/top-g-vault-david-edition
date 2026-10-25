---
area: "04 Networking Data and Servers"
cluster: "Data Backend"
title: "Serial Numbered Items - Atomic Counters for Limited Editions"
tags: [roblox, community-knowledge, data-backend, limited-items, serials, incrementasync]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/unique-serial-system-implementation/4023678
  - https://create.roblox.com/docs/reference/engine/classes/GlobalDataStore#IncrementAsync
  - https://create.roblox.com/docs/reference/engine/classes/GlobalDataStore#UpdateAsync
  - https://create.roblox.com/docs/cloud-services/data-stores/error-codes-and-limits
---
# Serial Numbered Items - Atomic Counters for Limited Editions

"Golden Dragon #27 of 500" sells better than "Golden Dragon". Serial numbers and hard supply caps are a staple of trading games, but they are a distributed-counter problem: many servers mint at once, and two servers that read "26" at the same moment will both hand out #27. The devforum thread on serial systems ends without a settled answer; this note gives one that only uses Roblox services and survives crashes.

## Requirements

1. **No two items share a serial** for the same item type.
2. **Never exceed the cap** (500 means 500).
3. **A gap is acceptable, a duplicate is not.** If a server crashes after taking #27 but before granting it, #27 is lost. That is fine; say so in your item description ("serials may skip").
4. The serial is **display data**. The item's identity is still its uid ([[Net - Inventory Data Models - Stacks, Unique Items and Item IDs]]).

## The atomic step: UpdateAsync on one counter key

`UpdateAsync` runs your transform against the latest stored value and retries if another server wrote in between, so a read-check-increment inside it is atomic. `IncrementAsync` is also atomic but cannot enforce a cap by itself.

```lua
local DataStoreService = game:GetService("DataStoreService")
local serialStore = DataStoreService:GetDataStore("Serials_v1")

-- Returns the serial number, or nil if sold out / failed.
local function takeSerial(defId: string, cap: number): number?
	local taken: number? = nil
	local ok, err = pcall(function()
		serialStore:UpdateAsync("next_" .. defId, function(current)
			current = current or 0
			if current >= cap then
				taken = nil
				return nil -- returning nil cancels the write
			end
			taken = current + 1
			return taken
		end)
	end)
	if not ok then
		warn("serial failed", defId, err)
		return nil
	end
	return taken
end
```

Note that the callback can run more than once; only the value from the final, committed run counts, which is why `taken` is reassigned on every run.

## Order of operations when granting

1. Take payment or consume the egg/crate **as a pending transaction** (see [[Idempotent Transaction Ledger]]).
2. `takeSerial` -> if nil, refund and show "Sold out".
3. Mint the item: `{uid, d, sn = serial, t, src}` and put it in the player's profile.
4. Save the profile and mark the transaction complete.
5. Optionally append `{sn, uid, userId}` to a mint log ([[Net - Item Provenance and Dupe Audits - Mint Records and Duplicate-ID Scans]]).

If the server dies between 2 and 4, the serial is skipped and the pending transaction gets refunded on next load. No duplicate is possible because the counter only moves forward.

## Throughput math

All servers hit one key per item type. Per the docs, writes to one key are limited to 4 MB per minute, rounded up to 1 KB per request, so the hard ceiling is roughly 4,000 increments per minute per key, and each server also has its own write budget (60 + 40 x players per minute in the current limits table). In practice that is plenty for a limited drop that sells a few hundred copies. For bursty launch moments (a 500-copy drop announced to 50k players):

- **Pre-allocate blocks.** Each server takes a block of 10 serials at once (`current + 10`) and hands them out locally. Unused serials from a closing server are simply skipped. Ten times fewer counter writes.
- **Queue purchases.** Accept the request, show "Securing your copy...", and retry with backoff instead of failing on the first throttle.

## Showing remaining supply

Don't have every server poll the counter key. Publish the latest value on a MessagingService topic after each block allocation, or cache it in a MemoryStore hash map entry that servers read every 10-30 seconds with jitter (the data store best-practices page recommends staggered polling of shared keys). The displayed number can lag; the counter key is the only truth.

## Pitfalls

- Using a MemoryStore counter as the source of truth: memory stores expire and can be flushed. Use them only as a cache.
- Doing the increment in `GetAsync` + `SetAsync`: classic lost update; two servers mint the same serial.
- Re-numbering when an item is deleted. Serials are permanent; deleted means "retired", not "reusable".
- Showing the serial before step 4 finishes; a crash would show the player a number they never got.

## Related
[[Data Backend - Hub]] · [[MemoryStore HashMap Patterns and Quota Math]] · [[Cross-Server Auction House - Order Book and Escrow]] · [[MessagingService Cross-Server Patterns and Limits]]
