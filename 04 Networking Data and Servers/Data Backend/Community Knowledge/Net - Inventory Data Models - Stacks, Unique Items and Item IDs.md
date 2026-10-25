---
area: "04 Networking Data and Servers"
cluster: "Data Backend"
title: "Inventory Data Models - Stacks, Unique Items and Item IDs"
tags: [roblox, community-knowledge, data-backend, inventory, items, guid]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/HttpService#GenerateGUID
  - https://create.roblox.com/docs/cloud-services/data-stores/error-codes-and-limits
  - https://devforum.roblox.com/t/anti-item-dupe-system/2091062
  - https://devforum.roblox.com/t/best-method-of-storing-uuids/2133235
  - https://devforum.roblox.com/t/unique-serial-system-implementation/4023678
---
# Inventory Data Models - Stacks, Unique Items and Item IDs

An inventory has two kinds of things in it: **fungible** items where any copy equals any other (50 wood, 12 potions) and **unique** items that carry their own state (a sword with +3 enchant and 40% durability, a pet with a rolled trait). Storing both the same way is the root of most inventory pain: either you bloat the save with thousands of identical records, or you lose the per-item state that trading and anti-dupe work depend on. This note gives a data model that handles both and stays small.

## Three layers

1. **Definitions** (in code or a ModuleScript, never saved): `defId`, display name, icon, `maxStack`, `tradeable`, base stats. Changing a definition rebalances every copy at once.
2. **Stacks** (saved): `defId -> count`. One number per item type.
3. **Instances** (saved): `uid -> {d = defId, ...state}` for anything with its own state.

```lua
-- Shape of the saved inventory (short keys keep the JSON small)
inventory = {
	stacks = { wood = 50, potion_small = 12 },
	items = {
		["9F2C...E1"] = { d = "sword_iron", lv = 3, dur = 40, t = 1761350400 },
		["0B7A...4D"] = { d = "pet_dog", trait = "golden", t = 1761351000 },
	},
	slots = { "9F2C...E1", nil, nil }, -- hotbar holds uids, not copies
}
```

Rules that fall out of this:

- Equipment, hotbars and trade offers **reference** a uid. They never hold a copy of the item record. One item, one record, one place.
- A stack has no uid. If a fungible item gains state (a potion that can be "blessed"), the blessed one becomes an instance.
- `maxStack` is a UI rule for slot display; the save stores the total count. Splitting 250 arrows into stacks of 99 is a view, not data.

## Generating item IDs

`HttpService:GenerateGUID(false)` returns a 36-character version 4 (random) UUID without braces (32 hex digits plus dashes). The docs put the odds of any duplicate within 103 trillion UUIDs at one in a billion, so collisions are not a practical concern. Note that v4 UUIDs carry no timestamp and do not sort by time, so store a creation time yourself. Mint the uid **on the server, at the moment the item is created**, and store a creation time (`t`) with it. Never accept a uid from the client.

If you need a human-friendly serial number ("#27 of 500"), that is a separate counter problem, see [[Net - Serial Numbered Items - Atomic Counters for Limited Editions]].

## Operations as small pure functions

Write inventory changes as functions that take the inventory table and return success or a reason, with no yields. Then the same code runs inside `UpdateAsync` callbacks, trade commits and unit tests.

```lua
local Inventory = {}

function Inventory.addStack(inv, defId: string, n: number): (boolean, string?)
	if n <= 0 or n ~= math.floor(n) then return false, "bad_count" end
	inv.stacks[defId] = (inv.stacks[defId] or 0) + n
	return true
end

function Inventory.removeStack(inv, defId: string, n: number): (boolean, string?)
	local have = inv.stacks[defId] or 0
	if n <= 0 or have < n then return false, "not_enough" end
	inv.stacks[defId] = if have == n then nil else have - n
	return true
end

function Inventory.removeItem(inv, uid: string): (boolean, string?)
	if inv.items[uid] == nil then return false, "not_owned" end
	inv.items[uid] = nil
	for i, s in inv.slots do if s == uid then inv.slots[i] = nil end end
	return true
end

return Inventory
```

Remove the stack entry when the count reaches zero, so empty types do not pile up in the save.

## Size math

From the devforum UUID thread: a GUID is 36 characters, so roughly 100k bare GUIDs would fill the 4 MB key alone. With a few short fields per record, plan on 60-120 bytes per unique item. Measure with `#HttpService:JSONEncode(inventory)`. If one player can realistically own tens of thousands of unique items (collection games), cap storage (auto-convert duplicates to dust), or move cold items to a second key in the same store and load it on demand.

## Common mistakes

- Saving the Tool instance name list and rebuilding from it: no per-item state, no uids, nothing to audit.
- Letting the client send "equip this item record": the client sends a uid; the server looks it up.
- Two arrays (`itemNames`, `itemLevels`) kept in parallel: they will drift. One record per item.
- Deleting items by array index while other code holds the index. Key by uid.

## Related
[[Data Backend - Hub]] · [[Inventory and Equipment Blueprint]] · [[Net - Item Provenance and Dupe Audits - Mint Records and Duplicate-ID Scans]] · [[Trading and Duplication Threat Model]] · [[Net - Player Data Schema Design - Keys, Defaults and Size Budget]]
