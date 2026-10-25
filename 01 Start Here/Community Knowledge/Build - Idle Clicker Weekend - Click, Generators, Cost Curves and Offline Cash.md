---
area: "01 Start Here"
cluster: "Start Here"
title: "Build - Idle Clicker Weekend - Click, Generators, Cost Curves and Offline Cash"
tags: [roblox, community-knowledge, start-here, weekend-build, idle, clicker, economy]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/scripting/events/remote
  - https://create.roblox.com/docs/scripting/attributes
  - https://create.roblox.com/docs/cloud-services/data-stores
  - https://create.roblox.com/docs/reference/engine/libraries/os
  - https://create.roblox.com/docs/ui/list-flex-layouts
---
# Build - Idle Clicker Weekend - Click, Generators, Cost Curves and Offline Cash

An idle clicker is a numbers game in a menu: click for money, buy generators that earn money per second, each copy costs a bit more than the last, and the game keeps paying (a little) while you are away. It is the purest economy exercise on Roblox and needs almost no 3D work, which makes it a good weekend build for someone who wants to practise UI and server-owned data. Unlike the walk-around simulator in [[Build - Simulator Weekend - Click, Collect, Sell, Upgrade]], everything happens in one screen, so the numbers must carry the fun. Read [[Incremental Cost Curves - Exponential Costs and Bulk Buy Math]] before tuning.

## The weekend scope

| In | Cut (later) |
|---|---|
| 1 click button | Click combos, critical clicks |
| 3-5 generators with rising cost | Upgrades that multiply generators |
| Server tick every second | Prestige / rebirth |
| Save + capped offline earnings | Events, daily rewards |
| Numbers like 12.4K, 3.1M | Achievements, leaderboards |

## Day 1 - the economy on the server (about 5 hours)

1. **Data shape (30 min).** Per player: `cash` (a number), `owned` (an array of counts, one per generator). Everything else is computed. [[Net - Player Data Schema Design - Keys, Defaults and Size Budget]].
2. **Core script (2.5 h).** Below: click, buy, tick, mirror to attributes for the UI.
3. **UI (2 h).** A big click button, a cash label, a "per second" label, and one row per generator with name, owned count and price. Use a `UIListLayout` so adding generator 6 is copy-paste. [[First GUI Button - ScreenGui, TextButton and Activated]], [[Responsive UI Layouts - UIListLayout, UIGridLayout and Flex]]. Format numbers with [[Number Abbreviation for Simulator UIs]].

## Day 2 - saving, offline cash and pacing (about 5 hours)

1. **Save (1.5 h).** Save `{cash, owned, savedAt = os.time()}` on leave, on shutdown and every 2 minutes. [[First DataStore Save - Load, Save, Leave and Shutdown]].
2. **Offline earnings (1 h).** On load: `away = math.clamp(os.time() - savedAt, 0, 8 * 3600)`, then pay `away * perSecond * 0.5`, and show a "While you were away" popup. Use server time only; never trust a client clock. Details and exploits: [[Offline Earnings - Idle Rewards Without Clock Exploits]].
3. **Pacing (1.5 h).** Target: first generator in under 15 seconds of clicking, second generator within 3 minutes, third around 15 minutes. Each generator should earn roughly 8-10x the one before and cost roughly 10-12x. Write your numbers in a table first: [[Economy Sources and Sinks Spreadsheet Model]].
4. **Feel (1 h).** A pop on click, a pulse when you can afford something, a buy sound. [[Recipe - Notification Toasts from the Server]].

## The core script

```lua
-- ServerScriptService/Idle
local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")

local GEN = {
	{name = "Lemonade", base = 10,   rate = 1},
	{name = "Bakery",   base = 120,  rate = 8},
	{name = "Factory",  base = 1400, rate = 70},
}
local GROWTH, CLICK_GAP = 1.15, 0.08
local data = {} -- [player] = {cash, owned, lastClick}

local function cost(i, owned) return math.floor(GEN[i].base * GROWTH ^ owned) end
local function perSecond(d)
	local sum = 0
	for i, g in GEN do sum += g.rate * d.owned[i] end
	return sum
end
local function push(player) -- attributes replicate to the client UI
	local d = data[player]
	player:SetAttribute("Cash", d.cash)
	player:SetAttribute("PerSecond", perSecond(d))
	for i in GEN do
		player:SetAttribute("Owned" .. i, d.owned[i])
		player:SetAttribute("Price" .. i, cost(i, d.owned[i]))
	end
end
local function remote(name)
	local r = Instance.new("RemoteEvent")
	r.Name = name
	r.Parent = RS
	return r
end

Players.PlayerAdded:Connect(function(p)
	data[p] = {cash = 0, owned = {0, 0, 0}, lastClick = 0} -- replace with loaded data
	push(p)
end)
Players.PlayerRemoving:Connect(function(p) data[p] = nil end) -- save first

remote("Click").OnServerEvent:Connect(function(p)
	local d = data[p]
	if not d or os.clock() - d.lastClick < CLICK_GAP then return end
	d.lastClick = os.clock()
	d.cash += 1
	push(p)
end)

remote("Buy").OnServerEvent:Connect(function(p, i)
	local d = data[p]
	if not d or type(i) ~= "number" or not GEN[i] then return end
	local price = cost(i, d.owned[i])
	if d.cash < price then return end
	d.cash -= price
	d.owned[i] += 1
	push(p)
end)

while true do
	task.wait(1)
	for p, d in data do
		d.cash += perSecond(d)
		push(p)
	end
end
```

`GROWTH = 1.15` is the classic incremental-game multiplier (each copy costs 15 percent more), which makes buying the cheapest generator less and less worth it and pushes players up the ladder. The click gap caps auto-clickers at about 12 clicks a second. Cash is a Luau number (a double), so it is exact up to 2^53; if you plan for numbers past that, read [[Big Numbers in Simulators - Doubles, 2^53 and Number Libraries]] before you save anything.

## What to cut when you run late

- Generators 4 and 5: three is enough to feel progress.
- The offline popup: pay silently and show it in the cash label.
- The 2-minute autosave: keep save on leave and on shutdown.

## How to test

- [ ] Auto-click for 60 s: cash from clicks is at most about 750.
- [ ] Fire `Buy(99)`, `Buy("x")` and `Buy(1.5)` from a client: all ignored without errors.
- [ ] Buy 10 Lemonades: price 10, 11, 13, 15... rises each time and matches the label.
- [ ] Leave for 5 minutes, rejoin in a published test place: offline cash is about `300 * perSecond * 0.5`.
- [ ] Set your device clock forward a day: nothing changes (server time only).
- [ ] Run [[QA - Testing Time-Based Features - Daily Rewards, Events and Clock Control]] for the offline path.

## Related
[[00 START HERE - Top G Vault]] - [[Offline Earnings - Idle Rewards Without Clock Exploits]] - [[Rebirth and Prestige Formulas - Pacing Resets That Feel Good]] - [[Economy - Inflation, Sources and Sinks]]
