---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Obby Stage Save and Skip Stage Product"
tags: [roblox, community-knowledge, scripting, recipe, luau, obby, checkpoints, spawnlocation, datastore, developer-products]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/SpawnLocation
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/production/monetization/developer-products
  - https://create.roblox.com/docs/reference/engine/classes/MarketplaceService
---
# Recipe - Obby Stage Save and Skip Stage Product

Obby progress that survives leaving the game, respawns at the furthest checkpoint, and a "Skip stage" button sold as a developer product. The 30-minute starter in [[First Obby in 30 Minutes]] keeps stages for one session only; returning players who lose 40 stages of progress usually do not come back, and the skip-stage product is one of the most common obby monetization items. Checkpoints here are `SpawnLocation`s, so respawning uses the engine's own `Player.RespawnLocation` instead of teleporting after spawn.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Where it goes
| Item | Type | Location |
|---|---|---|
| `ObbyStages` | Script | `ServerScriptService` |
| `PlayerData`, `Receipts` | from [[Recipe - Developer Product Shop with Safe ProcessReceipt]] | `ServerScriptService` |
| `SkipButton` | LocalScript inside a `TextButton` | `StarterGui > ObbyGui` |
| checkpoints | `SpawnLocation`s in a Folder `Workspace.Stages`, named `1`, `2`, `3` ... | `Workspace` |

Checkpoint settings: `Neutral = true`, `AllowTeamChangeOnTouch = false`, `Duration = 0` (no ForceField bubble), and only stage `1` with `Enabled = true` so new players spawn there; the rest `Enabled = false` (they still work as a `RespawnLocation`; unverified for every edge case, so test it).

## Server
```lua
-- ServerScriptService/ObbyStages (Script)
local Players = game:GetService("Players")
local ServerScriptService = game:GetService("ServerScriptService")
local PlayerData = require(ServerScriptService:WaitForChild("PlayerData"))

local stages = workspace:WaitForChild("Stages")
local lastStage = #stages:GetChildren()

local function stagePart(n: number): SpawnLocation?
	local part = stages:FindFirstChild(tostring(n))
	return if part and part:IsA("SpawnLocation") then part else nil
end

local function applyStage(player: Player, n: number)
	local data = PlayerData.get(player)
	if not data then return end
	data.Stage = math.clamp(n, 1, lastStage)
	local stats = player:FindFirstChild("leaderstats")
	if stats and not stats:FindFirstChild("Stage") then
		local v = Instance.new("IntValue"); v.Name = "Stage"; v.Parent = stats
	end
	if stats then stats.Stage.Value = data.Stage end
	player.RespawnLocation = stagePart(data.Stage)
end

-- touching the next checkpoint advances (never skip ahead, never go back)
for _, part in stages:GetChildren() do
	local n = tonumber(part.Name)
	if n and part:IsA("BasePart") then
		part.Touched:Connect(function(hit)
			local character = hit:FindFirstAncestorOfClass("Model")
			local player = character and Players:GetPlayerFromCharacter(character)
			local data = player and PlayerData.get(player)
			if data and n == (data.Stage or 1) + 1 then
				applyStage(player, n)
			end
		end)
	end
end

local function onPlayer(player: Player)
	local data = PlayerData.waitFor(player)
	if not data then return end
	applyStage(player, data.Stage or 1)
	-- first spawn may already have happened at stage 1; move a returning player once
	if data.Stage > 1 then
		task.spawn(function() player:LoadCharacterAsync() end)
	end
end
Players.PlayerAdded:Connect(onPlayer)
for _, p in Players:GetPlayers() do task.spawn(onPlayer, p) end
```

## Skip stage: one more grant in the receipt handler
The purchase must be granted inside `ProcessReceipt` (so it is saved before `PurchaseGranted`), so the skip logic lives in the `GRANTS` table of the `Receipts` script, not in `ObbyStages`:

```lua
-- in ServerScriptService/Receipts, add to GRANTS:
[SKIP_STAGE_PRODUCT_ID] = function(player, data)
	local stages = workspace.Stages
	local last = #stages:GetChildren()
	if (data.Stage or 1) >= last then
		error("already on the last stage") -- pcall in ProcessReceipt -> NotProcessedYet
	end
	data.Stage = (data.Stage or 1) + 1
	player.RespawnLocation = stages:FindFirstChild(tostring(data.Stage))
	local stats = player:FindFirstChild("leaderstats")
	if stats and stats:FindFirstChild("Stage") then stats.Stage.Value = data.Stage end
	task.defer(function() player:LoadCharacterAsync() end)
end,
```
The `PlayerData` module from the shop recipe does not create `data.Stage`; the code treats a missing value as stage 1, so old saves keep working.

## Client button
```lua
-- StarterGui/ObbyGui/SkipButton/LocalScript
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local SKIP_STAGE_PRODUCT_ID = 0
script.Parent.Activated:Connect(function()
	MarketplaceService:PromptProductPurchase(Players.LocalPlayer, SKIP_STAGE_PRODUCT_ID)
end)
```
Hide or disable the button on the final stage so nobody can buy a skip that cannot be delivered.

## How to test
1. Five SpawnLocations named `1`-`5` in `Workspace.Stages`. Play: touch 2, then 3; die: you respawn at 3. Touch 5 directly after 3: nothing (must be next).
2. Leave and rejoin with API access on: you respawn at 3 and the Stage stat shows 3.
3. Buy the skip product (Studio test purchase): you respawn at 4 and the receipt ID is saved.
4. On stage 5 buy again: the grant errors, `ProcessReceipt` returns `NotProcessedYet`, nothing is consumed. Hide the button there so this never happens in practice.

## Common mistakes
- **Teleporting after `CharacterAdded`** to the checkpoint: the character flashes at the lobby first. `RespawnLocation` spawns it in the right place.
- **Letting any checkpoint set the stage**: players walk backwards and "lose" progress, or touch a far stage through a gap. Accept only `current + 1`.
- **Skip with no save**: the skip is lost on rejoin, and the player paid. Grant inside `ProcessReceipt`, saved before `PurchaseGranted`.
- **Two places writing the stage** (checkpoint script and receipt grant) with different rules: keep both using `current + 1` and the same clamp to the last stage.

## Related
[[Scripting - Hub]] · [[First Obby in 30 Minutes]] · [[Obby Stage Design - Difficulty Ramp, Checkpoints and Readable Hazards]] · [[Recipe - Developer Product Shop with Safe ProcessReceipt]]
