---
area: "01 Start Here"
cluster: "Start Here"
title: "First Obby in 30 Minutes"
tags: [roblox, community-knowledge, start-here, obby, first-project, checkpoints]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/tutorials/use-case-tutorials/scripting/basic-scripting/deadly-lava
  - https://create.roblox.com/docs/scripting/debounce
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/reference/engine/classes/SpawnLocation
  - https://create.roblox.com/docs/tutorials/curriculums/core
---
# First Obby in 30 Minutes

An obstacle course ("obby") is the classic first Roblox game because it teaches building, anchoring, a kill brick, checkpoints and a leaderboard without any networking. The goal here is a **complete** small game in half an hour: 5 stages, lava, checkpoints that remember your stage, and a stage counter. Polish comes later; finishing comes first.

## Minute 0-5: setup

1. New **Baseplate**. Delete the Baseplate part if you want a void (falling = death), or keep it and paint it red later as lava.
2. Keep the default **SpawnLocation**; rename it `Stage0`.
3. Create Folders in Workspace: `Stages`, `Lava`.

## Minute 5-15: build 5 stages

For each stage: a few jump platforms, then a checkpoint pad.
- Insert parts, size them (Home > Scale), and tick **Anchored** on every one. Unanchored parts fall when the game starts.
- Standard jump reference: default characters jump about 7.2 studs high and cover roughly 10-12 studs of gap with a running jump (community measurement, unverified; test it). Start with gaps of 4-6 studs, raise difficulty slowly.
- Checkpoint: insert a **SpawnLocation** at the end of each stage, name it `Stage1`, `Stage2`... put them in `Stages`. Set `Neutral = true`, and `Duration = 0` to skip the spawn force field if you like.
- Put any red "lava" parts into the `Lava` folder and set `Material = Neon`, colour red, so danger is readable.

Design tip: teach one new obstacle per stage, then combine. See [[Obby Stage Design - Difficulty Ramp, Checkpoints and Readable Hazards]].

## Minute 15-22: one script for all lava

Put a **Script** named `Lava` in **ServerScriptService** (one script, not one per brick):

```lua
local lavaFolder = workspace:WaitForChild("Lava")

local function onTouched(hit)
	local humanoid = hit.Parent:FindFirstChildWhichIsA("Humanoid")
	if humanoid and humanoid.Health > 0 then
		humanoid.Health = 0
	end
end

for _, part in lavaFolder:GetDescendants() do
	if part:IsA("BasePart") then
		part.Touched:Connect(onTouched)
	end
end
```

## Minute 22-28: checkpoints and a stage counter

Second Script in ServerScriptService, named `Checkpoints`:

```lua
local Players = game:GetService("Players")
local stages = workspace:WaitForChild("Stages")

Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	local stage = Instance.new("IntValue")
	stage.Name = "Stage"
	stage.Parent = leaderstats
	leaderstats.Parent = player
end)

for _, pad in stages:GetChildren() do
	local number = tonumber(pad.Name:match("%d+"))
	pad.Touched:Connect(function(hit)
		local player = Players:GetPlayerFromCharacter(hit.Parent)
		if not player or not number then return end
		local stage = player.leaderstats.Stage
		if number == stage.Value + 1 then -- no skipping ahead
			stage.Value = number
			player.RespawnLocation = pad
		end
	end)
end
```

`Player.RespawnLocation` makes the player respawn on that SpawnLocation. The `stage.Value + 1` check stops players skipping stages by falling onto a later pad.

## Minute 28-30: test like a player

- Press **Test**, play to the end, die on purpose at each stage, confirm you respawn at the last pad.
- Check the Stage number on the player list.
- Run **Server & Clients** with 2 players: each should have their own stage.
- Publish (private) and play it on your phone.

## Make it a real game next

| Next step | Note |
| --- | --- |
| Save the stage between sessions | [[First DataStore Save - Load, Save, Leave and Shutdown]] |
| A "skip stage" product or VIP pass | [[First Shop - Selling a Game Pass and Opening the Built-in Shop]] |
| A badge for finishing | [[First Badge - Award on Achievement]] |
| Moving and fading platforms | [[First Moving Part with TweenService]] |

## Pitfalls

- Forgetting `Anchored` on a single platform: it falls at start and the stage is impossible.
- Using `Touched` on a giant baseplate lava under the whole map: works, but it fires constantly. Small lava parts are kinder.
- Kill bricks inside spawn pads: players die in a loop.

## Related
[[00 START HERE - Top G Vault]] · [[Obby Platformer Starter Architecture]] · [[Spawn Area Design - SpawnLocation Rules, Protection and Exits]] · [[First Leaderboard with leaderstats]] · [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/Scripting/Basic Scripting/Deadly lava|Deadly lava (official)]]
