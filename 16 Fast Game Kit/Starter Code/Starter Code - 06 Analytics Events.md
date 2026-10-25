---
area: "16 Fast Game Kit"
cluster: "Starter Code"
tags: [fast-game-kit, roblox, starter-code, analytics, funnels]
cssclasses: [tg-a16]
verified: 2026-10-25
---

# Starter Code - 06 Analytics Events

## Why this matters
A fast game lives or dies on its first week of numbers: where new players drop, which rewards they claim, what they buy. Roblox gives you economy, funnel and custom events for free, but with hard caps that quietly fold your data into "Other" if names sprawl.
This wrapper makes every call safe (never throws), checks names against a fixed catalogue, and hard-codes the documented argument rules.

## Exact API (checked against the `AnalyticsService` reference)

| Wrapper | Engine call | Notes |
|---|---|---|
| `Analytics.Custom(player, name, value?, f1?, f2?, f3?)` | `LogCustomEvent(player, eventName, value = 1, customFields?)` | Max 100 event names |
| `Analytics.Economy(player, flowType, amount, endingBalance, transactionType, itemSku?)` | `LogEconomyEvent(player, flowType, currencyType, amount, endingBalance, transactionType, itemSku?, customFields?)` | `amount` > 0, `endingBalance` >= 0; `currencyType` is `GameConfig.Currency.Name` |
| `Analytics.FunnelStep(player, funnel, sessionId?, step, stepName?)` | `LogFunnelStepEvent(player, funnelName, funnelSessionId?, step = 1, stepName?, customFields?)` | Max 10 funnels, steps 1-100 |
| `Analytics.OnboardingStep(player, step, stepName)` | `LogOnboardingFunnelStepEvent(player, step, stepName?, customFields?)` | One-time FTUE funnel |

Custom fields use the keys `Enum.AnalyticsCustomFieldKeys.CustomField01.Name` to `CustomField03.Name` (strings `"CustomField01"`...). Flow types are `Enum.AnalyticsEconomyFlowType.Source` / `Sink`. Recommended transaction types are the `.Name` of `Enum.AnalyticsEconomyTransactionType` items: `IAP`, `Shop`, `Gameplay`, `ContextualPurchase`, `TimedReward`, `Onboarding`.

Limits (official **Event types** page): global rate **120 + 20 x CCU** requests per minute; 3 custom fields; after **8,000** combined custom-field values they group as "Other"; after **20** transaction types and **100** item SKUs, "Other"; **10** funnels, **100** steps each, **100** custom event names. Resource (currency) types: the limits table says 10, the `LogEconomyEvent` reference says 5, so plan for 5. Events are only recorded from the **server** in a **published** game, never from the client or Studio; charts fill in after about a day (use **View Events** for a near-live list while testing).

## The code

`Source/src/server/Services/Analytics.luau`

```lua
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
```

## How to use

- **Add a custom event:** add its name to `CUSTOM_EVENTS`, then `Analytics.Custom(player, "BossKilled", fightSeconds, bossName)`. Put variety in fields (`bossName`), never in the event name.
- **Economy:** you rarely call it directly; `Currency.Add` / `Spend` log every change (note 03).
- **Funnels:** add the funnel name to `FUNNELS`. For a recurring funnel (shop visits, upgrades), create one id per pass with `Analytics.NewFunnelSession()` and pass it to every step, as `Shop.luau` does (1 Opened, 2 Bought).
- **Onboarding:** call `Analytics.OnboardingStep(player, n, "Name")` at each FTUE milestone, in order. Repeats are ignored; skipping ahead marks earlier steps complete, so never log a step early.
- **What the kit logs out of the box:** economy events for playtime, daily rewards, codes, shop and IAP; custom events `DailyClaimed`, `CodeRedeemed`, `ShopItemBought`, `PassBought`, `SettingsChanged` (mutes only); the `Shop` funnel.
- Studio prints each call as `[Analytics] ...` so you can see what would be sent; set `DEBUG_IN_STUDIO = false` to silence it.

## Common mistakes

- **Logging from the client.** Not recorded. Send intent to the server, log there.
- **High-cardinality names** (`Bought_SpeedCoil_Level7`). Use a fixed event name with fields.
- **Logging attempts instead of outcomes.** Log after the purchase, claim or save succeeded.
- **One event per tiny action** (every coin pickup). Batch with a value ("collected 25") to stay inside the rate limit.
- **Changing funnel steps without resetting the date range.** Old and new steps mix; start the range after the change.
- **Trusting a client-reported funnel step** (`step = 10` skips the whole funnel). Steps here are chosen by server code only.
- **Using the old `Fire*` methods** (`FireCustomEvent`, `FireInGameEconomyEvent`...). They are deprecated; the `Log*` methods are current.

## Checklist

- [ ] Every event name is in `CUSTOM_EVENTS` and every funnel in `FUNNELS`; no `unknown custom event` warnings in Output.
- [ ] Onboarding steps defined for your FTUE (join, first action, first reward, first purchase prompt).
- [ ] After publishing, **View Events** on the Economy, Funnel and Custom pages shows your test events.
- [ ] A week-one dashboard planned ([[Your First Week of Analytics - Which Numbers to Read First]]).

**Related:** [[Starter Code - Hub]] · [[Analytics Custom Events, Funnels and Dashboards Setup]] · [[Analytics Wrapper]] · [[Analytics Event Naming Standard]] · [[Event types]] · [[Funnel events]] · [[Custom events]] · [[AnalyticsService]]
