---
area: "13 Growth and Monetization"
cluster: "Analytics Discovery"
tags: [deep-dive, roblox, analytics, funnels, custom-events, dashboards, alerts]
verified: 2026-10-25
cssclasses: [tg-a13]
---

# Analytics Custom Events, Funnels and Dashboards Setup

## Why this matters
Roblox's built-in dashboards tell you *that* retention or revenue moved. Only your own events tell you *why*: which tutorial step loses people, which weapon nobody uses, where shoppers abandon a purchase.
`AnalyticsService` gives you free economy, funnel and custom events, a custom dashboard builder and alerting. It also has hard limits (cardinality caps, rate limits, server-only sending) that quietly ruin data if you design events carelessly.

---

## 1. Ground rules (documented)

- Events can only be sent **from the server** and only **in published games**. Nothing is recorded from the client or from Studio playtests.
- Charts take **about 24 hours** to populate. Use the **View Events** button on the Economy, Funnel or Custom pages for a near-real-time list while you test.
- Log **after** a successful operation (a completed purchase, a finished quest), never on the attempt.
- Data **rolls off 90 days** after the last data received for that event.
- Limits reset daily. If you exceed them, new events work again the next day once you stop.

### The limits table (Analytics › Event types)

| Limit | Value |
|---|---|
| Global rate limit (all AnalyticsService calls) | **120 + 20 × CCU per minute** |
| Custom fields | **3** (`CustomField01–03`), values are strings |
| Unique custom-field values | Unlimited, but after **8,000 combined** they group as "Other" |
| Economy resource (currency) types | **10** in this table; the Economy page says the dashboard supports **5**. Plan for 5 |
| Economy transaction types | After **20** they group as "Other" |
| Economy item SKUs | After **100** they group as "Other" |
| Funnels | **10** |
| Steps per funnel | **100** |
| Custom event names | **100** |

**Design rule:** keep names low-cardinality and put variety in custom fields. Use `PlantSeed` with field `Plant - Turnip`, not `PlantTurnip`, `PlantCabbage`... Use `XP` as a currency with field `Class - Mage`, not `MageXP`.

---

## 2. Custom events: what to track

`AnalyticsService:LogCustomEvent(player, eventName, value?, customFields?)`
- **Counter** (no value) = value 1. Good for "button clicked", "quest started".
- **With value**: durations, scores, counts. Also use it to **batch** ("10 zombies killed" once instead of 10 events), which keeps you under the rate limit.
- Aggregations available on the **Explore** page: count, unique users, average, sum, min, max, average per user, all breakable by custom fields.

A starter tracking plan (fits well inside 100 names):

| Event | Value | Fields | Answers |
|---|---|---|---|
| `UIOpened` | — | screen name | Which menus get used |
| `QuestCompleted` | duration s | quest id, difficulty | Which quests are too long |
| `MatchEnded` | score | mode, map, result | Balance and map popularity |
| `ItemUsed` | — | item category, item id | Dead content |
| `PlayerDied` | — | cause, zone | Difficulty spikes |
| `SettingsChanged` | — | setting name | Accessibility needs |
| `TutorialSkipped` | step | — | FTUE friction |

---

## 3. Funnels: onboarding, progression and shop

Two methods:
- `LogOnboardingFunnelStepEvent(player, step, stepName?, customFields?)` for the one-time FTUE funnel.
- `LogFunnelStepEvent(player, funnelName, funnelSessionId?, step, stepName?, customFields?)` for named funnels, one-time or recurring.

Documented behaviour you must design around:
- A funnel **starts at its first logged step**. To start on join, log step 1 in `PlayerAdded`.
- **Repeats** of a step are ignored by the funnel but still count against the rate limit.
- **Skipping** to step 3 marks steps 1–2 complete, so don't log late steps speculatively.
- Filters and cohorts apply to the **first step** only (device, date).
- A user's saved step **expires after 180 days** without funnel events; they then count as new.
- For **recurring** funnels (the shop), pass a `funnelSessionId`: a GUID per shop visit, or `"<userId>-<itemId>"` for multi-session upgrade paths. Only the **10 most recent** session IDs per user per funnel are tracked.
- After changing step definitions, set the dashboard date range to start **after** the change; a warning appears on changed steps.
- Validate client-reported steps on the server (exploiters can send `step = 10`).

```lua
-- ServerScriptService/Analytics/ShopFunnel.luau
local AnalyticsService = game:GetService("AnalyticsService")
local HttpService = game:GetService("HttpService")

local ShopFunnel = {}
local sessions: {[Player]: string} = {}

function ShopFunnel.opened(player: Player)
	sessions[player] = HttpService:GenerateGUID(false)
	AnalyticsService:LogFunnelStepEvent(player, "Shop", sessions[player], 1, "Opened")
end

function ShopFunnel.viewedItem(player: Player, category: string)
	local id = sessions[player]; if not id then return end
	AnalyticsService:LogFunnelStepEvent(player, "Shop", id, 2, "ViewedItem",
		{ [Enum.AnalyticsCustomFieldKeys.CustomField01.Name] = category })
end

function ShopFunnel.promptShown(player: Player)
	local id = sessions[player]; if not id then return end
	AnalyticsService:LogFunnelStepEvent(player, "Shop", id, 3, "PromptShown")
end

-- Call from your receipt handler AFTER the grant is saved
function ShopFunnel.purchased(player: Player)
	local id = sessions[player]; if not id then return end
	AnalyticsService:LogFunnelStepEvent(player, "Shop", id, 4, "Purchased")
	sessions[player] = nil
end

game:GetService("Players").PlayerRemoving:Connect(function(p) sessions[p] = nil end)
return ShopFunnel
```

Suggested 10-funnel budget: Onboarding, Shop, Progression (zones/levels), Season pass, Crafting, Daily quests, Social (invite → friend joined), Settings (opened → changed), Event participation, and one spare for experiments.

---

## 4. Economy events
Use `LogEconomyEvent` for every source and sink with the post-transaction balance (full pattern in [[Economy Sources and Sinks Spreadsheet Model]]). The Economy page gives sources vs sinks, average wallet (all, payers, non-payers), top sources/sinks and an all-sources table, filterable by up to three custom fields.

---

## 5. A thin wrapper that enforces the rules

```lua
-- ServerScriptService/Analytics/Analytics.luau
local AnalyticsService = game:GetService("AnalyticsService")
local RunService = game:GetService("RunService")

local Analytics = {}
local ALLOWED = { -- your whole custom-event catalogue (≤100 names)
	UIOpened = true, QuestCompleted = true, MatchEnded = true,
	ItemUsed = true, PlayerDied = true, SettingsChanged = true, TutorialSkipped = true,
}

local function fields(f1: string?, f2: string?, f3: string?)
	local t = {}
	if f1 then t[Enum.AnalyticsCustomFieldKeys.CustomField01.Name] = f1 end
	if f2 then t[Enum.AnalyticsCustomFieldKeys.CustomField02.Name] = f2 end
	if f3 then t[Enum.AnalyticsCustomFieldKeys.CustomField03.Name] = f3 end
	return t
end
Analytics.fields = fields

function Analytics.custom(player: Player, name: string, value: number?, f1: string?, f2: string?, f3: string?)
	if not ALLOWED[name] then
		warn("[Analytics] unknown event", name) -- protects the 100-name budget
		return
	end
	if RunService:IsStudio() then
		print("[Analytics:dry-run]", player.Name, name, value, f1, f2, f3) -- Studio doesn't record events
		return
	end
	local ok, err = pcall(AnalyticsService.LogCustomEvent, AnalyticsService, player, name, value, fields(f1, f2, f3))
	if not ok then warn("[Analytics]", err) end
end

return Analytics
```

Keep the `ALLOWED` table in your [[Analytics Event Naming Standard]] note and review it before every release.

---

## 6. Custom dashboards

Under **Custom dashboards** in your experience's left navigation (Creator Docs › Custom dashboards):
- Up to **20 dashboards** per experience, visible to anyone on the team with analytics permission.
- Add widgets from scratch, from **Explore** (*Add to dashboard*), or from another dashboard's chart menu.
- **Summary cards** show one number (average over the period, most recent value, or cumulative), which is ideal for a KPI header row: daily revenue, D1 retention, peak CCU.
- Set default time range, breakdowns, annotations and granularity.
- **A dashboard is only saved when you click Publish.** Leaving without publishing loses changes.
- **Pin to sidebar** for daily-use dashboards.

Suggested three dashboards:

| Dashboard | Widgets |
|---|---|
| **Daily Health** | DAU, peak CCU, D1, session time, crash rate, revenue (summary cards) + 14-day trend |
| **Economy Health** | Sources vs sinks, average wallet (payers vs non-payers), top sinks, shop funnel |
| **LiveOps** | Event participation funnel, event custom events by day, revenue by SKU during the event, D7 for event cohort |

---

## 7. Alerts (catch regressions before reviews do)

From Creator Docs › Alerts:
- Available to experiences that qualify for performance metrics (**100+ DAU**). Up to **20 alerts** per experience. Configured under **Configurations › Alerts**.
- Metrics: client frame rate, client crash rate, client memory (GB and %), unexpected out-of-memory exits, server CPU time, server frame rate, server memory, concurrent users, session time, and data store metrics.
- Triggers: **metric value** (static threshold) or **period over period** (week over week, day over day, hour over hour).
- **Duration** 1–10 consecutive evaluations; **minute** granularity requires at least 5. Severity: critical / medium / low.
- **Breakdown** evaluates each segment separately (one alert for iOS/Android/PC instead of three).
- Delivery via experience-level **webhooks** (*Configurations › Webhooks*, optional secret, **Test Response** button). The payload's `EventPayload.AlertMessage` is a JSON **string** whose `summary` contains "fired" or "recovered".

Starter alerts:

| Alert | Condition | Duration | Severity |
|---|---|---|---|
| High client crash rate (breakdown: platform) | value > baseline × 2 | 5 (minute) | Critical |
| CCU drop | hour over hour < −40% | 3 (hour) | Critical |
| Server memory high | value > your measured p95 + margin | 5 | Medium |
| Session time drop | day over day < −20% | 2 (day) | Medium |

The docs recommend setting thresholds from **7–14 days of baseline** (for example a 1.2% normal crash rate → alert at 2.5–3%), using duration ≥5 for volatile metrics, and naming alerts `metric - context` ("High client crash rate - mobile").

> [!note] Chat webhooks
> Roblox sends its own JSON format. Some chat tools expect a specific payload (Discord, for example, needs a `content` or `embeds` field). If **Test Response** works but nothing appears in your channel, put a small relay in between that reformats `AlertMessage` for that tool. I couldn't confirm from the docs that a raw Discord webhook URL displays these messages directly.

---

## 8. Beyond the dashboard
- **Open Cloud analytics APIs** exist for pulling metrics into your own tools (see Creator Docs › Cloud › Analytics guides).
- `AnalyticsService` also lists progression methods (`LogProgressionStartEvent`, `LogProgressionCompleteEvent`, `LogProgressionFailEvent`, `LogProgressionEvent`). Check their reference pages for current dashboard support before building around them.

---

## Common mistakes
- Testing events in Studio and assuming they're broken because the dashboard is empty.
- Firing events from LocalScripts.
- Encoding item names into event names (blows the 100-name cap) instead of custom fields.
- Logging on attempt rather than success.
- Recurring funnels without `funnelSessionId`, so every shop visit after the first is ignored.
- Changing funnel steps without adjusting the date range.
- Building a dashboard and closing the tab without **Publish**.
- Alerts with duration 1 on volatile metrics (alert fatigue), or no alerts at all.

## Checklist
- [ ] Event catalogue written down (≤100 custom names, ≤10 funnels, ≤5 currencies)
- [ ] Wrapper enforces the allow-list, server-only, success-only logging
- [ ] Onboarding funnel + shop funnel with `funnelSessionId` live
- [ ] Custom fields used for variety; string values only
- [ ] Batching for high-frequency events; rate limit estimated at peak CCU
- [ ] View Events verified after the first publish
- [ ] Daily Health, Economy and LiveOps dashboards published and pinned
- [ ] Crash, CCU and memory alerts with baseline-derived thresholds and a working delivery channel

---

**Sources checked (2026-10-25):** Creator Docs: Analytics › Event types; Custom events; Funnel events; Economy events; Custom fields; Custom dashboards; Alerts; Engine API: AnalyticsService (LogCustomEvent, LogFunnelStepEvent, LogOnboardingFunnelStepEvent, LogEconomyEvent, progression methods).

**Related:** [[Analytics Discovery - Hub]] · [[Analytics Event Naming Standard]] · [[Analytics Instrumentation Plan]] · [[Analytics Wrapper]] · [[Monetization Analytics and Segmentation]] · [[Analytics Onboarding Lab]]
