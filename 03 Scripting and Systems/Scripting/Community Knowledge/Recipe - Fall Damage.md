---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Fall Damage"
tags: [roblox, community-knowledge, scripting, recipe, luau, fall-damage, humanoid, server]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://create.roblox.com/docs/physics/network-ownership
---
# Recipe - Fall Damage

Players who fall too far take damage that grows with how hard they hit the ground. It makes height meaningful in survival, horror and open-world games. This version runs **on the server** and measures impact by the sudden drop in downward speed, so it does not depend on a client script reporting its own landing (a cheater would simply never report).

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Where it goes
| Script | Type | Location |
|---|---|---|
| `FallDamage` | Script | `ServerScriptService` |

## How the numbers work
With default `Workspace.Gravity = 196.2` studs/s², impact speed from a fall of height *h* is `sqrt(2 * 196.2 * h)`:

| Fall height | Impact speed | Damage with the settings below |
|---|---|---|
| normal jump | about 50 | 0 |
| 10 studs | about 63 | 0 |
| 20 studs | about 89 | 24 |
| 35 studs | about 117 | 52 |
| 60 studs | about 153 | 88 |

`SAFE_SPEED = 65` means roughly 10 studs is free; every stud/s above that costs `DAMAGE_PER_SPEED` health.

## The code
```lua
-- ServerScriptService/FallDamage (Script)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local SAFE_SPEED = 65          -- impacts slower than this do nothing
local DAMAGE_PER_SPEED = 1.0   -- health per stud/s above SAFE_SPEED
local STOP_RATIO = 0.3         -- "landed" = vertical speed fell to 30% of the previous frame

type Tracked = { humanoid: Humanoid, root: BasePart, prevVy: number }
local tracked: {[Model]: Tracked} = {}

local function onCharacter(character: Model)
	local humanoid = character:WaitForChild("Humanoid", 10) :: Humanoid?
	local root = humanoid and humanoid.RootPart
	if not humanoid or not root then return end
	tracked[character] = { humanoid = humanoid, root = root, prevVy = 0 }
	character.AncestryChanged:Connect(function(_, parent)
		if not parent then tracked[character] = nil end
	end)
end

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(onCharacter)
	if player.Character then onCharacter(player.Character) end
end)
for _, player in Players:GetPlayers() do
	player.CharacterAdded:Connect(onCharacter)
	if player.Character then onCharacter(player.Character) end
end

RunService.Heartbeat:Connect(function()
	for character, t in tracked do
		local h = t.humanoid
		if h.Health <= 0 or not t.root.Parent then
			continue
		end
		local vy = t.root.AssemblyLinearVelocity.Y
		local prev = t.prevVy
		t.prevVy = vy

		if prev < -SAFE_SPEED and vy > prev * STOP_RATIO then
			local skip = h.SeatPart ~= nil
				or character:GetAttribute("NoFallDamage") == true
				or h:GetState() == Enum.HumanoidStateType.Swimming
			if not skip then
				local damage = (-prev - SAFE_SPEED) * DAMAGE_PER_SPEED
				h:TakeDamage(damage) -- respects ForceField
				character:SetAttribute("LastFallDamage", math.floor(damage))
			end
		end
	end
end)
```

`Humanoid:TakeDamage` is used instead of writing `Health` directly so spawn ForceFields still protect new players.

## Opting out
Set `character:SetAttribute("NoFallDamage", true)` from server code for things like:
- jump pads or launchers (set it for 2-3 s after the launch, see [[Recipe - Jump Pads and Speed Pads]]; the pads there run on the client, so have the server set the flag on pad touch, or make pads give upward speed small enough to stay under `SAFE_SPEED`);
- parachutes, gliders, or a "feather" power-up;
- cutscenes and server teleports that drop the player from a height.

## How to test
1. Build towers of 10, 20 and 40 studs. Play with **Server & 1 client** (Test tab) so the server script and real replication are involved.
2. Step off each: no damage at 10, small at 20, heavy at 40. Check the `LastFallDamage` attribute on your character in the server Explorer.
3. Fall into terrain water from 60 studs: no damage.
4. Sit in a moving vehicle that drops: no damage (`SeatPart` check).
5. Lower `Workspace.Gravity` to 100: falls become softer automatically, because impact speed is measured, not height.

## Common mistakes
- **Measuring height from the jump start** (`Freefall` start Y minus landing Y). Fails for jump pads, slopes and moving platforms, and needs reliable state events.
- **Client-only fall damage.** Easy to write and easy to cheat: deleting the LocalScript makes the player immune. Fine for single-player feel, wrong for PvP survival.
- **Bouncy floors.** A part with high `Elasticity` reverses velocity on impact; the ratio test still triggers, which is usually what you want.
- **Very low `SAFE_SPEED`.** Normal jumps land at around 50 studs/s; anything under ~55 will hurt players for jumping.
- Ragdoll on heavy falls pairs well with [[R15 Ragdoll with BallSocketConstraints - Setup, Limits and Recovery]].

## Related
[[Scripting - Hub]] · [[Recipe - Jump Pads and Speed Pads]] · [[Recipe - Healing Zones and Safe Zones]] · [[What a Client Controls on Its Own Character - Replication Exceptions]]
