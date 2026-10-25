---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
title: "Earth Element VFX - Rock Spikes, Crater Rings and Flying Debris"
tags: [roblox, community-knowledge, vfx, abilities, earth, rocks, debris]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
  - https://create.roblox.com/docs/reference/engine/datatypes/RaycastResult
  - https://create.roblox.com/docs/reference/engine/classes/TweenService
  - https://devforum.roblox.com/t/crater-creation-module/2196023
  - https://devforum.roblox.com/t/crater-system-by-frodev/2628508
  - https://devforum.roblox.com/t/crater-module-v10/2648456
  - https://devforum.roblox.com/t/bezier-debris-10/4755754
---
# Earth Element VFX - Rock Spikes, Crater Rings and Flying Debris

Earth abilities are the one element that is mostly real geometry, not particles. A ground slam that leaves a ring of rocks that match the floor is the signature look of anime battlegrounds games, and the DevForum has several crater modules built around the same pattern. Knowing the pattern lets you build your own small version, or judge a community module before you use it.

## The core trick: rocks that copy the floor

Every crater module in the sources does the same thing: raycast down at each rock position and copy the hit surface's `Material` and `Color` onto the rock. That is what makes the rocks look like they came out of the ground instead of being dropped on it.

```lua
local params = RaycastParams.new()
params.FilterType = Enum.RaycastFilterType.Exclude
params.FilterDescendantsInstances = { workspace.FX, workspace.Characters }

local function groundAt(pos: Vector3): RaycastResult?
	return workspace:Raycast(pos + Vector3.new(0, 4, 0), Vector3.new(0, -12, 0), params)
end

local function makeRock(hit: RaycastResult, size: number): Part
	local rock = Instance.new("Part")
	rock.Anchored, rock.CanCollide, rock.CanQuery, rock.CanTouch = true, false, false, false
	rock.Size = Vector3.new(size, size, size)
	rock.Material = hit.Material
	if hit.Instance:IsA("BasePart") then
		rock.Color = hit.Instance.Color
	end
	-- Terrain hits: hit.Instance is workspace.Terrain; use Terrain:GetMaterialColor(hit.Material)
	return rock
end
```

For terrain, `RaycastResult.Instance` is the Terrain object, so read the colour with `workspace.Terrain:GetMaterialColor(hit.Material)`.

## Crater ring

1. Pick N points on a circle around the impact (N = 8-14 for radius 6-10).
2. For each point, raycast down; skip it if there is no ground (ledges, water).
3. Spawn a rock buried below the surface, rotated randomly and tilted outward 20-40 degrees.
4. Tween it up to the surface in 0.08-0.12 s (`EasingStyle.Back` gives a nice overshoot).
5. Hold 2-4 s, then tween it back down and destroy, or fade `Transparency` to 1.

Vary each rock's size by +-30% and use two rings (inner small, outer large) for depth.

## Rock spike line (earth wave)

Same rock function, but positions step along a line from the caster: one spike every 2-3 studs, spawned 0.03-0.05 s apart so the wave "travels". Make spikes tall wedges (`WedgePart` or a spike mesh) and tilt them toward the direction of travel. The server hitbox should travel at the same speed as the spikes.

## Flying debris

- 6-12 small rocks launched from the centre on arcs. Two ways: unanchored parts with an `AssemblyLinearVelocity` kick (cheap, physics does the arc, but collisions can jitter), or anchored parts moved along a parabola or Bezier on the client (exact, no physics cost). The Bezier Debris module named in the sources takes the second route and raycasts to find the landing point.
- On landing: a small dust puff (ParticleEmitter `Emit(4)`, brown-grey, `LightInfluence = 1`).
- Add a short-lived dust ring at the impact: flat emitter with `Shape = Disc`, `ShapeInOut = Outward`, `Speed = 15`, `Drag = 6`.

## Budget and replication

- One reliable RemoteEvent from the server with (position, radius, seed). Each client builds the rocks locally; the server never spawns visual rocks. One module thread notes the effect is meant to run on the client.
- Pass a random seed so every client builds the same ring (`Random.new(seed)`).
- Cap active rocks (for example 150 per client) and recycle the oldest. Pool parts instead of creating new ones each slam.
- Rocks must have `CanQuery = false` so they do not block your own raycasts or hitboxes.

## Licenses

The DevForum crater modules in the sources did not state a license in the search snippets we saw: treat them as **link only** until you read the post and find an explicit license.

## Related
[[VFX - Hub]] · [[Replicating VFX - Server Signals, Client Renders]] · [[Impact Decals - Bullet Holes, Scorch Marks and Pooling]] · [[RbxCameraShaker for VFX Impacts (MIT)]] · [[Destructible Props Blueprint]]
