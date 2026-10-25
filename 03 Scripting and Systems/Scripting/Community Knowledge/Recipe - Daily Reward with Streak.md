---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Daily Reward with Streak"
tags: [roblox, community-knowledge, scripting, recipe, luau, daily-reward, streak, datastore, updateasync, retention]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/GlobalDataStore
  - https://create.roblox.com/docs/cloud-services/data-stores/error-codes-and-limits
  - https://create.roblox.com/docs/cloud-services/data-stores/best-practices
  - https://create.roblox.com/docs/reference/engine/classes/RemoteFunction
---
# Recipe - Daily Reward with Streak

A "Claim daily reward" button that pays once per UTC day, grows over a 7-day streak, and resets the streak if a day is missed. Daily rewards are a standard retention hook (design advice in [[Streaks With Grace - Freezes, Repairs and Loss Aversion]]); the code side has to get three things right: the **server's clock** decides the day, the claim is written with **`UpdateAsync`** so two servers cannot both pay, and the reward is only granted **after** the write succeeded.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25). Enable **Game Settings > Security > Enable Studio Access to API Services** to test DataStores in Studio.

## Where it goes
| Script | Type | Location |
|---|---|---|
| `DailyReward` | Script | `ServerScriptService` |
| `DailyButton` | LocalScript | inside a `TextButton` in `StarterGui > DailyGui` |
| `ClaimDaily` | RemoteFunction | `ReplicatedStorage` (created by the server script) |

It pays into `leaderstats.Coins` (see [[First Leaderboard with leaderstats]]). Swap that line for your own currency module.

## Server
```lua
-- ServerScriptService/DailyReward (Script)
local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local store = DataStoreService:GetDataStore("DailyReward_v1")
local REWARDS = { 50, 75, 100, 125, 150, 200, 500 } -- day 1..7, then repeats
local SECONDS_PER_DAY = 86400

local claimRemote = Instance.new("RemoteFunction")
claimRemote.Name = "ClaimDaily"
claimRemote.Parent = ReplicatedStorage

local busy: {[Player]: boolean} = {}

local function utcDay(): number
	return math.floor(os.time() / SECONDS_PER_DAY) -- server clock, never the client's
end

local function withRetries(attempts: number, fn: () -> any): (boolean, any)
	local lastErr
	for i = 1, attempts do
		local ok, result = pcall(fn)
		if ok then return true, result end
		lastErr = result
		task.wait(2 ^ i) -- 2, 4, 8 s backoff
	end
	warn("DailyReward DataStore failed:", lastErr)
	return false, nil
end

local function grant(player: Player, amount: number)
	local stats = player:FindFirstChild("leaderstats")
	local coins = stats and stats:FindFirstChild("Coins")
	if coins then coins.Value += amount end
end

claimRemote.OnServerInvoke = function(player: Player)
	if busy[player] then return { ok = false, reason = "busy" } end
	busy[player] = true

	local today = utcDay()
	local result = nil -- filled in by the transform; reset on every retry of the transform
	local ok = withRetries(3, function()
		return store:UpdateAsync("u_" .. player.UserId, function(old)
			result = nil
			old = old or { lastDay = -1, streak = 0 }
			if old.lastDay == today then
				return nil -- already claimed today: cancel the write
			end
			local streak = if old.lastDay == today - 1 then old.streak + 1 else 1
			result = { streak = streak, amount = REWARDS[(streak - 1) % #REWARDS + 1] }
			return { lastDay = today, streak = streak }
		end)
	end)

	busy[player] = nil
	if not ok then
		return { ok = false, reason = "error" }
	end
	if not result then
		local secondsLeft = (today + 1) * SECONDS_PER_DAY - os.time()
		return { ok = false, reason = "claimed", nextIn = secondsLeft }
	end
	if player.Parent then
		grant(player, result.amount)
	end
	return { ok = true, streak = result.streak, amount = result.amount }
end

Players.PlayerRemoving:Connect(function(player)
	busy[player] = nil
end)
```

## Client
```lua
-- StarterGui/DailyGui/DailyButton/LocalScript
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local button = script.Parent :: TextButton
local claim = ReplicatedStorage:WaitForChild("ClaimDaily") :: RemoteFunction

button.Text = "Claim daily reward"
button.Activated:Connect(function()
	button.Active = false
	button.Text = "..."
	local ok, reply = pcall(claim.InvokeServer, claim)
	if not ok or type(reply) ~= "table" then
		button.Text = "Try again"
	elseif reply.ok then
		button.Text = `+{reply.amount} coins (day {reply.streak})`
	elseif reply.reason == "claimed" then
		local hours = math.ceil((reply.nextIn or 0) / 3600)
		button.Text = `Come back in {hours}h`
	else
		button.Text = "Servers busy, try later"
	end
	task.wait(2)
	button.Active = true
end)
```

## How to test
1. Turn on Studio API access, Play, click: `+50 coins (day 1)`. Click again: "Come back in Nh".
2. Simulate tomorrow: temporarily change `utcDay()` to `return math.floor(os.time() / SECONDS_PER_DAY) + 1` and click: day 2, 75 coins. Use `+ 3` instead: the streak resets to day 1.
3. Double-click fast: the `busy` flag returns "busy" for the second call; only one payment.
4. Two servers claiming at the same instant is hard to reproduce in Studio (test players get different fake user IDs). Reason it through instead: the second `UpdateAsync` re-runs its transform on the fresh value, sees `lastDay == today`, and cancels.
5. Remove the temporary offset before publishing.

## Common mistakes
- **Using the client's clock** or passing the date from the client. Players change their device clock. The server's `os.time()` is the only truth.
- **Granting before the save succeeds.** If the write fails and you already paid, the player can claim again later.
- **`GetAsync` then `SetAsync`.** Two servers can both read "not claimed" and both pay. `UpdateAsync` re-runs the transform when the key changed underneath it.
- **Yielding inside the transform.** The callback must not yield (`task.wait`, other DataStore calls).
- **A separate store forever.** This standalone key is fine to start, but coins saved elsewhere can be lost on a crash while the claim is recorded. In production keep `lastDay`/`streak` inside the main player profile, saved with session locking (see [[DataStore Session Locking, Retries, Versioning and Erasure]]).
- Midnight UTC is not midnight for your players; say "resets in Nh" in the UI instead of naming a time.

## Related
[[Scripting - Hub]] · [[Streaks With Grace - Freezes, Repairs and Loss Aversion]] · [[First DataStore Save - Load, Save, Leave and Shutdown]] · [[DataStore Session Locking, Retries, Versioning and Erasure]]
