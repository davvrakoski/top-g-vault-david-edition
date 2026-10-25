---
area: "04 Networking Data and Servers"
cluster: "Data Backend"
title: "Clan and Guild Data - Multi-Writer Keys Without Lost Updates"
tags: [roblox, community-knowledge, data-backend, datastore, clans, guilds, concurrency]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/cloud-services/data-stores
  - https://create.roblox.com/docs/cloud-services/data-stores/best-practices
  - https://create.roblox.com/docs/reference/engine/classes/GlobalDataStore#UpdateAsync
  - https://create.roblox.com/docs/cloud-services/memory-stores/hash-map
---
# Clan and Guild Data - Multi-Writer Keys Without Lost Updates

Player data has one writer at a time (the server the player is in), so a session lock solves it. Clan, guild, faction and "shared base" data is different: **many servers write the same key at once**. Ten members in ten servers each donate gold to the clan bank, and with `GetAsync` then `SetAsync` nine of those donations are silently lost. This note is the design for shared keys that stay correct.

## Rule 1: every write is an UpdateAsync transform

`UpdateAsync` re-runs your transform with the newest value if another server wrote in between, so increments and list edits are never lost. The transform must not yield and may run several times, so it must be a pure function of `old`:

```lua
local clans = game:GetService("DataStoreService"):GetDataStore("Clans_v1")

local function addToBank(clanId: string, opId: string, amount: number)
	return clans:UpdateAsync("clan_" .. clanId, function(old)
		if old == nil then return nil end -- clan was deleted
		old.appliedOps = old.appliedOps or {}
		if old.appliedOps[opId] then return nil end -- already applied
		old.bank += amount
		old.appliedOps[opId] = os.time()
		return old
	end)
end
```

## Rule 2: make operations idempotent

A failed `UpdateAsync` can still have written (the docs say a failure means no success reply arrived). If you retry blindly, the donation applies twice. Give every operation an ID (`HttpService:GenerateGUID(false)`), store recent IDs on the record, and skip ones already applied. Trim the list to the last 50-100 IDs or the last day so the record stays small.

## Rule 3: two-sided changes need an order

"Player donates 100 gold to clan" touches two keys: the player's data and the clan's. There is no multi-key transaction. Pick a safe order:

1. Subtract from the player in their session data and save, recording `pendingDonation = {opId, clanId, amount}`.
2. Apply to the clan with the opId (idempotent).
3. Clear `pendingDonation` on the player.
4. On join, if `pendingDonation` exists, re-run step 2 (safe because of the opId), then clear it.

Money can be briefly "in flight" but is never duplicated or destroyed.

## Rule 4: keep shared keys small and the write rate low

- Per-key write throughput is limited (4 MB/min per key on the limits page) and every server shares it. Batch: collect donations locally for 10-30 s and send one `UpdateAsync` with the sum and a list of opIds.
- Do not store the full member list with stats inside the clan key if clans are large. Store `members = {[userId] = role}` and keep each member's contribution in **their own** player data; build rankings from an OrderedDataStore keyed by clan.
- Split rarely-changed data (name, banner, description) from hot data (bank, XP) into two keys.

## Rule 5: tell other servers

After a write, publish a short MessagingService message (`{clanId, version}`) so servers with members online refresh their cached copy. Keep a `version` number on the record and only accept cached copies with a newer version. For fast-changing counters, a MemoryStore hash map cache with a short TTL in front of the DataStore avoids a re-read storm.

## Permissions are server-side

Check role on the server inside the action, using the freshly loaded record: "is the caller still an officer?" A kicked officer whose server has a stale copy must not be able to spend the bank. The safest place is inside the transform, returning `nil` to cancel if the caller's role is gone.

## Checklist

- [ ] No `SetAsync` on any shared key
- [ ] Every operation has an opId; retries are safe
- [ ] Player-side and clan-side writes have a recovery path on join
- [ ] Hot fields batched; rarely changed fields split out
- [ ] Role checks inside the transform
- [ ] Cross-server refresh message with a version number

## Related
[[Data Backend - Hub]] - [[Anti-Dupe Transaction Blueprint]] - [[Persistence Transactions and Migrations]] - [[MessagingService Cross-Server Patterns and Limits]]
