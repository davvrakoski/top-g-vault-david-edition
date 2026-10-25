---
area: "04 Networking Data and Servers"
cluster: "Server Engineering"
title: "Custom Server Browser with MemoryStore and TeleportAsync"
tags: [roblox, community-knowledge, server-engineering, server-browser, memorystore, teleportservice]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/TeleportOptions
  - https://create.roblox.com/docs/reference/engine/classes/TeleportService#TeleportAsync
  - https://create.roblox.com/docs/cloud-services/memory-stores/sorted-map
  - https://create.roblox.com/docs/cloud-services/memory-stores/hash-map
  - https://devforum.roblox.com/t/how-would-i-be-able-to-recreate-retrostudios-server-system/3930779
---
# Custom Server Browser with MemoryStore and TeleportAsync

Roleplay games, hangouts and competitive lobbies often want a server list: pick a region-tagged server, a map, or "the one my squad is in". Roblox's own server list only shows basic info, so games build their own. The pieces are simple: every server **advertises** itself in a MemoryStore with a short TTL, a lobby **reads** the list, and a join uses `TeleportAsync` with `TeleportOptions.ServerInstanceId`. The older `TeleportToPlaceInstance` is marked deprecated in the API reference; do not start new code with it.

## Advertise (every game server)

Use a **sorted map** if you want the list ordered (by player count, by creation time) or a **hash map** if you only look servers up by key. A sorted map is a single partition, which is fine for a list read by a few lobby servers every few seconds; at very large scale, shard by map or region.

```lua
local MSS = game:GetService("MemoryStoreService")
local Players = game:GetService("Players")
local list = MSS:GetSortedMap("ServerList_" .. game.PlaceId)

local function advertise()
	local info = {
		jobId = game.JobId,
		players = #Players:GetPlayers(),
		max = Players.MaxPlayers,
		map = workspace:GetAttribute("MapName") or "Default",
		version = game.PlaceVersion,
	}
	pcall(function()
		-- sort key = player count so "most full first" is one range read
		list:SetAsync(game.JobId, info, 90, info.players)
	end)
end

task.spawn(function()
	while true do advertise(); task.wait(30) end
end)
game:BindToClose(function() pcall(list.RemoveAsync, list, game.JobId) end)
```

The 90-second TTL is the crash safety net: a server that dies silently disappears within a minute and a half. Also update on join/leave, but debounce to at most one write every few seconds.

## Read (lobby server, not clients)

The lobby server reads with `GetRangeAsync(Enum.SortDirection.Descending, 50)` every 5-10 s, filters (`players < max`, same `version`, not private), and sends the cleaned list to clients. Clients never touch MemoryStore. Every returned item costs a request unit, so read 50, not 200, and cache.

## Join

```lua
local TeleportService = game:GetService("TeleportService")

JoinRemote.OnServerEvent:Connect(function(player, jobId)
	if typeof(jobId) ~= "string" or #jobId > 64 then return end
	local entry = cachedList[jobId] -- only allow servers we advertised
	if not entry or entry.players >= entry.max then return end
	local options = Instance.new("TeleportOptions")
	options.ServerInstanceId = jobId
	local ok, err = pcall(TeleportService.TeleportAsync, TeleportService, game.PlaceId, { player }, options)
	if not ok then warn("Teleport failed", err) end
end)
```

Handle `TeleportInitFailed` too: the server may have filled up or shut down between listing and joining. Show "server full, refreshing" and refresh the list.

## Same-version servers

After an update, old servers keep running the old build. Store `game.PlaceVersion` in the entry and hide servers with a different version, or label them "old version". Teleports between versions can confuse players and break new features.

## Extras worth adding

- **Friends in server:** include a short list of userIds per server (cap at ~20) and let the lobby mark servers containing friends.
- **Server names:** generate a readable name from the JobId hash ("Amber Fox 12"), easier to share than a GUID.
- **Region:** Roblox does not expose a server's region directly; some games infer it from ping or an external geo-IP lookup through HttpService (unverified accuracy). Show ping from the client instead when possible.

## Pitfalls

- Letting clients send an arbitrary JobId and teleporting blindly: harmless mostly, but restrict to listed servers so players cannot join servers you hid (old versions, private matches).
- TTL longer than the refresh interval x 3 hides dead servers poorly; shorter than 2x the interval makes servers flicker off the list.
- Advertising reserved/private servers: skip advertising when `game.PrivateServerId ~= ""`.

## Related
[[Server Engineering - Hub]] - [[TeleportService Flows With Data and Reserved Servers]] - [[MemoryStore Queues and Sorted Maps for Matchmaking]] - [[Detecting Server Type - Public, Private, Reserved and Studio]]
