---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Jump Pads and Speed Pads"
tags: [roblox, community-knowledge, scripting, recipe, luau, movement, jump-pad, speed-pad, collectionservice, attributes]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/CollectionService
  - https://create.roblox.com/docs/scripting/attributes
  - https://create.roblox.com/docs/physics/network-ownership
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
---
# Recipe - Jump Pads and Speed Pads

Step on a glowing pad and get launched upward (jump pad) or get a few seconds of extra speed (speed pad). Obbies, lobbies and racing maps use dozens of them. The non-obvious part: the **server should not push player characters**. Each client owns its own character's physics, so a velocity set by the server on a player's root is overwritten by the client a moment later and feels laggy or does nothing. Let each client react to its own touch.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Where it goes
| Item | Type | Location |
|---|---|---|
| `Pads` | LocalScript | `StarterPlayer > StarterPlayerScripts` |
| pad parts | Part, Anchored, tagged `JumpPad` or `SpeedPad` | anywhere in `Workspace` |

Per-pad settings live in **attributes**, so a builder can tune pads without touching code:
- `JumpPad`: `LaunchSpeed` (number, default 90), optional `Forward` (number, default 0: push along the pad's front face).
- `SpeedPad`: `Speed` (default 40), `Duration` (seconds, default 3).

## The code
```lua
-- StarterPlayerScripts/Pads (LocalScript)
local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")

local player = Players.LocalPlayer
local PAD_COOLDOWN = 0.4
local lastUse: {[BasePart]: number} = {}
local speedBoostToken = 0

local function myHumanoidFrom(hit: BasePart): (Humanoid?, BasePart?)
	local character = player.Character
	if not character or not hit:IsDescendantOf(character) then return nil end
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid or humanoid.Health <= 0 then return nil end
	return humanoid, humanoid.RootPart
end

local function ready(pad: BasePart): boolean
	local now = os.clock()
	if now - (lastUse[pad] or 0) < PAD_COOLDOWN then return false end
	lastUse[pad] = now
	return true
end

local function onJumpPad(pad: BasePart, hit: BasePart)
	local humanoid, root = myHumanoidFrom(hit)
	if not root or not ready(pad) then return end
	local up = pad:GetAttribute("LaunchSpeed") or 90
	local forward = pad:GetAttribute("Forward") or 0
	local flatLook = pad.CFrame.LookVector * Vector3.new(1, 0, 1)
	local v = root.AssemblyLinearVelocity
	root.AssemblyLinearVelocity = Vector3.new(v.X, 0, v.Z) + Vector3.new(0, up, 0) + flatLook * forward
	humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
end

local function onSpeedPad(pad: BasePart, hit: BasePart)
	local humanoid = myHumanoidFrom(hit)
	if not humanoid or not ready(pad) then return end
	local speed = pad:GetAttribute("Speed") or 40
	local duration = pad:GetAttribute("Duration") or 3

	speedBoostToken += 1
	local myToken = speedBoostToken
	humanoid:SetAttribute("PadSpeed", speed)
	task.delay(duration, function()
		-- only clear if no newer pad refreshed the boost
		if myToken == speedBoostToken and humanoid.Parent then
			humanoid:SetAttribute("PadSpeed", nil)
		end
	end)
end

local function bind(tag: string, handler)
	local function hook(pad: Instance)
		if pad:IsA("BasePart") then
			pad.Touched:Connect(function(hit) handler(pad, hit) end)
		end
	end
	for _, pad in CollectionService:GetTagged(tag) do hook(pad) end
	CollectionService:GetInstanceAddedSignal(tag):Connect(hook) -- streaming-safe
	CollectionService:GetInstanceRemovedSignal(tag):Connect(function(pad)
		lastUse[pad] = nil
	end)
end

bind("JumpPad", onJumpPad)
bind("SpeedPad", onSpeedPad)

-- apply PadSpeed: one owner for WalkSpeed
local BASE_SPEED = 16
local function watch(character: Model)
	local humanoid = character:WaitForChild("Humanoid") :: Humanoid
	humanoid:GetAttributeChangedSignal("PadSpeed"):Connect(function()
		humanoid.WalkSpeed = humanoid:GetAttribute("PadSpeed") or BASE_SPEED
	end)
end
if player.Character then watch(player.Character) end
player.CharacterAdded:Connect(watch)
```

## How to test
1. Make a 6x1x6 Neon part, tag it `JumpPad`, add a number attribute `LaunchSpeed = 120`. Walk on: you fly up. Set `Forward = 60` and rotate the pad: you are thrown along its front face.
2. Tag another part `SpeedPad`. Step on it: run fast for 3 s. Step on it again after 2 s: the boost restarts and does not end early (the token check).
3. Test with **StreamingEnabled** on and pads far from spawn: they still work after you walk to them, because `GetInstanceAddedSignal` hooks pads as they stream in.
4. Two-client test: only the client whose character touched the pad is affected.

## Common mistakes
- **Doing it in a server Script** with `Touched` and `AssemblyLinearVelocity`: rubber-banding, because the client owns its character.
- **Forgetting `Freefall`** after a launch: the Humanoid sometimes treats the frame as grounded and damps the upward speed.
- **Several systems writing `WalkSpeed`.** If you also use [[Recipe - Sprint with Stamina Bar]], make the sprint loop read `PadSpeed` instead of keeping this second writer.
- **Not caring about NPCs.** NPCs are owned by the server (or by a nearby client) and will not react to this LocalScript. Add a server version for server-owned NPC models if you need it.
- Tag work is cleaner with [[CollectionService Tag-Driven Architecture]].

## Related
[[Scripting - Hub]] · [[CollectionService Tag-Driven Architecture]] · [[What a Client Controls on Its Own Character - Replication Exceptions]] · [[Obby Stage Design - Difficulty Ramp, Checkpoints and Readable Hazards]]
