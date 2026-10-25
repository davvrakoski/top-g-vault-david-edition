---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Anim - Jump Arc Phases - Takeoff, Rise, Apex and Fall Clips by Vertical Velocity"
tags: [roblox, community-knowledge, animation, jump, platformer, movement-feel]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/animation/using
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/enums/HumanoidStateType
  - https://create.roblox.com/docs/reference/engine/classes/AnimationTrack
---
# Anim - Jump Arc Phases - Takeoff, Rise, Apex and Fall Clips by Vertical Velocity

The default `Animate` script treats a jump as two slots: `jump` when the Humanoid enters `Jumping`, then `fall` once it is in `Freefall`. For an obby that is enough. For a platformer, a parkour game or any game with jump pads, double jumps and long falls, the character spends most of its air time in one pose that does not match whether it is rising, floating at the top or dropping. Splitting the arc into phases by **vertical velocity** makes jumps read clearly and feel springier.

## The phases

| Phase | Trigger | Clip | Length |
|---|---|---|---|
| Takeoff | `Jumping` state entered | `Jump_Takeoff`: crouch-push, arms swing up | 0.1-0.15 s, one-shot |
| Rise | `vy > +8` | `Jump_Rise`: tucked legs, arms up | loop |
| Apex | `-8 <= vy <= +8` | `Jump_Apex`: legs drift, arms open | loop (short) |
| Fall | `vy < -8` | `Jump_Fall`: legs reach down, arms flail slightly | loop |
| Long fall | falling for over ~1 s | `Fall_Long`: panic or skydive pose | loop |

`vy` is `root.AssemblyLinearVelocity.Y`. The ±8 band is a starting value for default gravity (196.2); scale it with your jump velocity so the apex lasts about 0.15-0.25 s.

## Driver (LocalScript in StarterCharacterScripts)

```lua
local character = script.Parent
local humanoid = character:WaitForChild("Humanoid")
local root = character:WaitForChild("HumanoidRootPart")
local animator = humanoid:WaitForChild("Animator")
local Registry = require(game.ReplicatedStorage.Anim.Registry)

local function load(id)
	local a = Instance.new("Animation"); a.AnimationId = id
	local t = animator:LoadAnimation(a)
	t.Priority = Enum.AnimationPriority.Movement
	return t
end
local clips = {
	Rise = load(Registry.Air.Rise), Apex = load(Registry.Air.Apex),
	Fall = load(Registry.Air.Fall), Long = load(Registry.Air.FallLong),
}
local takeoff = load(Registry.Air.Takeoff)
takeoff.Priority = Enum.AnimationPriority.Action

local current, airTime = nil, 0
local function switch(name)
	if current == name then return end
	if current then clips[current]:Stop(0.12) end
	current = name
	if name then clips[name]:Play(0.12) end
end

humanoid.StateChanged:Connect(function(_, new)
	if new == Enum.HumanoidStateType.Jumping then
		takeoff:Play(0.03)
		airTime = 0
	elseif new == Enum.HumanoidStateType.Landed or new == Enum.HumanoidStateType.Running
		or new == Enum.HumanoidStateType.Swimming or new == Enum.HumanoidStateType.Climbing then
		switch(nil)
	end
end)

game:GetService("RunService").Heartbeat:Connect(function(dt)
	local state = humanoid:GetState()
	if state ~= Enum.HumanoidStateType.Freefall and state ~= Enum.HumanoidStateType.Jumping then return end
	airTime += dt
	local vy = root.AssemblyLinearVelocity.Y
	if vy > 8 then switch("Rise")
	elseif vy >= -8 then switch("Apex")
	elseif airTime > 1 then switch("Long")
	else switch("Fall") end
end)
```

## Keep Animate out of the way

`Animate` still plays its own jump and fall at `Core` priority. Because these clips sit at `Movement`, they win every joint they key. If the default fall still shows through on unkeyed joints (head bob, fingers), replace the `jump` and `fall` IDs under `Animate` with a neutral clip.

## Feel tips

- **Takeoff must be short.** Anything over ~0.15 s of crouch before the body leaves the ground reads as input lag; the physics jump already happened, so the clip is only selling it.
- **Blend times around 0.1-0.15 s** between air phases; shorter pops, longer smears the apex away.
- **Double jump:** on the second jump, play a one-shot flip or spin at `Action` priority and keep the phase driver running underneath.
- **Jump pads:** a huge `vy` keeps you in Rise for a long time; give pads their own "launched" pose.
- **Match landing:** hand over to the landing-by-fall-height clips on `Landed`.

## Pitfalls

- Using `MoveDirection` or input to choose phases: falling off a ledge without jumping never gets a takeoff, which is correct; but make sure the driver still runs in `Freefall` (it does above).
- Sticky phase after teleports: reset `current` and `airTime` when you move the character by script.
- Swimming and climbing: stop the driver in those states, otherwise the fall loop fights the swim clip.

## Related
[[Animation - Hub]] · [[Anim - Landing Animations by Fall Height - Soft, Hard and Roll]] · [[Recipe - Double Jump]] · [[Physics - Jump Height, JumpPower and Gravity Conversions]]
