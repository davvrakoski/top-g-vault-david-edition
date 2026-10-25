--!strict
-- Analytics: safe, budget-aware wrappers over AnalyticsService (server only).
-- Events are only recorded in published games; in Studio the calls are harmless.
-- Limits to respect (Analytics docs): 100 custom event names, 10 funnels, 100 steps per
-- funnel, 5 economy currencies on the dashboard, 20 transaction types, 100 item SKUs,
-- 8,000 combined custom-field values, and a global rate of 120 + 20 x CCU calls per minute.

local AnalyticsService = game:GetService("AnalyticsService")
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local GameConfig = require(ReplicatedStorage.Shared.GameConfig)

-- Your whole custom-event catalogue. Unknown names are dropped (protects the 100-name cap).
local CUSTOM_EVENTS: { [string]: boolean } = {
	DailyClaimed = true,
	CodeRedeemed = true,
	ShopItemBought = true,
	PassBought = true,
	SettingsChanged = true,
}

-- Your funnels (max 10). Step numbers start at 1.
local FUNNELS: { [string]: boolean } = {
	Shop = true,
}

local DEBUG_IN_STUDIO = true

local Analytics = {}

local function safeCall(label: string, fn: () -> ...any)
	if DEBUG_IN_STUDIO and RunService:IsStudio() then
		print("[Analytics] " .. label)
	end
	local ok, err = pcall(fn)
	if not ok then
		warn("[Analytics] " .. label .. " failed: " .. tostring(err))
	end
end

-- Build the customFields dictionary from up to three low-cardinality strings.
local function fields(field1: string?, field2: string?, field3: string?): { [string]: any }?
	if not (field1 or field2 or field3) then
		return nil
	end
	local result: { [string]: any } = {}
	if field1 then
		result[Enum.AnalyticsCustomFieldKeys.CustomField01.Name] = field1
	end
	if field2 then
		result[Enum.AnalyticsCustomFieldKeys.CustomField02.Name] = field2
	end
	if field3 then
		result[Enum.AnalyticsCustomFieldKeys.CustomField03.Name] = field3
	end
	return result
end

-- Custom event. `value` defaults to 1 (a counter); pass a number to aggregate (sum, avg...).
function Analytics.Custom(player: Player, eventName: string, value: number?, field1: string?, field2: string?, field3: string?)
	if not CUSTOM_EVENTS[eventName] then
		warn("[Analytics] unknown custom event '" .. eventName .. "': add it to CUSTOM_EVENTS")
		return
	end
	safeCall("custom " .. eventName, function()
		AnalyticsService:LogCustomEvent(player, eventName, value or 1, fields(field1, field2, field3))
	end)
end

-- Economy event for the soft currency. Call AFTER the balance changed.
-- transactionType: pass an Enum.AnalyticsEconomyTransactionType item's .Name ("IAP", "Shop",
-- "Gameplay", "ContextualPurchase", "TimedReward", "Onboarding") or your own (max 20 total).
function Analytics.Economy(
	player: Player,
	flowType: Enum.AnalyticsEconomyFlowType,
	amount: number,
	endingBalance: number,
	transactionType: string,
	itemSku: string?
)
	if amount <= 0 or endingBalance < 0 then
		return -- docs: amount is always positive, ending balance never negative
	end
	safeCall("economy " .. flowType.Name .. " " .. amount .. " " .. transactionType, function()
		AnalyticsService:LogEconomyEvent(
			player,
			flowType,
			GameConfig.Currency.Name,
			amount,
			endingBalance,
			transactionType,
			itemSku
		)
	end)
end

-- New id for one pass through a recurring funnel (one shop visit, one upgrade attempt...).
function Analytics.NewFunnelSession(): string
	return HttpService:GenerateGUID(false)
end

-- Step of a named funnel. Recurring funnels need the same funnelSessionId for every step.
function Analytics.FunnelStep(player: Player, funnelName: string, funnelSessionId: string?, step: number, stepName: string?)
	if not FUNNELS[funnelName] then
		warn("[Analytics] unknown funnel '" .. funnelName .. "': add it to FUNNELS")
		return
	end
	if step < 1 or step > 100 or math.floor(step) ~= step then
		return
	end
	safeCall("funnel " .. funnelName .. " step " .. step, function()
		AnalyticsService:LogFunnelStepEvent(player, funnelName, funnelSessionId, step, stepName)
	end)
end

-- One-time onboarding (FTUE) funnel. Repeated steps are ignored by Roblox; skipped steps
-- count as completed, so only log a step when the player really reached it.
function Analytics.OnboardingStep(player: Player, step: number, stepName: string)
	if step < 1 or step > 100 or math.floor(step) ~= step then
		return
	end
	safeCall("onboarding step " .. step, function()
		AnalyticsService:LogOnboardingFunnelStepEvent(player, step, stepName)
	end)
end

return Analytics
