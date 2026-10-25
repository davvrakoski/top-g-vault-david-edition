---
area: "14 Testing and QA"
cluster: "Testing"
title: "Dupe Hunting Test Script - Trades, Gifts, Drops and Rejoins"
tags: [roblox, community-knowledge, testing, duplication, trading, inventory, exploits]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/cloud-services/data-stores
  - https://create.roblox.com/docs/reference/engine/classes/GlobalDataStore#UpdateAsync
  - https://create.roblox.com/docs/cloud-services/memory-stores
  - https://create.roblox.com/docs/studio/testing-modes
---
# Dupe Hunting Test Script - Trades, Gifts, Drops and Rejoins

An item duplication bug can wreck an economy in a weekend: once a dupe method spreads, rare items lose their value and players who traded fairly feel cheated. Dupes almost never need an exploit executor; they come from timing (leave at the right moment), from two servers holding the same player's data, or from a remote that can be fired twice before the first call finishes. The design defences are in [[Trading and Duplication Threat Model]] and [[Anti-Dupe Transaction Blueprint]]. This note is the **attack script** a tester runs to prove those defences work, with exact steps and what to count.

## Setup

- A staging universe with real DataStore saving (not a mock), and two or three tester accounts.
- A QA command to print an account's full inventory with a checksum (count per item ID), run before and after each case.
- A unique ID on every valuable item instance (UUID in the save) so "same item in two places" is detectable, not only "count went up".
- Server logging of each trade/gift with both inventories' checksums before and after.

The core assertion for every case: **sum of each item ID across all involved accounts is unchanged**, and no item UUID exists twice.

## Case list

### Timing on a single server

1. **Double confirm**: both players spam the accept button (an autoclicker or a QA macro firing the remote 20 times). Expect one trade.
2. **Change offer during countdown**: remove an item in the last second of a confirm countdown. Expect the trade to cancel or restart, never execute with the old offer.
3. **Equip during trade**: equip, sell, craft or drop an item that is currently offered. Expect it locked or the trade cancelled.
4. **Leave at commit**: one player closes the client the moment the trade completes. Rejoin both. Totals must match.
5. **Reset at commit**: same, but reset the character instead of leaving.

### Across servers

6. **Rejoin race**: trade away an item, then leave and immediately join a **different** server. If the new server loads the save before the old server finishes writing, the item comes back. Expect a session lock wait.
7. **Second device**: play on PC, trade an item away, then join a different server with the same account on a phone. The first session gets disconnected, so the old server's leave-save and the new server's load race each other. Expect the new server to wait for the lock, never load the pre-trade save.
8. **Teleport during trade**: accept a teleport (party invite to a match) while a trade window is open.

### Non-trade item flows

9. **Drop and pick up**: drop an item, both players touch it in the same frame. One owner only.
10. **Gift + refund**: gift an item to a friend, then trigger any "undo", "refund" or "return to sender" path.
11. **Mail/inbox claim**: claim an inbox reward on two devices at once.
12. **Purchase + leave**: buy an item with a developer product and leave before the receipt finishes; rejoin. Granted exactly once.
13. **Server shutdown mid-trade**: operator shuts down staging servers while trades are confirming (see [[Test - Server Lifecycle Chaos Pass - Shutdowns, Restarts and Rejoins]]).

## What the defences should look like when they pass

- Trades are committed by one server-side function that re-reads both inventories, checks every item is still present and unlocked, then writes.
- Data writes use `UpdateAsync` (read-modify-write with the current value), not blind `SetAsync` that can overwrite a newer save.
- A session lock (often in the save itself or a MemoryStore key) stops two servers owning one profile.
- Remotes are debounced per player and per trade ID on the server.

## Reporting

A dupe is severity 1. In the bug, include the case number, exact timing ("left within 0.5 s of the confirm"), checksums before and after, and the item UUIDs. Do not post dupe methods in public channels; keep them in the private tracker until fixed.

## Re-run triggers

Any change to inventory, trading, gifting, saving, session locking, teleports or receipt handling.

## Related

[[Testing - Hub]] · [[Trading and Duplication Threat Model]] · [[Anti-Dupe Transaction Blueprint]] · [[Exploit QA - Testing Like an Exploiter Inside Studio]]
