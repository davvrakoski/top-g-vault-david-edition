---
area: "03 Scripting and Systems"
cluster: "Physics Ragdolls"
title: "Physics - Jump Height, JumpPower and Gravity Conversions"
tags: [roblox, community-knowledge, physics, humanoid, jumping, gravity, platformer]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/classes/StarterPlayer
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
---
# Physics - Jump Height, JumpPower and Gravity Conversions

Obbies, platformers and movement shooters live or die on jump feel, and level designers need to know exactly how high and how far a player can jump to build fair gaps. Roblox offers two jump settings and a global gravity value; this note turns them into numbers you can design with.

## The settings (API reference)

- `Humanoid.UseJumpPower` picks the mode. Its starting value comes from `StarterPlayer.CharacterUseJumpPower` (default **true** per the Humanoid docs).
- `Humanoid.JumpPower`: "how much upwards force" is applied; default **50**, constrained to 0-1000.
- `Humanoid.JumpHeight`: jump height in **studs**; default **7.2**. Only used when `UseJumpPower` is false.
- `Workspace.Gravity`: default **196.2** studs/s2.
- To disable jumping the docs recommend `Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)` rather than setting the value to 0.

## The ballistic formulas

Treat the jump as a launch with upward speed `v` under gravity `g`:

| Quantity | Formula |
| --- | --- |
| Peak height | `h = v^2 / (2g)` |
| Speed for a height | `v = sqrt(2 g h)` |
| Time to peak | `v / g` |
| Total airtime (same floor height) | `2v / g` |
| Horizontal gap you can clear | `WalkSpeed x airtime` |

The community treats `JumpPower` as approximately the launch speed in studs/s. Under that reading, JumpPower 50 at gravity 196.2 gives about **6.4 studs** of height and **0.51 s** of airtime, a bit under the 7.2 stud JumpHeight default. This conversion is a rule of thumb (unverified against engine source); measure it in your game before building tight jumps.

## Conversions (own code)

```lua
local function jumpPowerForHeight(h: number): number
	return math.sqrt(2 * workspace.Gravity * h)
end
local function heightForJumpPower(v: number): number
	return v * v / (2 * workspace.Gravity)
end
local function maxGap(humanoid: Humanoid): number
	local g = workspace.Gravity
	local airtime = if humanoid.UseJumpPower
		then 2 * humanoid.JumpPower / g
		else 2 * math.sqrt(2 * g * humanoid.JumpHeight) / g
	return humanoid.WalkSpeed * airtime
end
```

At defaults (WalkSpeed 16, JumpHeight 7.2) the flat gap is about 16 x 0.54 = **8.7 studs**. Design normal gaps well under that (for example 6) and keep near-max jumps for optional challenges.

## Changing gravity keeps height if you use JumpHeight

With `UseJumpPower = false`, the engine computes the launch so the character reaches `JumpHeight` regardless of gravity. Lowering gravity then makes jumps **floatier but the same height**, and airtime grows by `sqrt(196.2 / newG)`. With `UseJumpPower = true`, lowering gravity makes jumps both higher and longer. Pick JumpHeight mode if level geometry must stay valid when gravity changes (moon zones, power-ups).

## Measuring for real (own code)

```lua
local peak, startY = -math.huge, nil
humanoid.StateChanged:Connect(function(_, new)
	if new == Enum.HumanoidStateType.Jumping then
		startY, peak = root.Position.Y, -math.huge
	elseif new == Enum.HumanoidStateType.Landed and startY then
		print("jump height", peak - startY)
	end
end)
RunService.Heartbeat:Connect(function() peak = math.max(peak, root.Position.Y) end)
```

## Pitfalls

- Set jump values on the server (or in StarterPlayer); client changes still work for the local character, so exploiters can change them too. Detect impossible heights server-side.
- Hip height and character scale change apparent height; measure with the avatar types you allow.
- Coyote time and jump buffering are separate input tricks; they do not change these numbers.

## Related
[[Physics Ragdolls - Hub]] · [[First Character Tweaks - WalkSpeed, JumpHeight, Health and Sprint]] · [[Projectile Ballistics - Gravity Arcs, Launch Angles and Lead]] · [[Physics - Roblox Units Cheat Sheet - Studs, RMU, Rowtons and Gravity]]
