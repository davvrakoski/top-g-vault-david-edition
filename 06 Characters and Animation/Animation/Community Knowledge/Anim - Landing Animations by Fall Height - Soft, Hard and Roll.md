---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Anim - Landing Animations by Fall Height - Soft, Hard and Roll"
tags: [roblox, community-knowledge, animation, landing, jump, movement-feel]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/enums/HumanoidStateType
  - https://create.roblox.com/docs/reference/engine/classes/AnimationTrack
  - https://devforum.roblox.com/t/play-animation-upon-landing/1781962
  - https://devforum.roblox.com/t/i-am-working-on-a-fall-script/2698125
  - https://devforum.roblox.com/t/superhero-landing/1008501
---
# Anim - Landing Animations by Fall Height - Soft, Hard and Roll

The default Roblox character lands from a 2-stud hop and a 60-stud drop the same way: it just goes back to running. Matching the landing to the fall sells weight more than any other movement detail, and it gives you a natural place for fall damage, camera dip and dust VFX. The pattern DevForum threads converge on: record where the fall started, measure on `Landed`, pick a clip by bucket.

## Measure the fall: height or impact speed

Two good measures, both read on the client for the local character:

- **Drop height:** highest root Y during the airborne phase minus Y at landing. Track the peak, not the takeoff, so a jump that goes up first is measured from its top.
- **Impact speed:** `-root.AssemblyLinearVelocity.Y` on the frame before landing. This is better if you have jump pads, gliders or slow-fall, because it measures how hard you actually hit.

Timer-only versions (time spent in `Freefall`) also work and are what the most-cited DevForum answer uses, but they misjudge falls after a jump pad or with custom gravity.

## Buckets

| Bucket | Drop (studs, default gravity 196.2) | Clip | Extras |
|---|---|---|---|
| Normal | under ~10 | none (let `Animate` handle it) | soft thud |
| Soft land | 10-25 | `Land_Soft`, upper body + knee dip, 0.25 s | small camera dip |
| Hard land | 25-50 | `Land_Hard`, full body crouch, 0.5-0.7 s, brief slow | dust burst, fall damage starts |
| Roll | 25-50 while moving fast | `Land_Roll`, 0.6 s, keeps momentum | no slow, less damage (reward skill or input) |
| Splat | over ~50 | ragdoll or heavy stagger | big damage |

Numbers are starting points for default gravity; scale them with `workspace.Gravity` and your jump height.

## Code (LocalScript in StarterCharacterScripts)

```lua
local character = script.Parent
local humanoid = character:WaitForChild("Humanoid")
local root = character:WaitForChild("HumanoidRootPart")
local animator = humanoid:WaitForChild("Animator")

local function load(id, priority)
	local a = Instance.new("Animation")
	a.AnimationId = id
	local t = animator:LoadAnimation(a)
	t.Priority = priority
	return t
end
local soft = load("rbxassetid://LAND_SOFT", Enum.AnimationPriority.Action)
local hard = load("rbxassetid://LAND_HARD", Enum.AnimationPriority.Action)
local roll = load("rbxassetid://LAND_ROLL", Enum.AnimationPriority.Action2)

local peakY = root.Position.Y
local airborne = false

humanoid.StateChanged:Connect(function(_, new)
	if new == Enum.HumanoidStateType.Freefall or new == Enum.HumanoidStateType.Jumping then
		if not airborne then airborne = true; peakY = root.Position.Y end
	elseif new == Enum.HumanoidStateType.Landed then
		if not airborne then return end
		airborne = false
		local drop = peakY - root.Position.Y
		local fast = humanoid.MoveDirection.Magnitude > 0.5
		if drop > 25 and fast then
			roll:Play(0.05)
		elseif drop > 25 then
			hard:Play(0.05)
			humanoid.WalkSpeed *= 0.3
			task.delay(hard.Length * 0.7, function() humanoid.WalkSpeed /= 0.3 end)
		elseif drop > 10 then
			soft:Play(0.05)
		end
	end
end)

game:GetService("RunService").Heartbeat:Connect(function()
	if airborne then peakY = math.max(peakY, root.Position.Y) end
end)
```

Use your movement state layer instead of multiplying `WalkSpeed` directly if one exists, so a sprint ending during the slow does not leave the wrong speed.

## Feel details

- **Short fade-in (0.03-0.08 s).** A landing that blends in slowly looks like the character floated down.
- **Hit the pose on frame 1-2.** The contact crouch should be the first keyed pose; the rest is recovery.
- **Upper body only for soft lands** so running continues underneath.
- **Raycast down for an early start.** A short downward ray while falling fast lets you start the hard-land clip 1-2 frames before contact; one DevForum thread mentions this.
- **Fall damage on the server** must not trust the client's number. Re-measure from the server's view of the root (see fall damage recipe).

## Pitfalls

- `Landed` fires on tiny bumps and stair steps; the 10-stud floor bucket filters them.
- Swimming, climbing or seating mid-fall: reset `airborne` when entering those states.
- Teleports mid-air make the drop huge. Reset `peakY` whenever you move the character by script.

## Related
[[Animation - Hub]] · [[Recipe - Fall Damage]] · [[Physics - Jump Height, JumpPower and Gravity Conversions]] · [[Sprint, Crouch and Slide - A Movement State Layer over the Humanoid]]
