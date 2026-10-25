---
area: "01 Start Here"
cluster: "Start Here"
title: "First pcall - Handling Calls That Can Fail"
tags: [roblox, community-knowledge, start-here, pcall, errors, luau, datastore]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/globals/Luau globals
  - https://create.roblox.com/docs/cloud-services/data-stores/error-codes-and-limits
  - https://create.roblox.com/docs/reference/engine/classes/MarketplaceService
---
# First pcall - Handling Calls That Can Fail

Some code fails even when you wrote it perfectly: a call that goes over the internet to Roblox servers (saving data, checking a game pass, awarding a badge, teleporting) can time out or be rate-limited. If you call it normally and it errors, **your whole script stops** at that line. For a save script that means lost progress; for a join script it means a player with no leaderboard. `pcall` ("protected call") runs a function, catches the error, and lets your script decide what to do next.

## What pcall gives back

```lua
local ok, result = pcall(function()
	return 10 / 2
end)
print(ok, result) --> true 5

local ok2, err = pcall(function()
	error("something broke")
end)
print(ok2, err) --> false  ...something broke
```

- First value: `true` if no error happened, `false` if one did.
- After that: the function's return values on success, or the **error message** on failure.

## Which calls need it

Wrap calls that talk to Roblox web services. Their names usually end in **Async**:

| Service | Examples |
| --- | --- |
| DataStoreService | `GetAsync`, `SetAsync`, `UpdateAsync`, `RemoveAsync` |
| MarketplaceService | `UserOwnsGamePassAsync`, `GetProductInfoAsync` |
| BadgeService | `AwardBadgeAsync`, `UserHasBadgeAsync` |
| Players | `GetUserIdFromNameAsync`, `GetUserThumbnailAsync` |
| TeleportService | `TeleportAsync` |
| HttpService | `GetAsync`, `PostAsync`, `RequestAsync` |

Ordinary code (math, setting properties, your own functions) does **not** need pcall. If that errors, it is a bug to fix, not a network hiccup to survive.

## Pattern 1: check a game pass safely

```lua
local MarketplaceService = game:GetService("MarketplaceService")
local VIP_PASS = 0000000 -- your pass ID

local function ownsVip(player: Player): boolean
	local ok, owns = pcall(function()
		return MarketplaceService:UserOwnsGamePassAsync(player.UserId, VIP_PASS)
	end)
	if not ok then
		warn("Pass check failed for", player.Name, owns) -- 'owns' holds the error here
		return false
	end
	return owns
end
```

Decide what failure means: here "not owned for now", and you can check again later (for example when they open the shop).

## Pattern 2: retry a save

```lua
local function saveWithRetry(store, key, data)
	for attempt = 1, 3 do
		local ok, err = pcall(function()
			store:SetAsync(key, data)
		end)
		if ok then return true end
		warn(("Save attempt %d failed: %s"):format(attempt, tostring(err)))
		task.wait(2 ^ attempt) -- wait 2, 4, 8 seconds
	end
	return false
end
```

Waiting longer after each failure ("backoff") gives a busy service time to recover instead of hammering it. Data stores have per-server request limits listed on the official error-codes page; retry loops without waits hit them fast.

## Short form

You can pass the method and its object directly instead of writing a wrapper function:

```lua
local ok, value = pcall(store.GetAsync, store, key)
```

Note the object is passed as the first argument, because `store:GetAsync(key)` really means `store.GetAsync(store, key)`.

## Pattern 3: did loading really work?

The most important pcall in any game is the **load**. If loading fails and you then save, you overwrite the player's real data with an empty table.

```lua
local ok, data = pcall(store.GetAsync, store, key)
if not ok then
	player:SetAttribute("DataLoaded", false)
	player:Kick("Could not load your data, please rejoin.") -- or retry first
	return
end
player:SetAttribute("DataLoaded", true)
-- later: only save if DataLoaded is true
```

## Mistakes to avoid

- **Wrapping everything in pcall** to make red errors go away. You hide real bugs and spend hours wondering why nothing happens. Use it only around calls that can fail for outside reasons.
- **Ignoring the result.** `pcall(save)` on its own line throws the error away. Always look at `ok` and log `err` with `warn`.
- **Treating `nil` as failure.** `GetAsync` on a new player returns `ok = true` and `value = nil`. That is "no data yet", not an error.
- **Yielding forever.** pcall does not add a timeout; a call that hangs still hangs.

## Going further

`xpcall(func, handler)` works like pcall but runs `handler(err)` on failure, which is handy with `debug.traceback` to log where the error happened. Use it for logging systems; plain pcall is enough for a first game.

## Related
[[00 START HERE - Top G Vault]] · [[First DataStore Save - Load, Save, Leave and Shutdown]] · [[Debugging Basics - Output, print, warn and Breakpoints]] · [[Data store error codes and limits]] · [[Save and Purchase Reliability Lab]]
