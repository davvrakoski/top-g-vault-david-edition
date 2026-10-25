---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Racing - Time Trial Leaderboards with OrderedDataStore"
tags: [roblox, community-knowledge, vehicles, racing, leaderboards, datastore]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/OrderedDataStore
  - https://create.roblox.com/docs/cloud-services/data-stores/error-codes-and-limits
  - https://create.roblox.com/docs/reference/engine/classes/GlobalDataStore
---
# Racing - Time Trial Leaderboards with OrderedDataStore

A lap-time board is different from a coins board: **lower is better**, every track needs its own board, and a single faked time ruins it for everyone. General leaderboard design (weekly resets, display boards) lives in [[Leaderboard Blueprint]] and [[Weekly and Seasonal Leaderboards with OrderedDataStore]]; this note is the racing-specific part.

## Store milliseconds as integers

`OrderedDataStore` only stores **integers**. Save lap time in milliseconds: 63.418 s becomes `63418`. Then read the board with `GetSortedAsync(true, pageSize)`: `ascending = true` puts the fastest time first. `pageSize` defaults to 50 and is capped at 100.

## One ordered store per track and class

```lua
local DataStoreService = game:GetService("DataStoreService")

local function boardFor(trackId: string, class: string)
	-- e.g. "TT_Canyon_A" ; bump the version suffix to reset a board after a track change
	return DataStoreService:GetOrderedDataStore("TT_" .. trackId .. "_" .. class .. "_v1")
end
```

Splitting by car class (A/B/S or "stock" vs "tuned") keeps boards meaningful. If you edit a track layout, old times are invalid: bump the version suffix instead of deleting keys.

## Write only personal bests, with UpdateAsync

```lua
local function submitLap(player: Player, trackId: string, class: string, ms: number)
	local store = boardFor(trackId, class)
	local ok, err = pcall(function()
		store:UpdateAsync(tostring(player.UserId), function(old)
			if old ~= nil and old <= ms then
				return nil -- not a PB: cancel the write
			end
			return ms
		end)
	end)
	if not ok then warn("TT submit failed", err) end
end
```

Returning `nil` from the transform cancels the write, so non-PB laps cost very little. Also keep the PB in the player's normal profile so the HUD can show it without reading the ordered store.

## Anti-cheat before you submit

Only the server submits, and only for laps where:

1. The server's own lap timer measured the lap (from gate crossings, see [[Kart Racing Systems - Checkpoints, Laps, Boost Pads and Respawn]]).
2. All gates were crossed in order, no server-initiated teleport happened mid-lap (respawn invalidates the lap).
3. The time is above a hand-set floor per track (e.g. 90% of the developer's best). Below the floor: log, do not submit.
4. The car's max speed during the lap stayed under the class cap.

Keep a small "flagged laps" log in a regular DataStore so you can review and remove bad entries with `RemoveAsync` on the ordered store.

## Reading and showing the board

- Read the top 50-100 at server start and then every 60-120 s; cache it in a `ReplicatedStorage` value or send it to clients on request. Never call `GetSortedAsync` per player.
- Convert user IDs to names with `Players:GetNameFromUserIdAsync` (cache results; it yields).
- Format times as `m:ss.mmm`:

```lua
local function fmt(ms: number): string
	return string.format("%d:%02d.%03d", ms // 60000, (ms // 1000) % 60, ms % 1000)
end
```

- Show the player's own rank only if they are in the cached page; otherwise show "PB 1:03.418" without a rank. Ordered stores cannot cheaply tell you "you are 12,345th".

## Ghosts for the top times

Store the ghost lap (see [[Racing - Ghost Cars - Recording and Replaying CFrame Laps]]) in a normal DataStore keyed by `trackId/class/userId`, written at the same time as the PB. Then "race the world record" is: read the top entry, fetch that user's ghost key.

## Checklist

- [ ] Milliseconds as integers, `ascending = true`.
- [ ] One board per track and class, versioned names.
- [ ] `UpdateAsync` that cancels non-PB writes.
- [ ] Server-measured, validated laps only; flagged-lap log.
- [ ] Cached reads, formatted `m:ss.mmm`.

## Related
[[Vehicles - Hub]] · [[Leaderboard Blueprint]] · [[Weekly and Seasonal Leaderboards with OrderedDataStore]] · [[Racing - Ghost Cars - Recording and Replaying CFrame Laps]]
