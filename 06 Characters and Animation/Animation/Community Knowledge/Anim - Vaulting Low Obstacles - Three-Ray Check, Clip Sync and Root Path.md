---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Anim - Vaulting Low Obstacles - Three-Ray Check, Clip Sync and Root Path"
tags: [roblox, community-knowledge, animation, parkour, vault, movement]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
  - https://create.roblox.com/docs/reference/engine/classes/TweenService
  - https://create.roblox.com/docs/reference/engine/classes/AnimationTrack
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
---
# Anim - Vaulting Low Obstacles - Three-Ray Check, Clip Sync and Root Path

A vault is the move where the character plants a hand on a low wall, crate or railing and swings over it without stopping. It keeps chases and parkour flowing where a jump would clip the edge and kill momentum. The ledge-grab recipe covers tall edges you hang from; this note is for **waist-high** obstacles (roughly 1.5-4 studs on a default-size R15 character) that you cross in one smooth move.

## Detect with three rays

Fire them only when the player presses the vault key (or, for auto-vault, when sprinting into something):

1. **Low ray, forward** from about knee height, length 3 studs: must **hit** (there is an obstacle).
2. **High ray, forward** from about head height: must **miss** (the obstacle is low enough to go over).
3. **Down ray** from a point above and just beyond the low hit (for example `hit.Position + forward * 1 + Vector3.yAxis * 4`), casting down 5 studs: its hit gives the **top height**. Repeat a few studs further to find the **far side** and make sure there is floor to land on.

From these you know: obstacle height (pick a clip), thickness (short hop vs long slide over a table), and a landing point.

```lua
local function probeVault(root, params)
	local fwd = root.CFrame.LookVector
	local low = workspace:Raycast(root.Position - Vector3.yAxis * 1.5, fwd * 3, params)
	if not low then return nil end
	if workspace:Raycast(root.Position + Vector3.yAxis * 1.5, fwd * 3, params) then
		return nil -- too tall: hand over to ledge grab or nothing
	end
	local top = workspace:Raycast(low.Position + fwd * 0.6 + Vector3.yAxis * 4, -Vector3.yAxis * 6, params)
	if not top then return nil end
	local landing = workspace:Raycast(low.Position + fwd * 4 + Vector3.yAxis * 4, -Vector3.yAxis * 10, params)
	if not landing then return nil end
	return top.Position, landing.Position
end
```

## Move the root on a path, let the clip sell it

Roblox has no root motion, so the code moves the body and the clip plays in place (see the root motion note):

- Clip `Vault_Low`, about 0.45-0.6 s, keyed **in place** with keys: hand plant at about 30 %, legs swing over at about 50 %, landing at 85-100 %.
- Path: three points, `start`, `apex`, `land`. The root is the hip area, so put the apex root about 1-1.5 studs above the obstacle top (`apex = top + Vector3.yAxis * 1.3`) and let the clip tuck the legs up and over; test on your tallest vaultable prop for leg clipping.
- On the local client, anchor the root for the duration and tween it through the points with the same timing as the clip, or drive a `LinearVelocity`/`AlignPosition` if you must stay physical (for example on moving platforms).

```lua
root.Anchored = true
vaultTrack:Play(0.05)
local t1 = TweenService:Create(root, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
	{ CFrame = CFrame.lookAt(apex, apex + fwd) })
t1:Play(); t1.Completed:Wait()
local t2 = TweenService:Create(root, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
	{ CFrame = CFrame.lookAt(land + Vector3.yAxis * hipToRoot, land + Vector3.yAxis * hipToRoot + fwd) })
t2:Play(); t2.Completed:Wait()
root.Anchored = false
root.AssemblyLinearVelocity = fwd * humanoid.WalkSpeed -- keep momentum
```

`hipToRoot` is the height of the root above the floor when standing (`humanoid.HipHeight + root.Size.Y / 2` for R15).

## Animation tips

- **Sync the hand plant to the obstacle.** Put a marker `HandPlant` in the clip and time the first tween segment to reach the edge at that marker.
- **Several clips by size:** `Vault_Low` (under 2.5 studs, one-hand speed vault), `Vault_High` (2.5-4 studs, two-hand), `Vault_Long` (thick tables: slide over on the hip).
- **Restore momentum** on exit; a vault that ends standing still feels worse than the jump it replaced.
- A light camera dip on landing helps.

## Pitfalls

- Anchoring the root while another system also sets `CFrame` (for example a turn-in-place script) causes jitter: pause other movement systems during the vault.
- Network ownership: anchoring and tweening is fine for the local character, but never do it on the server for players.
- Low ceiling above the obstacle: add a ray from the apex upward and refuse the vault if it hits.
- Exploit check on the server: a vault teleports the player a few studs; make sure your movement validation allows that distance only near tagged or measured obstacles.

## Related
[[Animation - Hub]] · [[Recipe - Ledge Grab and Climb Up]] · [[Root Motion on Roblox - Faking It with In-Place Clips]] · [[Animation Markers for Hit Frames, Footsteps and Sync]]
