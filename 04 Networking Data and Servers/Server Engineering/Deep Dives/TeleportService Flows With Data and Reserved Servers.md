---
area: "04 Networking Data and Servers"
cluster: "Server Engineering"
title: "TeleportService Flows With Data and Reserved Servers"
tags: [deep-dive, roblox, teleportservice, reserved-servers, multi-place, cross-server]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# TeleportService Flows With Data and Reserved Servers

**Why this matters:** every multi-place game (lobby to match, hub to dungeon, world to world) lives or dies on teleports, and teleports are where players lose items, get split from their party, land in the wrong server, or smuggle fake data.
This note covers the current API (`TeleportAsync` + `TeleportOptions`), the security model of teleport data, reserved-server patterns, the save/teleport ordering that prevents data loss, and a retry wrapper that handles the failures that do not throw.

---

## 1. Current API, and what is deprecated

From the TeleportService reference and teleport guide (as of 2026):

- **`TeleportService:TeleportAsync(placeId, players, teleportOptions?)`** is the all-purpose method. **Server only.**
- Up to **50 players** per call; group teleports only within one experience.
- `TeleportOptions` (create with `Instance.new("TeleportOptions")`):
  - `ServerInstanceId`: join a specific public server (a `JobId`).
  - `ReservedServerAccessCode`: join a specific reserved server.
  - `ShouldReserveServer = true`: create a new reserved server for this group.
  - `SetTeleportData(data)` / `GetTeleportData()`.
  - These targeting options conflict with each other; combining them errors.
- `TeleportService:ReserveServerAsync(placeId)` returns `(accessCode, privateServerId)`. Access codes **remain valid indefinitely**: joining a code with no running server starts a new one. (`ReserveServer` without Async is deprecated.)
- Client-side `TeleportService:Teleport()` and the older `TeleportToPlaceInstance`/`TeleportToPrivateServer`/`TeleportToSpawnByName` family are deprecated or not recommended for new work.
- `TeleportService.TeleportInitFailed(player, teleportResult, errorMessage, placeId, teleportOptions)` fires when a teleport that **did not throw** still failed.
- **Teleports do not work in Studio playtests.** You must test in a published game.

Reserved-server detection in the destination:

```luau
local isReserved = game.PrivateServerId ~= "" and game.PrivateServerOwnerId == 0
```

`PrivateServerId` is constant across every server instance that uses the same access code; `JobId` is not. Note that players on consoles with cross-play disabled can be placed in a different server with the same `PrivateServerId`; `game.MatchmakingType` distinguishes them.

---

## 2. Teleport data: what it is and is not

`SetTeleportData` sends a table to the destination. Read it on the server with `player:GetJoinData().TeleportData`, or on the client with `TeleportService:GetLocalPlayerTeleportData()`.

Security facts from the `GetJoinData` reference:

- Server-side `GetJoinData` only returns teleport data that was **sent by a Roblox server in the past 48 hours, with this player**, and its `SourcePlaceId`/`SourceGameId` are guaranteed accurate, so you can check the data came from **your** place.
- But the data is **transmitted through the client** and is **visible and unencrypted**. Roblox explicitly says it can still be abused and that sensitive data such as currency should travel through a secure channel like **Memory Stores**.

Practical rule:

| Put in TeleportData | Never put in TeleportData |
| --- | --- |
| Which spawn/door to arrive at | Currency, items, XP |
| Selected map or difficulty (re-validated) | "This player won", "this player is premium" |
| A match ID used to **look up** the real record | The roster itself as the only source of truth |
| UI hints (return-to-lobby button text) | Anything an exploiter would want to change |

Also useful in `GetJoinData()`: `SourcePlaceId`, and `Members` (UserIds teleported alongside the player as a group).

---

## 3. The save/teleport ordering problem

When a player teleports, the source server's `PlayerRemoving` fires **as they leave**, while the destination may already be loading their data. Without protection the destination reads stale data.

Correct ordering with session-locked data ([[DataStore Session Locking, Retries, Versioning and Erasure]]):

1. Source: **save before teleporting** (a normal autosave-style write, keeping the lock). This shrinks what the leave-save has to do.
2. Source: call `TeleportAsync`.
3. Source: on `PlayerRemoving`, final save and **release** the lock.
4. Destination: load tries to acquire the lock; if the source still holds it, wait and retry (the load loop's few-second retries cover this). It must never fall back to defaults.

With session locking, the worst case is a few seconds of "Loading your data" on arrival, never lost or duplicated items. Without it, teleports are a classic duplication route ([[Trading and Duplication Threat Model]]).

---

## 4. Flow A: lobby to a fresh match server (party stays together)

```luau
--!strict
-- Lobby server: send a whole party to a new reserved match server.
local TeleportService = game:GetService("TeleportService")
local MemoryStoreService = game:GetService("MemoryStoreService")
local HttpService = game:GetService("HttpService")

local MATCH_PLACE_ID = 0 -- your match place
local matches = MemoryStoreService:GetHashMap("Matches")

local SafeTeleport = require(script.Parent.SafeTeleport)

local function startMatch(party: { Player }, mapId: string)
	-- 1. Reserve a server first so we know its id before anyone moves.
	local ok, accessCode, privateServerId = pcall(function()
		return TeleportService:ReserveServerAsync(MATCH_PLACE_ID)
	end)
	if not ok then
		warn("ReserveServerAsync failed:", accessCode)
		return false
	end

	-- 2. Write the authoritative match record (secure; not client-visible).
	local roster = {}
	for _, p in party do
		table.insert(roster, p.UserId)
	end
	local matchId = HttpService:GenerateGUID(false)
	local wrote = pcall(function()
		matches:SetAsync(privateServerId, { matchId = matchId, mapId = mapId, roster = roster }, 3600)
	end)
	if not wrote then
		return false
	end

	-- 3. Save everyone (keeps their locks), then teleport.
	for _, p in party do
		PlayerDataService.SaveNow(p) -- your data service's non-releasing save
	end

	local options = Instance.new("TeleportOptions")
	options.ReservedServerAccessCode = accessCode
	options:SetTeleportData({ matchId = matchId, arriveAt = "TeamSpawn" }) -- hints only
	return SafeTeleport(MATCH_PLACE_ID, party, options)
end
```

Match server side:

```luau
--!strict
local Players = game:GetService("Players")
local MemoryStoreService = game:GetService("MemoryStoreService")
local matches = MemoryStoreService:GetHashMap("Matches")

local LOBBY_PLACE_ID = 0

local record = nil
local function getRecord()
	if record then
		return record
	end
	for _ = 1, 5 do
		local ok, value = pcall(function()
			return matches:GetAsync(game.PrivateServerId)
		end)
		if ok and value then
			record = value
			return record
		end
		task.wait(1)
	end
	return nil
end

Players.PlayerAdded:Connect(function(player)
	local r = getRecord()
	if not r or not table.find(r.roster, player.UserId) then
		-- Not invited (or the record is missing): send them home.
		player:Kick("This match is not available.")
		return
	end
	local joinData = player:GetJoinData()
	if joinData.SourcePlaceId ~= nil and joinData.SourcePlaceId ~= LOBBY_PLACE_ID then
		warn("Unexpected source place for", player.UserId)
	end
	-- Use joinData.TeleportData only for cosmetic hints like arriveAt.
end)
```

`ShouldReserveServer = true` is a shortcut for step 1 when you do not need the `privateServerId` in advance; `TeleportAsync` then returns a `TeleportAsyncResult` with `PrivateServerId` and `ReservedServerAccessCode`. Reserving first is better when other systems (matchmaking, spectating, rejoin) need the id before players arrive ([[MemoryStore Queues and Sorted Maps for Matchmaking]]).

---

## 5. Flow B: match back to lobby

- **Simple**: `TeleportAsync(LOBBY_PLACE_ID, players)` to public servers. Roblox matchmaking places them; parties of up to 50 sent in one call are kept together.
- **Return to the same lobby instance**: send the lobby `JobId` in teleport data on the way out and use `ServerInstanceId` on the way back. That server may be full or gone, so fall back to a plain public teleport on failure (`GameFull`, `GameEnded`).
- **Rejoin a running match** after a disconnect: store `accessCode` per player in a short-lived MemoryStore record keyed by UserId; the lobby offers "Rejoin" while the record exists.

---

## 6. A SafeTeleport that handles silent failures

Teleports can throw (bad arguments, service errors) **or** start successfully and fail later, firing `TeleportInitFailed`. Handle both, with different retry policies per `Enum.TeleportResult`:

```luau
--!strict
-- ServerScriptService/SafeTeleport.luau
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local ATTEMPTS = 4
local RETRY_DELAY = 2
local FLOOD_DELAY = 15

type PendingTeleport = { placeId: number, options: TeleportOptions?, attempts: number }
local pending: { [Player]: PendingTeleport } = {}

local function tryTeleport(placeId: number, players: { Player }, options: TeleportOptions?): boolean
	for attempt = 1, ATTEMPTS do
		local ok, err = pcall(function()
			TeleportService:TeleportAsync(placeId, players, options)
		end)
		if ok then
			return true
		end
		warn(("[SafeTeleport] attempt %d failed: %s"):format(attempt, tostring(err)))
		task.wait(RETRY_DELAY * attempt)
	end
	return false
end

local function SafeTeleport(placeId: number, players: { Player }, options: TeleportOptions?): boolean
	for _, p in players do
		pending[p] = { placeId = placeId, options = options, attempts = 0 }
	end
	return tryTeleport(placeId, players, options)
end

TeleportService.TeleportInitFailed:Connect(function(player, result, message, placeId, options)
	local entry = pending[player]
	if not entry or player.Parent ~= Players then
		return
	end
	entry.attempts += 1
	if entry.attempts > ATTEMPTS then
		pending[player] = nil
		warn("[SafeTeleport] giving up for", player.UserId, result, message)
		return -- tell the player via UI; they are still in this server
	end
	if result == Enum.TeleportResult.Flooded then
		task.wait(FLOOD_DELAY)
	elseif result == Enum.TeleportResult.Failure or result == Enum.TeleportResult.GameFull then
		task.wait(RETRY_DELAY)
	elseif result == Enum.TeleportResult.IsTeleporting then
		return -- already on the way
	else
		pending[player] = nil
		warn("[SafeTeleport] not retryable:", result.Name, message)
		return
	end
	-- Retry individually; the group may have been split by the failure.
	tryTeleport(entry.placeId, { player }, entry.options)
end)

Players.PlayerRemoving:Connect(function(player)
	pending[player] = nil
end)

return SafeTeleport
```

Note: `GameFull` on a **public** `ServerInstanceId` target should usually fall back to a plain public teleport rather than retrying the same full server.

---

## 7. Security settings that matter

From the teleport guide's secure teleportation section (Creator Dashboard **Access Control for Places** and per-place **Direct Access Control**):

- **Fully open**: any place reachable through any teleport, invites, joins.
- **Limited to same universe**: non-start places only via teleports within your game (client or server initiated).
- **Secure within universe only**: non-start places only through **server-initiated** teleports within the game. Use this when progression gates places, when places are only reached through reserved servers, or for test places players must not reach.

Even with secure settings, the destination must still **verify** the arrival against server-side state (the roster check above). Settings stop direct joins; they do not validate which match a player belongs in.

---

## 8. Custom loading screens

Call `TeleportService:SetTeleportGui(screenGui)` on the **client** before the teleport to show your own screen during the transition; scripts inside it do not run. On arrival, `TeleportService:GetArrivingTeleportGui()` in a `ReplicatedFirst` LocalScript returns it so you can keep showing it while the new place loads, then fade it out. Keep it lightweight: it is a transition, not a second loading system.

---

## Common mistakes

- Calling teleports from the client, or using deprecated `Teleport()`.
- Passing currency, rewards or roster truth in `TeleportData`.
- Teleporting before the player's data is saved, without session locking on arrival.
- Treating a `TeleportAsync` that returned as success; silent failures arrive via `TeleportInitFailed`.
- Retrying forever on `Flooded` without a delay, worsening the flood.
- No roster check on reserved servers, so anyone with an access code (or a stale one) joins.
- Testing teleports in Studio and concluding they are broken.
- Combining `ShouldReserveServer` with `ReservedServerAccessCode` or `ServerInstanceId`.

## Checklist

- [ ] All teleports go through a server-side SafeTeleport with throw and `TeleportInitFailed` handling.
- [ ] Data saved before teleport; destination load waits for the lock.
- [ ] TeleportData contains hints and IDs only; real state lives in MemoryStores/DataStores.
- [ ] Reserved match servers enforce a roster from a secure record keyed by `PrivateServerId`.
- [ ] Access control for non-start places set deliberately.
- [ ] Return-to-lobby and rejoin flows designed and tested in a published test universe.

**Related:** [[Server Engineering - Hub]] · [[Data, Saving and Cross-server Systems]] · [[Trading and Duplication Threat Model]] · [[DataStore vs MemoryStore vs Messaging vs Configs]] · [[Errors, Observability and Incident Response]]
