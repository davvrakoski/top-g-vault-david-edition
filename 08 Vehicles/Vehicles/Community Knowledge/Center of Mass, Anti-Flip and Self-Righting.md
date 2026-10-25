---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Center of Mass, Anti-Flip and Self-Righting"
tags: [roblox, community-knowledge, vehicles, stability, alignorientation, mass]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
  - https://create.roblox.com/docs/reference/engine/classes/AlignOrientation
  - https://create.roblox.com/docs/reference/engine/enums/AlignType
  - https://create.roblox.com/docs/physics/assemblies
  - https://devforum.roblox.com/t/dirtbike-flipping-on-ramp/2049953
---
# Center of Mass, Anti-Flip and Self-Righting

The number one complaint in Roblox car games is "my car flips". It usually is not a suspension problem: it is a centre of mass that sits too high because the body mesh, windows and seats weigh more than the floor. Fix mass first, then add an upright helper, then give players a way to recover when it still happens.

## 1. See where the mass is
`BasePart.AssemblyCenterOfMass` (world position) and `AssemblyMass` are read-only and update live. Draw it during testing:

```lua
local marker = Instance.new("Part")
marker.Anchored, marker.CanCollide, marker.Size = true, false, Vector3.one * 0.6
marker.Color = Color3.new(1, 0, 0)
marker.Parent = workspace
RunService.Heartbeat:Connect(function()
	marker.Position = chassis.AssemblyCenterOfMass
end)
```

Aim for the centre of mass to sit **at or below the wheel hubs**. If it floats near the roof line, you will flip on every kerb.

## 2. Move the mass down
- Set `Massless = true` on the body mesh, windows, lights, spoilers. The docs suggest exactly this for vehicle accessories and render meshes welded to a simpler collision part. Massless is ignored on the assembly's root part.
- Put the weight in a flat, wide floor part with higher density via `CustomPhysicalProperties`.
- Use `RootPriority` (-127..127) on the chassis floor so it stays the assembly root even when parts are added or removed.
- Do not make wheels nearly weightless to "help"; large mass ratios between connected assemblies cause instability.

## 3. Upright helper with AlignOrientation
A weak `AlignOrientation` that only keeps the car's up axis near world up stops rollovers without fighting steering:

```lua
local att = Instance.new("Attachment")
att.Name = "UprightAtt"
att.Axis = Vector3.new(0, 1, 0) -- attachment's primary (X) axis points up in part space
att.Parent = chassis

local align = Instance.new("AlignOrientation")
align.Mode = Enum.OrientationAlignmentMode.OneAttachment
align.AlignType = Enum.AlignType.PrimaryAxisParallel
align.PrimaryAxis = Vector3.yAxis -- world up
align.Attachment0 = att
align.MaxTorque = chassis.AssemblyMass * 60 -- tune: weak, not rigid
align.Responsiveness = 8
align.Parent = chassis
```

`PrimaryAxisParallel` aligns only one axis, so yaw stays free for steering. Keep `RigidityEnabled` off; a rigid upright constraint makes the car feel glued and can launch it on slopes. Raise `MaxTorque` while airborne for "land on your wheels" arcade behaviour, as DevForum replies suggest for dirt bikes.

## 4. Recovery when it still flips
Detect "upside down and slow for 2 seconds", then offer a flip:

```lua
local up = chassis.CFrame.UpVector.Y
if up < 0.2 and chassis.AssemblyLinearVelocity.Magnitude < 5 then
	stuckTime += dt
else
	stuckTime = 0
end
-- after 2 s show a "Flip car" button; on press (server):
local pos = chassis.Position + Vector3.new(0, 4, 0)
local _, yaw = chassis.CFrame:ToEulerAnglesYXZ()
car:PivotTo(CFrame.new(pos) * CFrame.Angles(0, yaw, 0))
```

Do the pivot on the server (or the owner) and clear velocities first (`AssemblyLinearVelocity = Vector3.zero` on the root) so the car does not keep spinning.

## Checklist
- [ ] Centre of mass visualised and at or below hub height
- [ ] Decorative parts `Massless`, floor part heavy and wide
- [ ] Upright align weak on ground, stronger in air
- [ ] Flip-recovery button with cooldown, server-validated

## Related
[[Vehicles - Hub]] · [[Vehicle Suspension, Chassis and Grip]] · [[Tyre Friction with CustomPhysicalProperties]] · [[Physics Budget for Vehicle Games - Assemblies, Sleep, Timestepping and Collisions]] · [[AlignOrientation]]
