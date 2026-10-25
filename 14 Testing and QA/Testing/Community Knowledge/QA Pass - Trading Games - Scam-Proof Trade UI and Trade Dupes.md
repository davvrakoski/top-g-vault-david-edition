---
area: "14 Testing and QA"
cluster: "Testing"
title: "QA Pass - Trading Games - Scam-Proof Trade UI and Trade Dupes"
tags: [roblox, community-knowledge, testing, qa, genre-qa, trading, scams, dupes]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/monetization/paid-random-items
  - https://create.roblox.com/docs/reference/engine/classes/PolicyService
  - https://create.roblox.com/docs/cloud-services/data-stores/best-practices
  - https://create.roblox.com/docs/cloud-services/memory-stores
  - https://devforum.roblox.com/t/rollback-option-for-trade/244770
---
# QA Pass - Trading Games - Scam-Proof Trade UI and Trade Dupes

In a trading game the items are the economy, and the trade window is the bank counter. Two kinds of failure matter: the player is tricked (the UI let a scam happen) or the server is tricked (a dupe or a trade of something already gone). The general dupe script in this vault covers the server side in depth; this pass focuses on the trade window and the genre-specific checks around it.

## Scams the UI must make impossible (or obvious)
- **Last-second swap.** The other player removes or swaps an item right before you press Accept. Any change to either side must reset both accepts and restart a short confirm countdown.
- **Look-alike items.** Two variants (shiny vs normal, a rare trait vs none, a different size) look the same at thumbnail size. The trade window must show every value-changing trait as text, not only as a colour.
- **Quantity tricks.** "x1" vs "x10" in small text, or stacks that merge visually. Show quantities large and on both sides.
- **Off-screen items.** The offer list scrolls and the scammer adds junk to push something out of view. Show a count of items per side and a summary list on the final confirm screen.
- **Fake system messages.** Players type "[SYSTEM] trade verified" in chat. Keep trade status inside the trade UI, never in chat.
- **Request spam.** Repeated trade requests pressure younger players. Add a cooldown, an "ignore requests from this player" option and a global "no trade requests" toggle.

## Dupe and integrity bugs this genre ships with
- Item traded while also equipped, listed in a shop, being fused, or in another open trade.
- Trade completes on one server while the same account is loading on another (no session lock).
- Save fails after the swap, so one side keeps both item sets after a rejoin.
- Accept remote fired twice in one frame runs the swap twice.

## Test checklist
1. Swap an item 0.1 s before the partner accepts. Both accepts must clear and the countdown restart.
2. Offer two near-identical variants. A tester who has never seen them must be able to tell them apart in the window.
3. Add 30 items to one side. The other side must see the count and the full list before final confirm.
4. Send 20 trade requests to one player in a minute. Rate limit and block option must work.
5. Equip, sell or fuse an item while it sits in an open trade. Trade must cancel or the action must be blocked.
6. Run the cross-server and rejoin cases from the Dupe Hunting note.
7. For a player whose `IsPaidItemTradingAllowed` is false, items bought or hatched with Robux-backed currency must not be offerable.

## Exploit angles
- Trade state lives on the server, with a version number that rises on every change; Accept carries the version the player saw (helper below).
- The swap is one atomic save that moves unique item ids, with a trade log entry (both UserIds, item ids, time).
- Lock items being traded in memory (and with session locking across servers) until the swap completes or cancels.

## Balance checks
- Watch the value of top items over the first week; a rapidly rising count of one rare id is either a dupe or a drop rate bug.
- If players use a trading value list, compare its top items against your own drop rates to spot items that are too common.

## Data and save checks
- Inventories store item ids, not counts per item type, for anything tradeable.
- Keep trade logs long enough to investigate reports; the DevForum has a long-standing request for rollback on platform trades, and inside your own game a log is what makes a manual reversal possible.

## Debug helper: version-checked accept
```lua
-- Server: each trade has a version; any offer change bumps it and clears accepts.
local function changeOffer(trade, player: Player, newItems: {string})
	trade.offers[player.UserId] = newItems
	trade.version += 1
	trade.accepted = {}
	trade.unlockAt = os.clock() + 3 -- confirm countdown restarts
end

local function accept(trade, player: Player, seenVersion: number): boolean
	if seenVersion ~= trade.version then
		warn(player.Name, "accepted an old version of the trade")
		return false
	end
	if os.clock() < trade.unlockAt then return false end
	trade.accepted[player.UserId] = true
	return true
end
```
The client must send the version it is showing; a stale version means the window changed after the player looked at it, which is exactly the last-second swap.

## Related
[[Testing - Hub]] - [[Test - Dupe Hunting Test Script - Trades, Gifts, Drops and Rejoins]] - [[Trading Economy Design - Trade Windows, Value and Policy Gates]] - [[Trading and Duplication Threat Model]] - [[Cross-Server Auction House - Order Book and Escrow]]
