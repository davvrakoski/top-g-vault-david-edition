---
area: "01 Start Here"
cluster: "Start Here"
title: "Build - Pet Collector Weekend - Eggs, Shown Odds, Follow Pets and Saving"
tags: [roblox, community-knowledge, start-here, weekend-build, pets, eggs, odds-disclosure]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/monetization/paid-random-items
  - https://create.roblox.com/docs/reference/engine/classes/PolicyService
  - https://create.roblox.com/docs/reference/engine/datatypes/Random
  - https://create.roblox.com/docs/physics/constraints/align-position
  - https://create.roblox.com/docs/cloud-services/data-stores
  - https://devforum.roblox.com/t/how-do-you-make-a-pet-system/658463
---
# Build - Pet Collector Weekend - Eggs, Shown Odds, Follow Pets and Saving

Hatching eggs for pets is one of the most popular systems on Roblox, and also one of the most regulated. An egg is a **random item**: if it can be bought with Robux, directly or through something bought with Robux, Roblox requires you to show every possible outcome and its real odds **before** the purchase, and to check `PolicyService` for players in regions where paid random items are restricted. The safe beginner design is simple: one odds table that drives both the odds display and the actual roll, so they can never disagree. This plan builds coin eggs, an odds panel, a hatch reveal, pets that follow you, and saving. Policy details: [[Paid Random Items, Odds Disclosure and PolicyService]] and [[Policy - Paid Random Items - Odds Disclosure Checklist]].

## The weekend scope

| In | Cut (later) |
|---|---|
| 1 egg (coins), 4 pets, weights shown as % | Many eggs, shiny/golden variants |
| Odds panel visible before buying | Luck boosts (they change shown odds) |
| Hatch animation, 1 at a time | Triple hatch, auto hatch passes |
| Equip up to 3 following pets | Pet stats, fusing, trading |
| Inventory saved, 50 pet limit | Robux eggs (do these last, with the checklist) |

You need a coin source; the click loop from [[Build - Simulator Weekend - Click, Collect, Sell, Upgrade]] works well.

## Day 1 - odds, roll, reveal (about 5 hours)

1. **Odds table (30 min).** A ModuleScript in ReplicatedStorage, read by the server for the roll and by the client for the odds panel. Code below.
2. **Egg stand (1 h).** An egg model on a pedestal with a ProximityPrompt "Hatch (100 Coins)" and a BillboardGui that lists every pet with its percent, computed from the same table. Percents must sum to 100; if you round, say so ("odds rounded").
3. **Server roll (2 h).** Core script below: price, cooldown, inventory limit, weighted roll with `Random`. Weighted picks explained: [[Weighted Random Selection]] and [[Weighted Loot Table]].
4. **Reveal (1.5 h).** The server fires `HatchResult` with the pet name; the client plays a shake, a flash and shows the pet in a ViewportFrame. [[Character Preview in a ViewportFrame - WorldModel Pattern]].

## Day 2 - follow pets, saving, policy (about 5 hours)

1. **Pet models (1 h).** Simple, round, readable at 10 studs: [[Model - Cute Stylized Pets - Proportions, Topology and Rig-Ready Shapes]].
2. **Follow (1.5 h).** Equipped pets float beside the player. Doing it on each client (every client moves every visible pet) is smooth and costs no server physics. [[Companion and Pet Follower AI]].
3. **Saving (1.5 h).** Save the pet list as an array of `{id = "Dog", uid = "..."}` entries plus which are equipped. [[Net - Inventory Data Models - Stacks, Unique Items and Item IDs]], [[First DataStore Save - Load, Save, Leave and Shutdown]]. If players can rename pets, filter the names: [[Text Filtering in Practice - Pet Names, Signs and Offline Authors]].
4. **Policy gate (1 h).** Even for a coin egg, add the check below now, so adding a Robux egg or "buy coins" later is safe. When restricted, hide the egg's Robux option and keep the free path.

> **Code status:** original example, not run in Studio. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## The core script: one table, one roll, one gate

```lua
-- ReplicatedStorage/EggOdds (ModuleScript): the UI and the server both read this
return {
	Starter = {price = 100, pets = {
		{name = "Dog",           weight = 60},
		{name = "Cat",           weight = 30},
		{name = "Bunny",         weight = 9},
		{name = "Golden Dragon", weight = 1},
	}},
}
```

```lua
-- ServerScriptService/Hatching
local Players = game:GetService("Players")
local PolicyService = game:GetService("PolicyService")
local RS = game:GetService("ReplicatedStorage")
local EggOdds = require(RS.EggOdds)
local rng = Random.new()
local MAX_PETS, COOLDOWN = 50, 1.5
local lastHatch, restricted = {}, {}

Players.PlayerAdded:Connect(function(player)
	local ok, info = pcall(PolicyService.GetPolicyInfoForPlayerAsync, PolicyService, player)
	-- if the call fails, assume restricted (the safe default)
	restricted[player] = not ok or info.ArePaidRandomItemsRestricted
	player:SetAttribute("RandomItemsRestricted", restricted[player])
end)
Players.PlayerRemoving:Connect(function(p) lastHatch[p], restricted[p] = nil, nil end)

local function roll(egg)
	local total = 0
	for _, pet in egg.pets do total += pet.weight end
	local r = rng:NextNumber(0, total)
	for _, pet in egg.pets do
		r -= pet.weight
		if r < 0 then return pet.name end
	end
	return egg.pets[#egg.pets].name
end

local result = Instance.new("RemoteEvent")
result.Name = "HatchResult"
result.Parent = RS

local function tryHatch(player, eggName) -- called from the egg's ProximityPrompt
	local egg = EggOdds[eggName]
	if not egg or os.clock() - (lastHatch[player] or 0) < COOLDOWN then return end
	local pets = player:FindFirstChild("Pets") -- Folder of StringValues
	local coins = player.leaderstats.Coins
	if not pets or #pets:GetChildren() >= MAX_PETS or coins.Value < egg.price then return end
	lastHatch[player] = os.clock()
	coins.Value -= egg.price
	local name = roll(egg)
	local entry = Instance.new("StringValue")
	entry.Name = name
	entry.Parent = pets
	result:FireClient(player, name)
end

workspace.StarterEgg.ProximityPrompt.Triggered:Connect(function(player)
	tryHatch(player, "Starter")
end)
```

The odds panel on the client is just `pet.weight / total * 100` from the same module, so changing a weight changes the roll and the display together. The `restricted` flag is what you check before showing or selling anything random for Robux. If you later add luck boosts, the boosted odds must be shown while the boost is active: [[Luck Multipliers - How Boosts Change the Odds You Must Show]]. A 1 percent pet takes on average 100 hatches; if that feels cruel, read [[Pity Timers and Pseudo-Random Distribution]] (and disclose any pity rule too).

## What to cut when you run late

- The ViewportFrame reveal: show the name in big text with a sound.
- Follow pets: show owned pets in a list only.
- Never cut the odds panel. It is required whenever randomness touches Robux, and it is good practice even for coin eggs.

## How to test

- [ ] Temporarily add a loop at the bottom of the script that calls `roll(EggOdds.Starter)` 10,000 times and prints the counts: about 6000 / 3000 / 900 / 100.
- [ ] The odds panel shows 60% / 30% / 9% / 1% and sums to 100%.
- [ ] Hatch with 99 coins: refused. Hatch at 50 pets: refused with a "Inventory full" message.
- [ ] Spam the prompt: one hatch per 1.5 s.
- [ ] Rejoin: pets and equipped pets return.
- [ ] Before any Robux egg: go through [[Policy - Paid Random Items - Odds Disclosure Checklist]] and [[Testing Purchases - Developer Products, Passes and ProcessReceipt]].

## Related
[[00 START HERE - Top G Vault]] - [[Case Study - Pet Simulator 99]] - [[Case Study - Adopt Me]] - [[Policy - PolicyService Compliance - Loot Boxes, Trading, Ads and Regions]]
