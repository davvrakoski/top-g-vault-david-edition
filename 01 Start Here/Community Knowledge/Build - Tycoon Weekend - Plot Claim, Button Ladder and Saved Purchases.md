---
area: "01 Start Here"
cluster: "Start Here"
title: "Build - Tycoon Weekend - Plot Claim, Button Ladder and Saved Purchases"
tags: [roblox, community-knowledge, start-here, weekend-build, tycoon]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/scripting/attributes
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
  - https://create.roblox.com/docs/reference/engine/classes/Players
  - https://create.roblox.com/docs/cloud-services/data-stores
  - https://create.roblox.com/docs/scripting/debounce
---
# Build - Tycoon Weekend - Plot Claim, Button Ladder and Saved Purchases

[[First Tycoon Dropper - Dropper, Conveyor and Collector]] gets one dropper earning money. A tycoon people play for an hour needs three more things: each player gets their own plot, a **ladder** of buy buttons that appear one after another, and purchases that come back next session. This weekend plan builds exactly those, with one data-driven script so that adding button 30 takes 30 seconds, not a new script. Design depth for later: [[Tycoon Genre Breakdown - Droppers, Button Ladders and Pacing]].

## The weekend scope

| In | Cut (later) |
|---|---|
| 4 plots, claim on join | Plot selection menu, plot themes |
| 1 currency (Cash), collector pays the owner | Second currency, rebirth |
| 15-20 buttons in a ladder | Branching ladders, decorations shop |
| 3 dropper tiers + walls, floor, upgrader | Gamepasses (2x cash, auto-collect) |
| Owned list saved and rebuilt on join | Offline earnings |

## Day 1 - plots and the ladder (about 5 hours)

1. **One plot template (1.5 h).** In `ServerStorage/PlotTemplate`, build a model with three folders: `Items` (every buildable thing, already built: droppers, walls, stairs), `Buttons` (flat neon parts, each with a `BillboardGui` named `Label`), and the dropper line from the first dropper note. Keep it on a 4-stud grid ([[Modular Kits and Grid Snapping in Studs]]).
2. **Button attributes (45 min).** On every button set `Unlocks` (the item name it builds), `Price`, and `Requires` (the item that must be owned first; leave empty on the first button). This turns the ladder into data you can read in the Properties window.
3. **Claiming (1.5 h).** Four anchored base pads in Workspace. On join, give the player the first free pad, clone the template onto it with `PivotTo`, and store `player:SetAttribute("Plot", pad.Name)`. On leave, destroy the clone. The pattern is in [[Tycoon Plot Layout and Plot Assignment]].
4. **Core script (1.5 h).** Below. Test with one player that buttons appear in order.

## Day 2 - money, saving and pacing (about 5 hours)

1. **Collector pays the owner (45 min).** The collector finds the plot's owner by the `Plot` attribute instead of by who touched it.
2. **Saving (2 h).** Save the owned set as an array of item names plus Cash. On join, load first, then build the plot with that set so bought items appear instantly. [[First DataStore Save - Load, Save, Leave and Shutdown]], [[Starter - First pcall - Handling Calls That Can Fail]].
3. **Pacing pass (1.5 h).** Each button should take roughly 1.3-1.6x longer to afford than the one before; place a new dropper every 4-5 buttons so income jumps. Play your own ladder start to end with a stopwatch.
4. **Performance (45 min).** Cap dropped parts per plot and destroy them at the collector; see [[Speed - Case Study - Fixing a Laggy Tycoon]].

> **Code status:** original example, not run in Studio. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## The core script: one ladder for every plot

```lua
-- ModuleScript ServerScriptService/Ladder
local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")
local Ladder = {}

function Ladder.setup(plot, player, owned) -- owned = {[itemName] = true}
	local stash = Instance.new("Folder")
	stash.Name = player.UserId .. "_Stash"
	stash.Parent = ServerStorage
	for _, item in plot.Items:GetChildren() do
		if not owned[item.Name] then item.Parent = stash end
	end

	local function refresh()
		for _, button in plot.Buttons:GetChildren() do
			local needs = button:GetAttribute("Requires")
			local show = not owned[button:GetAttribute("Unlocks")]
				and (needs == nil or needs == "" or owned[needs] == true)
			button.Transparency = if show then 0 else 1
			button.CanTouch = show
			button.Label.Enabled = show
		end
	end

	for _, button in plot.Buttons:GetChildren() do
		local busy = false
		button.Touched:Connect(function(hit)
			if busy or not button.CanTouch then return end
			if Players:GetPlayerFromCharacter(hit.Parent) ~= player then return end
			local cash = player.leaderstats.Cash
			local price = button:GetAttribute("Price")
			if cash.Value < price then return end
			busy = true
			cash.Value -= price
			local name = button:GetAttribute("Unlocks")
			owned[name] = true
			stash[name].Parent = plot.Items
			refresh()
			busy = false
		end)
	end
	refresh()
	return stash -- destroy it when the player leaves
end

return Ladder
```

Notes on the choices: hidden items live in ServerStorage, so clients do not even load them (less memory, no exploit peeking). The owner check means friends cannot spend your money by stepping on your buttons. `CanTouch = false` stops hidden buttons firing `Touched` at all. The `busy` flag is a debounce ([[Events and Connections for Beginners - Connect, Once, Wait and Debounce]]).

## What to cut when you run late

- Plot claiming with pads: give each player a plot by join order and skip the "claim" door.
- Upgraders (parts that multiply drop value): add next weekend.
- Label text: show only the price, not names.

## How to test

- [ ] Server and Clients with 3 players: each gets a different plot. Set the server size to 4 in Game Settings so there is never a player without a plot.
- [ ] Player B steps on player A's button: nothing happens.
- [ ] Buy 5 buttons, leave, rejoin: the same 5 items are built and the next button is showing.
- [ ] Leave the server: the plot is cleared and a new joiner gets it clean.
- [ ] Output shows no "Label is not a valid member" errors (every button needs its Label).

## Related
[[00 START HERE - Top G Vault]] - [[Simulator Tycoon Starter Architecture]] - [[Case Study - Theme Park Tycoon 2]] - [[Tycoon Starters - Factorial Defense and Industry Tycoon (MIT)]]
