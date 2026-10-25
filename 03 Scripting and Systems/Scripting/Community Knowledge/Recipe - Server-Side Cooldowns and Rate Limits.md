---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Server-Side Cooldowns and Rate Limits"
tags: [roblox, community-knowledge, scripting, recipe, luau, cooldown, rate-limit, token-bucket, remoteevent, security]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/scripting/security/security-tactics
  - https://create.roblox.com/docs/scripting/security/client-server-boundary
  - https://create.roblox.com/docs/scripting/events/remote
  - https://create.roblox.com/docs/chat/examples/rate-limit-public-text-inputs
---
# Recipe - Server-Side Cooldowns and Rate Limits

One small server module, `ActionGate`, that answers two questions for every remote: "has this player waited long enough since the last time?" (a **cooldown**) and "is this player sending too many requests overall?" (a **rate limit**, as a token bucket that allows short bursts). Client-side cooldowns are only for UI; an exploiter can fire a RemoteEvent thousands of times per second, so every action that costs or grants something needs its gate on the server. The thin design note [[Cooldown Module]] describes the idea; this is the copy-paste code.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Where it goes
| Script | Type | Location |
|---|---|---|
| `ActionGate` | ModuleScript | `ServerScriptService` |

## The module
```lua
-- ServerScriptService/ActionGate (ModuleScript)
local Players = game:GetService("Players")

local ActionGate = {}

type Bucket = { tokens: number, updated: number }
local cooldowns: {[Player]: {[string]: number}} = {}
local buckets: {[Player]: {[string]: Bucket}} = {}
local strikes: {[Player]: number} = {}

-- Cooldown: true if allowed (and starts the cooldown), else false + seconds left.
function ActionGate.cooldown(player: Player, action: string, seconds: number): (boolean, number)
	local now = os.clock()
	local mine = cooldowns[player]
	if not mine then
		mine = {}
		cooldowns[player] = mine
	end
	local readyAt = mine[action]
	if readyAt and now < readyAt then
		return false, readyAt - now
	end
	mine[action] = now + seconds
	return true, 0
end

-- Token bucket: up to `capacity` requests in a burst, refilled at `perSecond`.
function ActionGate.rate(player: Player, key: string, capacity: number, perSecond: number): boolean
	local now = os.clock()
	local mine = buckets[player]
	if not mine then
		mine = {}
		buckets[player] = mine
	end
	local b = mine[key]
	if not b then
		b = { tokens = capacity, updated = now }
		mine[key] = b
	end
	b.tokens = math.min(capacity, b.tokens + (now - b.updated) * perSecond)
	b.updated = now
	if b.tokens < 1 then
		strikes[player] = (strikes[player] or 0) + 1
		return false
	end
	b.tokens -= 1
	return true
end

function ActionGate.strikes(player: Player): number
	return strikes[player] or 0
end

-- Wrap a RemoteEvent: drops requests over the limit before your handler runs.
function ActionGate.guard(remote: RemoteEvent, capacity: number, perSecond: number,
	handler: (Player, ...any) -> ())
	remote.OnServerEvent:Connect(function(player, ...)
		if ActionGate.rate(player, remote.Name, capacity, perSecond) then
			handler(player, ...)
		end
	end)
end

Players.PlayerRemoving:Connect(function(player)
	cooldowns[player] = nil
	buckets[player] = nil
	strikes[player] = nil
end)

return ActionGate
```

## Using it
```lua
local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ActionGate = require(ServerScriptService:WaitForChild("ActionGate"))

-- 1) per-ability cooldown (fireball every 4 s)
local castRemote = ReplicatedStorage:WaitForChild("CastFireball") :: RemoteEvent
castRemote.OnServerEvent:Connect(function(player, aimDirection)
	if typeof(aimDirection) ~= "Vector3" then return end
	local ok, left = ActionGate.cooldown(player, "Fireball", 4)
	if not ok then return end -- optionally tell the UI `left`
	-- ...spawn the fireball on the server
end)

-- 2) overall flood protection on a chatty remote: bursts of 10, 5 per second sustained
ActionGate.guard(ReplicatedStorage:WaitForChild("ClickOrb") :: RemoteEvent, 10, 5, function(player)
	-- ...award one click
end)
```

## Picking numbers
| Action | Gate | Typical values |
|---|---|---|
| ability, dash, emote | cooldown | the design cooldown minus ~0.1 s for network jitter |
| shop buy, craft, team switch | cooldown | 0.5-5 s |
| simulator click, swing | token bucket | capacity 10-15, refill near the max human rate (~8-12/s) |
| any remote at all | token bucket via `guard` | capacity 30, refill 20/s as a safety net |

## How to test
1. Bind a key on the client that fires `CastFireball` and press it rapidly: the server acts at most once per 4 s.
2. From the client command bar: `for i = 1, 200 do game.ReplicatedStorage.ClickOrb:FireServer() end`. The handler runs about 10 times (the burst), then about 5 per second; `ActionGate.strikes(player)` climbs.
3. Leave and rejoin: tables are cleared (no memory growth). Check with a long soak test ([[Soak Tests - Long-Session Memory and Leak Checks]]).

## Common mistakes
- **`tick()` for timing.** The globals reference says `tick()` is not officially deprecated but can be off by up to a second and varies across time zones and OSes; use `os.clock()` for durations, as above.
- **Kicking on the first violation.** Lag bunches packets; count strikes and act on patterns ([[Exploit Strike Scores - Decaying Suspicion, Evidence Logs and Response Ladders]]).
- **Keying cooldowns by `player.Name`.** Use the Player object (cleared on leave) or `UserId`.
- **Order of checks.** Cheap type checks first, then the cooldown, then expensive work (raycasts, DataStore calls). That way a malformed packet does not burn the player's cooldown, and a flood cannot trigger the expensive part.
- **One global cooldown for all players.** Store per player, as above.

## Related
[[Scripting - Hub]] · [[Cooldown Module]] · [[DataStore Abuse Prevention - Remotes That Hit Your Budget]] · [[Exploit Strike Scores - Decaying Suspicion, Evidence Logs and Response Ladders]]
