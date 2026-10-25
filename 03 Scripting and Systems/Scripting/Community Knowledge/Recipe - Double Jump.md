---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Double Jump"
tags: [roblox, community-knowledge, scripting, recipe, luau, movement, double-jump, humanoid-state]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/UserInputService
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/enums/HumanoidStateType
  - https://devforum.roblox.com/t/how-would-a-double-jump-work/3109322
  - https://devforum.roblox.com/t/double-jump-issues/3078065
---
# Recipe - Double Jump

Press jump again while in the air to jump a second time (or N times). It is the most requested movement upgrade in obbies and platformers, and a natural game-pass perk. The classic bug is that `JumpRequest` fires several times for one press, so a naive script fires both jumps at once from the ground; DevForum threads on this topic keep reporting exactly that.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Where it goes
| Script | Type | Location |
|---|---|---|
| `DoubleJump` | LocalScript | `StarterPlayer > StarterPlayerScripts` |
| `AirJumpPerk` (optional) | Script | `ServerScriptService` |

Movement runs on the client (the client owns its character), but **how many air jumps you get** is decided by the server and handed down as a player attribute. That keeps the perk server-authoritative: an exploiter can still fake jumps, but your shop and saves never trust the client.

## Client: the jump logic
```lua
-- StarterPlayerScripts/DoubleJump (LocalScript)
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local REARM_DELAY = 0.18   -- seconds after leaving the ground before an air jump is allowed
local AIR_JUMP_SCALE = 0.9 -- second jump slightly weaker feels better

local player = Players.LocalPlayer
local humanoid: Humanoid? = nil
local airJumpsLeft = 0
local armed = false

local function maxAirJumps(): number
	return player:GetAttribute("AirJumps") or 1
end

local function onCharacter(character: Model)
	humanoid = character:WaitForChild("Humanoid") :: Humanoid
	airJumpsLeft = maxAirJumps()
	armed = false

	humanoid.StateChanged:Connect(function(_old, new)
		if new == Enum.HumanoidStateType.Landed
			or new == Enum.HumanoidStateType.Running
			or new == Enum.HumanoidStateType.Swimming then
			airJumpsLeft = maxAirJumps()
			armed = false
		elseif new == Enum.HumanoidStateType.Freefall then
			task.delay(REARM_DELAY, function()
				armed = true
			end)
		end
	end)
end

UserInputService.JumpRequest:Connect(function()
	local h = humanoid
	if not h or h.Health <= 0 or not armed or airJumpsLeft <= 0 then
		return
	end
	local state = h:GetState()
	if state ~= Enum.HumanoidStateType.Freefall and state ~= Enum.HumanoidStateType.Jumping then
		return
	end

	airJumpsLeft -= 1
	armed = false
	task.delay(REARM_DELAY, function()
		armed = true
	end)

	local root = h.RootPart
	if root then
		-- cancel downward speed so the second jump is not swallowed by the fall
		local v = root.AssemblyLinearVelocity
		root.AssemblyLinearVelocity = Vector3.new(v.X, 0, v.Z)
	end
	local oldPower = h.JumpPower
	h.JumpPower = oldPower * AIR_JUMP_SCALE
	h:ChangeState(Enum.HumanoidStateType.Jumping)
	h.JumpPower = oldPower
end)

if player.Character then
	onCharacter(player.Character)
end
player.CharacterAdded:Connect(onCharacter)
```

`ChangeState(Jumping)` makes the Humanoid perform a real jump (with its jump animation) even in mid-air. This recipe assumes `StarterPlayer.CharacterUseJumpPower = true`; if your game uses `JumpHeight` instead, scale `JumpHeight` the same way.

## Server: grant the perk (optional)
```lua
-- ServerScriptService/AirJumpPerk (Script)
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

local TRIPLE_JUMP_PASS_ID = 0 -- put your pass ID here

Players.PlayerAdded:Connect(function(player)
	player:SetAttribute("AirJumps", 1)
	if TRIPLE_JUMP_PASS_ID == 0 then return end
	local ok, owns = pcall(MarketplaceService.UserOwnsGamePassAsync, MarketplaceService, player.UserId, TRIPLE_JUMP_PASS_ID)
	if ok and owns then
		player:SetAttribute("AirJumps", 2)
	end
end)
```

## How to test
1. Play. Jump, then press jump again near the top: you rise a second time.
2. Hold the jump key down from the ground: you must get **one** ground jump only, then the air jump after `REARM_DELAY`. If both fire at once, raise `REARM_DELAY`.
3. In the server view's command bar run `game.Players:GetPlayers()[1]:SetAttribute("AirJumps", 3)` and check you now get three air jumps after landing.
4. Jump into water: jumps reset (Swimming state).

## Common mistakes
- **No re-arm delay.** `JumpRequest` can fire on several frames per press; without the delay the first press eats both jumps.
- **Resetting on `Landed` only.** Some landings skip the `Landed` state; resetting on `Running` too covers it.
- **Connecting `StateChanged` again every respawn without cleanup.** The old Humanoid is destroyed with its connections, so the code above is safe; but if you connect to something that survives (like `UserInputService`) inside `onCharacter`, you leak one listener per death.
- **Trusting the client for the pass.** Never let the client set `AirJumps`; client-set attributes do not replicate to the server, but your other client code would believe it.
- Combine with [[Recipe - Wall Jump]] carefully: both listen to `JumpRequest`. Let wall jump run first and skip the air jump on that press.

## Related
[[Scripting - Hub]] · [[Recipe - Wall Jump]] · [[Recipe - Dash]] · [[First Shop - Selling a Game Pass and Opening the Built-in Shop]] · [[Obby Platformer Starter Architecture]]
