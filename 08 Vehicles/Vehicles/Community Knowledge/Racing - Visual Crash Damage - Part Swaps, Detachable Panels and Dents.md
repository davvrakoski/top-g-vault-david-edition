---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Racing - Visual Crash Damage - Part Swaps, Detachable Panels and Dents"
tags: [roblox, community-knowledge, vehicles, damage, deformation, editablemesh]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/how-do-you-create-a-soft-body-car-mesh-deformation-for-a-chassis/1695452
  - https://devforum.roblox.com/t/editable-collision-mesh-during-runtime/4219582
  - https://devforum.roblox.com/t/fully-destructable-car-with-tire-deform-physics-headlight-breaking-and-windshield-shattering/3676611
  - https://create.roblox.com/docs/reference/engine/classes/EditableMesh
  - https://create.roblox.com/docs/reference/engine/classes/Bone
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
---
# Racing - Visual Crash Damage - Part Swaps, Detachable Panels and Dents

Health, failure states and repair are covered in [[Vehicle Damage, Repair and Failure States]]. This note is the **look** of a crash: a bumper that hangs off, a crumpled bonnet, a shattered headlight. Crash visuals sell speed and make arcade crash games (and demolition derbies) fun even with simple physics.

## The four techniques, cheapest first

| Technique | Cost | Looks | Use for |
|---|---|---|---|
| Part swap (clean -> dented mesh) | Very low | Good if art is good | Bonnet, doors, bumpers |
| Detach panel (break weld, let it fall) | Low, short-lived physics | Great | Bumpers, mirrors, spoilers |
| Bone push (skinned car body) | Medium | Smooth dents | Hero cars |
| EditableMesh vertex dents | Higher (memory) | Exact dent at hit point | One or two player cars, client only |

## 1. Zones and impact detection

Split the car into 4-6 zones (front, rear, left, right, roof). On the **driver's client** (it owns the physics) watch for sudden velocity change:

```lua
local lastV = chassis.AssemblyLinearVelocity
RunService.PostSimulation:Connect(function(dt)
	local v = chassis.AssemblyLinearVelocity
	local dv = (v - lastV).Magnitude
	lastV = v
	if dv > 35 then -- studs/s change in one step = a real hit
		local localDir = chassis.CFrame:VectorToObjectSpace((lastV - v).Unit)
		reportImpact(localDir, dv) -- pick zone from the dominant axis of localDir
	end
end)
```

Send the zone and strength to the server (rate-limited), which updates zone health attributes. All clients then apply visuals from those attributes, so damage is consistent for everyone.

## 2. Part swaps

Model each panel in 2-3 states (`Bonnet_0`, `Bonnet_1`, `Bonnet_2`) in Blender. At runtime keep all states in the model, show one (`Transparency = 0`) and hide the others, or swap `MeshPart` contents by cloning from a template. Make swapped parts `Massless = true` and `CanCollide = false` so they never change handling.

## 3. Detachable panels

At zero zone health, destroy the `WeldConstraint` holding the bumper, give it a small impulse away from the car and a random spin, set its collision group so it does not hit the car again (see [[Collision Groups for Vehicles - Wheels, Riders and Traffic]]), and `Debris:AddItem(part, 8)`. Set it unowned to the server only if others must see it identically; otherwise spawn a local copy on every client from the replicated "detached" attribute, which costs no replication.

## 4. Dents: bones vs EditableMesh

- **Bones**: DevForum's soft-body thread recommends rigging the body with bones outside Roblox and moving them on impact. Move the nearest `Bone`'s `Transform` inward by a few tenths of a stud. Smooth, cheap, but dents only where bones exist.
- **EditableMesh**: client-side, create an editable copy with `AssetService:CreateEditableMeshAsync`, then `FindVerticesWithinSphere(hitPoint, radius)` and push each vertex with `SetPosition` along the impact direction with falloff. Collision does **not** update (a 2026 DevForum thread notes runtime collision mesh editing is not possible), so dents are purely visual. Editable meshes use memory per copy: use them only for the local player's car and verify current memory limits in the EditableMesh docs.

## 5. Glass, lights, tyres

- Headlights: at zone damage, disable the `SpotLight`, swap lens to a cracked texture.
- Windows: swap to a cracked `Decal`/texture, then break into a few glass parts with a `ParticleEmitter` burst.
- Tyres: a burst tyre lowers wheel radius visually and grip on that wheel (see [[Tyre Friction with CustomPhysicalProperties]]).

## 6. Repair visuals

Repair = reset attributes; every client restores state-0 meshes, re-welds panels from a stored offset (`CFrame` relative to the chassis saved at spawn) and resets bones/vertices. Moving many restored parts at once is a good fit for `workspace:BulkMoveTo`.

## Related
[[Vehicles - Hub]] · [[Vehicle Damage, Repair and Failure States]] · [[Vehicle Damage and Impact Blueprint]] · [[Collision Groups for Vehicles - Wheels, Riders and Traffic]]
