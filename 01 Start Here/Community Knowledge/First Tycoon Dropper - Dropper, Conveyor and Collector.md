---
area: "01 Start Here"
cluster: "Start Here"
title: "First Tycoon Dropper - Dropper, Conveyor and Collector"
tags: [roblox, community-knowledge, start-here, tycoon, dropper, first-project]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
  - https://create.roblox.com/docs/reference/engine/classes/Debris
  - https://create.roblox.com/docs/scripting/attributes
  - https://create.roblox.com/docs/players/leaderboards
  - https://coddy.tech/learn/courses/roblox_game_factory_tycoon/the_dropper
  - https://www.creation.dev/learn/how-to-make-tycoon-roblox
---
# First Tycoon Dropper - Dropper, Conveyor and Collector

The tycoon loop (a machine makes items, a belt carries them, a collector turns them into cash, cash buys more machines) is one of the most popular Roblox genres and a great second project after an obby. The core is only three small scripts. This note builds a single working dropper line with the pieces you will reuse in every tycoon: spawning parts on a timer, a moving conveyor without scripts, storing value in attributes, and paying the right player.

## Build the line (5 minutes)

All parts **Anchored** except the drops.

| Part | Name | Notes |
| --- | --- | --- |
| Box above the belt | `Dropper` | Where ore appears; add an Attachment or just use its position |
| Long flat part | `Conveyor` | The belt |
| Part at the belt's end | `Collector` | Turns ore into cash |
| Button pad | `BuyDropper2` | For later upgrades |

Group them as a Model named `Tycoon` in Workspace.

## Conveyor: no script needed

Set the belt's **AssemblyLinearVelocity** to the direction you want things to slide, for example `0, 0, -8` (studs per second) in Properties. An anchored part with velocity does not move itself, but pushes whatever rests on it. (The API reference describes this "conveyor" behaviour on the deprecated `Velocity` property; `AssemblyLinearVelocity` is its replacement and is what current community conveyors set.) Rotate the belt or change the vector to change direction. Use a texture with arrows so players can see the flow.

## Dropper script (inside `Tycoon`)

```lua
local Debris = game:GetService("Debris")
local tycoon = script.Parent
local dropper = tycoon:WaitForChild("Dropper")

local DROP_EVERY = 2   -- seconds
local DROP_VALUE = 5   -- cash per ore

while true do
	local ore = Instance.new("Part")
	ore.Size = Vector3.new(1, 1, 1)
	ore.BrickColor = BrickColor.new("Bright orange")
	ore.CFrame = dropper.CFrame * CFrame.new(0, -1.5, 0)
	ore:SetAttribute("Value", DROP_VALUE)
	ore.Parent = tycoon
	Debris:AddItem(ore, 20) -- clean up if it never reaches the collector
	task.wait(DROP_EVERY)
end
```

- The value lives on the ore as an **attribute**, so upgraders can raise it later (`ore:SetAttribute("Value", v * 2)`).
- `Debris:AddItem` deletes stuck ore after 20 seconds, so a jammed belt cannot fill the server with parts.

## Collector script (inside `Tycoon`)

```lua
local tycoon = script.Parent
local collector = tycoon:WaitForChild("Collector")

collector.Touched:Connect(function(hit)
	local value = hit:GetAttribute("Value")
	if not value then return end -- not ore
	hit:SetAttribute("Value", nil) -- avoid paying twice
	hit:Destroy()

	local owner = tycoon:GetAttribute("OwnerUserId")
	local player = owner and game:GetService("Players"):GetPlayerByUserId(owner)
	if player then
		player.leaderstats.Cash.Value += value
	end
end)
```

Clearing the attribute before `Destroy` matters: `Touched` can fire several times for one ore in the same instant.

## Who owns the tycoon

Give the model an `OwnerUserId` attribute when a player claims it, for example by touching a "Claim" pad (one tycoon per player, first come first served). Create `leaderstats.Cash` in a PlayerAdded script exactly as in [[First Leaderboard with leaderstats]]. Plot claiming, multiple plots and resets on leave are covered in [[Tycoon Plot Layout and Plot Assignment]].

## Buy button (upgrade)

```lua
local button = script.Parent.BuyDropper2
local PRICE = 50
button.Touched:Connect(function(hit)
	local player = game:GetService("Players"):GetPlayerFromCharacter(hit.Parent)
	if not player or player.UserId ~= script.Parent:GetAttribute("OwnerUserId") then return end
	local cash = player.leaderstats.Cash
	if cash.Value >= PRICE and button.Parent then
		cash.Value -= PRICE
		button:Destroy()
		-- move a pre-built Dropper2 from ServerStorage into the tycoon here
	end
end)
```

Common approach: build every upgrade in Studio, store them in `ServerStorage`, and `Clone()` them in when bought.

## Tuning numbers

Start cheap and fast: the first purchase should be affordable within about a minute so players feel progress immediately, then each tier costs a few times more. Treat this as a design starting point, not a rule; measure with real players.

## Pitfalls

- **Ore falling through or sliding off:** add low side walls to the belt.
- **Hundreds of parts:** keep `Debris` cleanup and do not spawn faster than about once a second per dropper on low-end phones.
- **Paying the toucher instead of the owner:** anyone could stand on your collector. Always pay the owner.
- **Cash in a LocalScript:** clients cannot create real money. Keep all cash changes in server Scripts.

## Related
[[00 START HERE - Top G Vault]] · [[Simulator Tycoon Starter Architecture]] · [[Tycoon Plot Layout and Plot Assignment]] · [[Tycoon Starters - Factorial Defense and Industry Tycoon (MIT)]] · [[30 Official Roblox Docs/API Reference/Classes/Debris|Debris (official)]]
