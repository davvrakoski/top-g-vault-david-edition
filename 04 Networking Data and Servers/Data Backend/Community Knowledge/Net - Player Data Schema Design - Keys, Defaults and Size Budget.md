---
area: "04 Networking Data and Servers"
cluster: "Data Backend"
title: "Player Data Schema Design - Keys, Defaults and Size Budget"
tags: [roblox, community-knowledge, data-backend, datastore, schema, simulator, rpg, tycoon]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/cloud-services/data-stores/best-practices
  - https://create.roblox.com/docs/cloud-services/data-stores/error-codes-and-limits
  - https://create.roblox.com/docs/reference/engine/classes/GlobalDataStore
  - https://devforum.roblox.com/t/best-method-of-storing-uuids/2133235
---
# Player Data Schema Design - Keys, Defaults and Size Budget

Most save bugs are not DataStore bugs, they are schema bugs: a value stored as a Vector3 that silently becomes nil, a pet list that grew past what fits, a field added in update 12 that crashes every old profile. Deciding the shape of the save before launch costs an afternoon; changing it after 100k players costs a migration. This note is the design checklist. Versioning mechanics live in [[Save Schema Migration Blueprint]].

## Hard limits that shape the schema (Roblox docs)

| Limit | Value |
| --- | --- |
| Key name length | 50 characters |
| Value size per key | 4,194,304 bytes (stored as a JSON string) |
| Per-key read throughput | 25 MB per minute |
| Per-key write throughput | 4 MB per minute |
| Game storage | 500 MB + 1 MB x lifetime users |

Throughput is rounded up to the next KB per request, so a 3.2 KB save counts as 4 KB.

## One key per player, one root table

The docs recommend storing each player's persistent data under one key (for example `User_123456` in a `PlayerData` store) while it fits. One key means one atomic `UpdateAsync`, one version history for rollbacks, and one place to look during support. Split only when a part of the data is shared by other writers (clan bank, trade escrow) or genuinely huge (build plots).

Pass `{player.UserId}` as the `userIds` argument on writes so erasure requests can find the key ([[Policy - Player Data, COPPA and GDPR Basics for Creators]]).

## What to store, what to derive

Store **facts**, derive **views**:

- Store: currencies, owned items, unlocks, quest progress, settings, timestamps, `schemaVersion`.
- Derive at load: multipliers from owned upgrades, total pet power, level from XP, leaderboard values. If you store a derived value it will eventually disagree with its inputs after a balance patch.
- Never store: Instances, Player objects, CFrames or Color3 directly (JSON cannot hold them), anything the client told you without validation.

Encode engine types yourself: `{x, y, z}` arrays for positions, hex strings for colors, rotation as a small integer (0-3) for grid-placed tycoon furniture.

## Genre templates (shapes, not code)

**Simulator:** `coins` (number, watch 2^53, see [[Big Numbers in Simulators - Doubles, 2^53 and Number Libraries]]), `rebirths`, `pets` (map of id -> pet record), `equippedPets` (array of ids, capped), `zonesUnlocked` (set as `{[zoneName] = true}`), `stats` (lifetime counters for analytics and badges).

**RPG:** `level`/`xp`, `class`, `inventory` (see [[Net - Inventory Data Models - Stacks, Unique Items and Item IDs]]), `equipment` (slot -> item id, never a copy of the item), `quests` (questId -> `{step, startedAt}`), `flags` (one-shot story triggers as a set).

**Tycoon:** `cash`, `purchasedButtons` (set of button ids), `plotLayout` (compact list of `{itemId, gx, gz, rot}`), `upgradeLevels`. Store button ids, not positions; the plot model rebuilds from ids.

## Defaults and reconcile

Keep one `DEFAULTS` table in a ModuleScript. On load, walk it and fill any missing field into the loaded data (a shallow or deep "reconcile"). This is what makes adding a new field in an update safe. ProfileStore exposes the same idea as a reconcile step on profiles ([[ProfileStore in 2026 - Status, Wrappers and Lock Lessons]]).

```lua
local function reconcile(data, defaults)
	for key, value in defaults do
		if data[key] == nil then
			data[key] = if type(value) == "table" then table.clone(value) else value
		elseif type(value) == "table" and type(data[key]) == "table" and next(value) ~= nil then
			reconcile(data[key], value) -- only recurse into record-like defaults
		end
	end
end
```

Do not reconcile into maps whose keys are content (the pets map): an empty default table means "no children to fill".

## JSON traps

- **Mixed tables:** a table with both array slots and string keys does not survive encoding cleanly. Pick one per table.
- **Sparse arrays:** `{[1]=a, [5]=b}` may encode badly. Use string keys (`["5"]`) for maps keyed by numbers, and convert on load.
- **NaN and inf** from a divide-by-zero will poison a save. Validate numbers with `x == x` and a max before writing.
- **Numeric string keys** come back as strings. If you key by UserId, `tostring` it consistently.

## Size budget

Measure, do not guess: `#HttpService:JSONEncode(data)` gives the byte size the docs use. Log it on save and alert at, say, 1 MB. Big contributors are usually per-item records with long field names; short keys (`id`, `lv`, `t`) and dropping default-valued fields can halve the size. A GUID is 36 characters, so 10,000 unique items with three short fields is roughly 0.6 MB, comfortable but worth watching (devforum UUID thread).

## Checklist

- [ ] One key per player, `userIds` set on every write.
- [ ] `schemaVersion` field from day one.
- [ ] DEFAULTS module + reconcile on load.
- [ ] No engine types, no mixed or sparse tables, numbers validated.
- [ ] Save size logged; alert threshold chosen.
- [ ] Derived values recomputed at load, not trusted from the save.

## Related
[[Data Backend - Hub]] · [[DataStore Session Locking, Retries, Versioning and Erasure]] · [[Save Schema Migrations]] · [[Clan and Guild Data - Multi-Writer Keys Without Lost Updates]]
