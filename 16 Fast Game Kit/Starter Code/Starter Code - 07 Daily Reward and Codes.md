---
area: "16 Fast Game Kit"
cluster: "Starter Code"
tags: [fast-game-kit, roblox, starter-code, daily-reward, codes]
cssclasses: [tg-a16]
verified: 2026-10-25
---

# Starter Code - 07 Daily Reward and Codes

## Why this matters
A daily streak gives players a reason to come back tomorrow, and codes turn every social post and update log into a reason to open the game. Both are classic dupe targets if the server trusts the client's clock or forgets what was already claimed.
`Rewards` keeps all state in player data, uses the server's UTC day, and records each claim in the same frame as the grant. It also includes a playtime coin drip that doubles with the VIP pass.

## Rules

| System | Rule |
|---|---|
| Daily day | `os.time() // 86400`: a UTC calendar day, the same on every server. Resets at 00:00 UTC |
| Streak | Claimed yesterday: streak + 1. Missed a day (or first claim): back to day 1. Rewards cycle through `GameConfig.Daily.Rewards` (7 by default) |
| Daily claim | One per UTC day; `lastClaimDay` and `streak` set in the same frame as the coins |
| Codes | Server-only list in `ServerConfig.Codes`; input upper-cased with spaces removed; optional `Expires` (Unix seconds, UTC); one use per player, stored in `redeemedCodes` |
| Code remote | Max 32 bytes, valid UTF-8, rate `0.2/s` burst 3: brute-forcing a code list is impractical |
| Playtime | `Coins` every `IntervalSeconds` while in the server; multiplied by `VipMultiplier` with the VIP pass |

## The code

`Source/src/server/Services/Rewards.luau`

```lua
--!strict
-- Rewards: daily login streak, redeemable codes and a playtime coin drip.
-- Days are UTC calendar days from os.time(), so every server agrees on "today".

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GameConfig = require(ReplicatedStorage.Shared.GameConfig)
local Remotes = require(ReplicatedStorage.Shared.Remotes)
local ServerConfig = require(script.Parent.Parent.ServerConfig)
local PlayerData = require(script.Parent.PlayerData)
local Currency = require(script.Parent.Currency)
local Monetization = require(script.Parent.Monetization)
local Analytics = require(script.Parent.Analytics)

local Check = Remotes.Check

local SECONDS_PER_DAY = 86400
local MAX_CODE_LENGTH = 32

export type DailyStatus = {
	canClaim: boolean,
	streak: number, -- streak you have now (or will have after claiming)
	reward: number, -- coins for the next claim
	secondsUntilNext: number, -- 0 when claimable
}

export type RewardResult = { ok: boolean, message: string }

local function today(): number
	return os.time() // SECONDS_PER_DAY
end

local function rewardForStreak(streak: number): number
	local rewards = GameConfig.Daily.Rewards
	return rewards[((streak - 1) % #rewards) + 1]
end

local function nextStreak(lastClaimDay: number, streak: number): number
	-- Claimed yesterday: continue. Anything older (or never): start again at day 1.
	return if lastClaimDay == today() - 1 then streak + 1 else 1
end

local Rewards = {}

function Rewards.GetDailyStatus(data: PlayerData.Data): DailyStatus
	local daily = data.daily
	if daily.lastClaimDay >= today() then
		return {
			canClaim = false,
			streak = daily.streak,
			reward = rewardForStreak(daily.streak + 1),
			secondsUntilNext = (today() + 1) * SECONDS_PER_DAY - os.time(),
		}
	end
	local streak = nextStreak(daily.lastClaimDay, daily.streak)
	return { canClaim = true, streak = streak, reward = rewardForStreak(streak), secondsUntilNext = 0 }
end

function Rewards.ClaimDaily(player: Player): RewardResult
	local data = PlayerData.GetData(player)
	if not data then
		return { ok = false, message = "Your data is still loading" }
	end
	local status = Rewards.GetDailyStatus(data)
	if not status.canClaim then
		local hours = math.ceil(status.secondsUntilNext / 3600)
		return { ok = false, message = ("Come back in about %d h"):format(hours) }
	end
	-- Record the claim before granting; both happen with no yield in between.
	data.daily.lastClaimDay = today()
	data.daily.streak = status.streak
	Currency.Add(player, status.reward, Enum.AnalyticsEconomyTransactionType.TimedReward.Name, "DailyReward")
	Analytics.Custom(player, "DailyClaimed", status.streak)
	return { ok = true, message = ("Day %d: +%d %s"):format(status.streak, status.reward, GameConfig.Currency.Name) }
end

local function normalizeCode(raw: string): string
	return (string.upper(raw):gsub("%s", ""))
end

function Rewards.RedeemCode(player: Player, raw: string): RewardResult
	local data = PlayerData.GetData(player)
	if not data then
		return { ok = false, message = "Your data is still loading" }
	end
	local code = normalizeCode(raw)
	local info = ServerConfig.Codes[code]
	if not info then
		return { ok = false, message = "That code does not exist" }
	end
	if info.Expires and os.time() >= info.Expires then
		return { ok = false, message = "That code has expired" }
	end
	if data.redeemedCodes[code] then
		return { ok = false, message = "You already used that code" }
	end
	data.redeemedCodes[code] = os.time() -- same frame as the grant
	Currency.Add(player, info.Coins, Enum.AnalyticsEconomyTransactionType.Gameplay.Name, "Code")
	Analytics.Custom(player, "CodeRedeemed", info.Coins, code)
	return { ok = true, message = ("Code redeemed: +%d %s"):format(info.Coins, GameConfig.Currency.Name) }
end

local function playtimeLoop(player: Player)
	local config = GameConfig.Playtime
	while player.Parent == Players do
		task.wait(config.IntervalSeconds)
		if player.Parent ~= Players then
			break
		end
		local multiplier = if Monetization.OwnsPass(player, config.VipPassKey) then config.VipMultiplier else 1
		Currency.Add(player, config.Coins * multiplier, Enum.AnalyticsEconomyTransactionType.Gameplay.Name, "Playtime")
	end
end

function Rewards.Start()
	Remotes.Server.OnInvoke("ClaimDaily", { args = {}, rate = 0.5, burst = 2 }, function(player: Player): RewardResult
		return Rewards.ClaimDaily(player)
	end)

	Remotes.Server.OnInvoke("GetDailyStatus", { args = {}, rate = 1, burst = 3 }, function(player: Player): DailyStatus?
		local session = PlayerData.AwaitLoaded(player, 30)
		return if session then Rewards.GetDailyStatus(session.data) else nil
	end)

	-- Codes are guessable by brute force: keep this limit strict.
	Remotes.Server.OnInvoke(
		"RedeemCode",
		{ args = { Check.String(MAX_CODE_LENGTH) }, rate = 0.2, burst = 3 },
		function(player: Player, raw: string): RewardResult
			return Rewards.RedeemCode(player, raw)
		end
	)

	PlayerData.OnLoaded(function(player: Player)
		playtimeLoop(player) -- OnLoaded callbacks run in their own thread, so this may loop
	end)
end

return Rewards
```

## How to use

- **Change rewards:** edit `GameConfig.Daily.Rewards` (any length; day 8 wraps to day 1).
- **Add a code:** add `NEWCODE = { Coins = 200, Expires = <unix seconds> }` to `ServerConfig.Codes` and ship an update (codes are read at boot). Get Unix seconds for a UTC date from any epoch converter, or in Studio's command bar: `print(DateTime.fromUniversalTime(2027, 1, 1).UnixTimestamp)`.
- **Codes without an update:** move the table to a live config (Experience Configs via `ConfigService`, see [[Experiments and Configs - In-Game A-B Testing]]) or a data store, and keep the same checks ([[Promo Codes - Redeem System With Live Configs and Abuse Guards]]).
- **Client side:** `ClaimDaily`, `GetDailyStatus` and `RedeemCode` are `RemoteFunction`s returning `{ ok, message }` (status returns `canClaim`, `streak`, `reward`, `secondsUntilNext`). The HUD's Daily button and the shop's code box already call them (note 08).
- **Other rewards than coins:** set fields on `data` in the same frame as the claim record, then `PlayerData.MarkDirty`.

## Common mistakes

- **Using the client's clock or `tick()`** for days. The client can change its clock, and the docs warn `tick()` is inconsistent across time zones and operating systems. Use server `os.time()`.
- **A rolling 24 h cooldown and a calendar-day streak mixed up.** This kit uses calendar days (UTC); a rolling cooldown lets players drift and confuses "claim tomorrow".
- **Granting before recording** with a yield in between (a save, a remote call): two quick requests both pass the check. Record and grant in one frame.
- **Codes in `GameConfig`** (replicated, readable by exploiters before you announce them).
- **Case-sensitive codes.** Players type `welcome`; normalize input and keep keys uppercase.
- **No expiry on launch codes.** Old codes keep inflating the economy years later.
- **Playtime rewards that pay AFK farms forever.** Cap them, or require activity, if your economy is sensitive.

## Checklist

- [ ] Claim works once; second claim the same day says "Come back in about N h".
- [ ] Streak continues across days and resets after a missed day (test by editing `lastClaimDay` in a Studio session).
- [ ] Each code works once per player, expired codes fail, wrong case works.
- [ ] Spamming `RedeemCode` gets rate-limited (no reply), and no code is granted twice.
- [ ] Reward amounts fit the economy model ([[Economy Sources and Sinks Spreadsheet Model]]).

**Related:** [[Starter Code - Hub]] · [[Recipe - Daily Reward with Streak]] · [[Daily and Weekly Reward Blueprint]] · [[Promo Codes - Redeem System With Live Configs and Abuse Guards]] · [[Starter Code - 03 Leaderstats and Currency]] · [[Starter Code - 05 Remotes Layer]]
