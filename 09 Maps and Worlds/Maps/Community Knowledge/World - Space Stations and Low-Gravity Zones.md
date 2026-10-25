---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "World - Space Stations and Low-Gravity Zones"
tags: [roblox, community-knowledge, maps, space, gravity, sci-fi]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://create.roblox.com/docs/reference/engine/classes/VectorForce
  - https://create.roblox.com/docs/physics/assemblies
  - https://kenney.nl/assets/space-station-kit
  - https://kenney.nl/assets/modular-space-kit
  - https://science.nasa.gov/3d-resources/
---
# World - Space Stations and Low-Gravity Zones

Space settings sell themselves with two things: clean modular corridors you can read at a glance, and a gravity change players feel in their jump. Both are cheap if you plan them. The modular look also makes space stations one of the fastest settings to build from a kit.

## Layout plan
1. **Ring or spine station.** A central hub (command deck) with arms to modules: hangar, labs, crew quarters, hydroponics, engine room, airlock.
2. **Color-coded modules.** Each arm gets one accent color on doors, floor stripes and lights (yellow = cargo, blue = science, red = engineering). Sci-fi corridors all look alike without this.
3. **Windows onto space** at junctions only. They are your landmarks (the planet is always "down", the sun always "left").
4. **One EVA / low-gravity area**: the hangar, an exterior walkway, or a moon surface outside the airlock.

## Key kits
- Kenney **Space Station Kit**, **Modular Space Kit** and **Space Kit**: CC0, bundle-safe, in the local FBX library.
- KayKit **Space Base** (CC0).
- NASA 3D Resources (real spacecraft for props and set dressing): NASA media is generally not under US copyright, credit NASA and never imply endorsement. It is not CC0/CC BY/MIT, so by vault rules it is "link only"; see [[More Free Sources - NASA 3D Resources]] for the guideline details.

## Gravity: global vs per-zone
- **Global:** `Workspace.Gravity` defaults to 196.2 studs/s². Setting it to ~32 gives a moon-like jump for the whole server. Simple, but it also affects every loose part and vehicle.
- **Per-zone:** keep global gravity and add an upward `VectorForce` on the character while they're in the zone. Run it on the client (the player owns their character's physics).

```lua
-- LocalScript: partial gravity while inside a zone (factor 0.2 = 20% gravity)
local function applyLowGravity(character, factor)
	local root = character:WaitForChild("HumanoidRootPart")
	local force = Instance.new("VectorForce")
	force.Name = "LowGravity"
	force.Attachment0 = root:WaitForChild("RootAttachment")
	force.RelativeTo = Enum.ActuatorRelativeTo.World
	force.ApplyAtCenterOfMass = true
	force.Force = Vector3.new(0, root.AssemblyMass * workspace.Gravity * (1 - factor), 0)
	force.Parent = root
	return force -- Destroy() it when the player leaves the zone
end
```
Recompute the force if the character's mass changes (tools, accessories). Raise `Humanoid.JumpPower` or `JumpHeight` slightly in zero-g rooms only if jumps feel too short.

## Lighting tips
- Interiors: cool white panel lights (`SurfaceLight`, no shadows) and colored accent strips in each module's color.
- Exterior: a black `Sky` with stars, one strong directional sun, very low `OutdoorAmbient` for hard space shadows; `Atmosphere` Density near 0 outside (no air).
- Emergency mode: swap all panel lights to red and pulse them - a cheap, very readable event.

## Performance budget
- Modular kits reuse meshes well: keep the set small (straight, corner, T, cross, door, end cap).
- Glowing strips as `Neon` parts are cheaper than many lights.
- Big glass windows: one transparent part each, `CastShadow = false`.

## Common mistakes
- Every corridor identical - players get lost in minutes.
- Global low gravity that makes dropped items and vehicles float away.
- Doors that slide open too slowly for 16-studs/s walking; aim under 0.4 s.
- Forgetting a ceiling height for high low-g jumps; players bonk and it feels broken.

## Related
[[Maps - Hub]] - [[Modular Kit Grid Audit - Module Sizes and an Off-Grid Finder]] - [[Biome Zone Detection for Lighting and Ambience Swaps]] - [[Modular Kits from the Kenney FBX Library]]
