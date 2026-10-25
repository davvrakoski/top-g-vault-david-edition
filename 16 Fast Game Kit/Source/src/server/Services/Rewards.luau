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
