---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
title: "Teleport and Portal Effects - Beam Circles, Swirls and Dissolves"
tags: [roblox, community-knowledge, vfx, teleport, portal, beams]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/effects/beams
  - https://create.roblox.com/docs/reference/engine/classes/Beam
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
  - https://devforum.roblox.com/t/bloxys-teleportation-effect/1134702
  - https://devforum.roblox.com/t/light-tunnel-esque-effect/1490921
  - https://devforum.roblox.com/t/making-seamless-portals-tutorial/4731945
---
# Teleport and Portal Effects - Beam Circles, Swirls and Dissolves

Teleports hide a hard cut (the character jumps across the map, or to another place) behind a short effect. Portals are the same idea made permanent: a doorway that promises "something is on the other side". Both are cheap if built from beams and a few emitters. The DevForum sources include a recreation of the Bloxy Awards teleport swirl built from trails and attachments, and threads where developers suggest beams plus particle emitters for portal looks.

## A perfect beam circle (portal rim)

Beams are cubic Bezier curves. Per the Beams docs, the second control point sits `CurveSize0` studs along Attachment0's **+X** axis and the third sits `CurveSize1` studs along Attachment1's **-X** axis. So if four attachments sit on a circle with their +X axis pointing along the circle (tangent), four beams with curve size `0.5523 * radius` (the standard cubic Bezier circle constant) draw a near-perfect circle.

```lua
local K = 0.5523

local function beamCircle(parent: BasePart, radius: number, template: Beam): { Beam }
	local atts = {}
	for i = 0, 3 do
		local a = math.rad(i * 90)
		local pos = Vector3.new(math.cos(a), math.sin(a), 0) * radius
		local tangent = Vector3.new(-math.sin(a), math.cos(a), 0)
		local att = Instance.new("Attachment")
		att.CFrame = CFrame.fromMatrix(pos, tangent, Vector3.zAxis) -- X axis = tangent
		att.Parent = parent
		atts[i + 1] = att
	end
	local beams = {}
	for i = 1, 4 do
		local b = template:Clone()
		b.Attachment0, b.Attachment1 = atts[i], atts[i % 4 + 1]
		b.CurveSize0, b.CurveSize1 = K * radius, K * radius
		b.Parent = parent
		beams[i] = b
	end
	return beams
end
```

Rim beam settings: `FaceCamera = false` (a flat ring that stays in the portal plane), `Segments = 16`, `Width0 = Width1 = 0.4`, `LightEmission = 1`, a scrolling energy texture with `TextureSpeed = 1.5`. Make a second, wider, more transparent circle for glow.

## Portal interior

1. **Swirl disk:** a thin cylinder or flat part with a spiral `Decal` (or the vault's spiral mesh), spun on the client: `part.CFrame *= CFrame.Angles(0, 0, 1.5 * dt)`. Two decals spinning opposite ways at different speeds look much richer than one.
2. **Inward particles:** ParticleEmitter on the disk part, `Shape = Disc` (or `Cylinder`), `ShapeInOut = Inward`, `Speed = 3`, `Lifetime = 0.8`. Particles flowing toward the centre read as "pulling in".
3. **Edge sparks:** a few sparks spawned from the rim attachments outward.
4. **Light:** a `PointLight` or `SurfaceLight` in the portal colour, `Range = 12`, so the floor and walls around it are tinted. This is what makes the portal feel present in the room.

## Teleport out / in (character)

Do the visuals on every client; the server only moves the character and fires a signal.

| Time | Out | In |
|---|---|---|
| 0.0 s | Beam pillar from ground to sky (two attachments, `FaceCamera = true`, width 3) | Pillar appears at destination |
| 0.0-0.3 s | Particles flow inward to the body (`ShapeInOut = Inward` on a body-sized box) | Particles burst outward |
| 0.15-0.35 s | Fade the body: tween each part's `LocalTransparencyModifier` to 1 | Fade back from 1 to 0 |
| 0.35 s | Server pivots the character (`PivotTo`) | Flash + ground ring |

`LocalTransparencyModifier` is local to each client, which is exactly right: each client fades its view of the character without replicating property changes. Reset it to 0 on cancel, death or respawn.

## Place-to-place teleports

When `TeleportService` sends the player to another place, the outgoing effect plays in this server and the arrival effect must play in the destination place. Pass a flag in the teleport data (for example `{ arrivalFx = "portal_blue" }`) and play the arrival effect when the character first spawns there. Use a loading screen (`TeleportService:SetTeleportGui`) styled like the portal so the cut feels continuous.

## Pitfalls

- Portal decals look flat from the side. Add a soft glow sphere or fog card so side views still show something.
- A walk-through portal needs a trigger (a `Touched` part or a distance check), not the VFX part itself; keep VFX parts `CanTouch = false` and `CanQuery = false`.
- Seamless "see-through" portals (rendering the other side) are a different, much harder technique; the DevForum tutorial in the sources covers one approach. Most games do not need them.

## Related
[[VFX - Hub]] · [[Beams, Trails and Attachments - Production Setups]] · [[Interiors, Doors and Portals - In-Place Teleports vs Separate Places]] · [[Scrolling Textures, UV Animation and Emissive Decals]] · [[Replicating VFX - Server Signals, Client Renders]]
