---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Anim - Wall-Running - Side Raycasts, Gravity Assist and Mirrored Clips"
tags: [roblox, community-knowledge, animation, parkour, wall-run, movement]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
  - https://create.roblox.com/docs/reference/engine/datatypes/RaycastParams
  - https://create.roblox.com/docs/reference/engine/classes/LinearVelocity
  - https://create.roblox.com/docs/reference/engine/classes/AnimationTrack
  - https://devforum.roblox.com/t/how-to-make-a-wall-run-system/1291457
  - https://devforum.roblox.com/t/how-would-you-make-a-wall-running-script/852747
  - https://devforum.roblox.com/t/wallrun-system-not-working/2778389
---
# Anim - Wall-Running - Side Raycasts, Gravity Assist and Mirrored Clips

Wall-running is a signature parkour move: jump at a wall at an angle and run along it for a moment, then kick off. DevForum threads mostly cover detection (side raycasts) and stop there. This note covers the whole loop: when to attach, how to move along the wall, how the animation stays glued to the wall side, and how to leave cleanly.

## Rules of the move

1. **Start** only when airborne, moving fast enough (for example horizontal speed over 70 % of `WalkSpeed`), and a valid wall is to the left or right.
2. **Run** along the wall tangent for up to about 1-1.5 s, with reduced gravity so the arc dips slowly.
3. **Exit** on: timer ends, wall ends (ray misses), player presses jump (kick-off), player lands, or player steers away.
4. **Cooldown** before the same wall can be run again, so players cannot climb by chaining.

## Detection

Cast short rays from the root each frame while airborne, to the right (`root.CFrame.RightVector`) and left (the negative), about 2.5-3 studs. Use an **Include** filter of tagged runnable walls (`CollectionService` tag `WallRun`), as one DevForum thread does, so random props, players and trusses never trigger it.

```lua
local params = RaycastParams.new()
params.FilterType = Enum.RaycastFilterType.Include
params.FilterDescendantsInstances = CollectionService:GetTagged("WallRun")
-- refresh when tagged parts are added (GetInstanceAddedSignal)

local function findWall(root)
	for _, side in { 1, -1 } do
		local dir = root.CFrame.RightVector * side * 3
		local hit = workspace:Raycast(root.Position, dir, params)
		if hit and math.abs(hit.Normal.Y) < 0.2 then -- near-vertical only
			return hit, side
		end
	end
end
```

## Movement along the wall

- **Tangent:** `normal:Cross(Vector3.yAxis)` is horizontal and along the wall. Flip it if it points opposite to the current velocity (`if tangent:Dot(vel) < 0 then tangent = -tangent end`).
- **Drive:** one `LinearVelocity` on the root attachment (Vector mode, a high `MaxForce`) set to `tangent * runSpeed + Vector3.new(0, verticalSpeed, 0)`, where `verticalSpeed` starts slightly positive (2-4) and decays to about -6 over the run. That gives the "run, then slowly sink" arc without fighting gravity forces.
- **Stick:** add a small velocity into the wall (`-normal * 2`) so tiny gaps do not drop the player.
- **Face:** rotate the character along the tangent (`AutoRotate = false` during the run) and restore afterwards.
- Destroy or disable the `LinearVelocity` on exit. Old threads use `BodyVelocity`; it is deprecated, so prefer the constraint movers.

## Animation

- Author **one** clip, `WallRun_R` (wall on the right): body tilted about 20-30 degrees away from the wall, inner arm reaching toward it, fast stride. Make `WallRun_L` as a **mirrored** copy in your animation tool before upload rather than re-animating.
- Play at `Action` priority, looped, short fade (0.1 s). Scale playback speed with `runSpeed / authoredSpeed`.
- Add a **kick-off** one-shot (0.25 s) on jump exit and let the normal fall clip take over.
- Optional camera tilt of 5-10 degrees away from the wall sells the move strongly.

## Kick-off

On jump during a run: stop the run, then set velocity to `normal * 35 + Vector3.yAxis * 40 + tangent * 15` (tune), and play the kick-off clip. Pushing away from the wall lets players chain to an opposite wall, the classic corridor zig-zag.

## Server side

The local client owns its character physics, so this all runs in a LocalScript. The server should still sanity-check: a player who stays airborne far longer than your max run time, or gains height over a run, is suspicious (see movement validation notes).

## Pitfalls

- Ray from the root misses low walls; cast from root and from a point 1.5 studs lower.
- Running into corners: both rays hit. Pick the wall closest to the current velocity direction.
- Wall-run starting right after a normal jump next to a wall: require a minimum angle between velocity and wall (for example under 60 degrees from the tangent).

## Related
[[Animation - Hub]] · [[Recipe - Wall Jump]] · [[Math - Cross Product Recipes - Surface Alignment and Signed Angles]] · [[Sprint, Crouch and Slide - A Movement State Layer over the Humanoid]]
