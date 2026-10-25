---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Ride - Tank Turrets - Yaw and Pitch Servos Aimed in Local Space"
tags: [roblox, community-knowledge, vehicles, tank, turret, constraints]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/help-making-servo-hinges-make-a-block-face-the-mouse/2592593
  - https://devforum.roblox.com/t/tank-turret-not-aiming-to-mouse-hinge-constraint/1891889
  - https://devforum.roblox.com/t/tank-turret-works-fine-when-facing-forward-breaks-when-facing-any-other-direction/2334658
  - https://devforum.roblox.com/t/turret-misaligned-when-base-rotation-changes/4028401
  - https://create.roblox.com/docs/reference/engine/classes/HingeConstraint
---
# Ride - Tank Turrets - Yaw and Pitch Servos Aimed in Local Space

The existing tank note covers tracks and skid steering. This one covers the other half: a turret that follows the mouse while the hull drives anywhere, on slopes too. The DevForum is full of "works facing forward, breaks when the tank turns" and "breaks on ramps" threads, and they all have the same fix: **do the aim maths in the hinge's own space, with atan2**.

## Rig
- `Hull` (root) -> **yaw hinge** -> `Turret` part -> **pitch hinge** -> `Gun` part.
- Both are `HingeConstraint`s with `ActuatorType = Servo`. Yaw: no limits (or `LimitsEnabled` for casemate guns). Pitch: `LimitsEnabled`, `LowerAngle` -8, `UpperAngle` 20.
- `AngularSpeed` sets traverse speed: tanks feel heavy at 25-45 degrees per second yaw, 15-25 pitch. `ServoMaxTorque` high enough to move the turret mass.
- Attachment axes matter: the attachment's primary (X) axis is the rotation axis, and the secondary axis defines angle zero. Line them up in Studio before scripting (the servo hinge thread points out matching positions do not guarantee matching secondary axes).

## The aim maths
Put the pitch hinge on the yaw axis so the two angles are independent (the thread's advice). Then:

```lua
local function aimAngles(yawHinge, pitchHinge, target: Vector3)
	local pYaw = yawHinge.Attachment0.WorldCFrame:PointToObjectSpace(target)
	local yaw = math.deg(math.atan2(-pYaw.Z, pYaw.Y))
	local pPitch = pitchHinge.Attachment0.WorldCFrame:PointToObjectSpace(target)
	local pitch = math.deg(math.atan2(-pPitch.Z, pPitch.Y))
	return yaw, pitch
end
```
The exact component pair (`-Z, Y` here) depends on how your attachment's secondary axis points; test with a part straight ahead and adjust signs once. Because everything is relative to the hull's attachments, slopes and hull rotation are handled for free.

Old fixes that cause bugs: projecting onto the world XZ plane (fails when tilted) and `math.atan` (range only -90 to 90, causing 180-degree flips).

## Mouse target
- Raycast from the camera through the mouse (`Camera:ViewportPointToRay`), excluding your own tank. If nothing is hit, use a point 1000 studs along the ray.
- Gunner's client computes `TargetAngle` values locally for instant feel and sends the target point to the server at 10-20 Hz; the server sets the servo targets so others see the turret move.

## Gun feel
- Show a "gun is pointing here" reticle (raycast from the muzzle) separate from the "mouse is here" reticle. The gap between them is what makes traverse speed readable.
- Fire only when the gun reticle is within a few degrees of the target, or allow firing anywhere (arcade).
- Recoil: briefly push the gun part back along a `PrismaticConstraint`, plus an impulse on the hull.
- Stabilizer upgrade: lower `AngularResponsiveness` without stabilizer so the gun wobbles while driving.

## Pitfalls
- Ownership: if the driver owns the physics and a different player is gunner, the servos must be set by whoever owns the assembly or by the server; see the ownership note.
- Turrets with collisions bump the hull; put turret and hull in a collision group that does not collide with itself.

## Related
[[Vehicles - Hub]] - [[Tanks and Tracked Vehicles - Hinge Tracks and Skid Steering]] - [[HingeConstraint Motors and Servos for Wheels and Steering]] - [[Vehicle Network Ownership Recipes - Drivers, Passengers and Exit Jolts]]
