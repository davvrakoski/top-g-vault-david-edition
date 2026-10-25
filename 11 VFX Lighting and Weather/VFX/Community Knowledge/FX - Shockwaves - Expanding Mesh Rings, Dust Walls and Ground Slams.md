---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
title: "Shockwaves - Expanding Mesh Rings, Dust Walls and Ground Slams"
tags: [roblox, community-knowledge, vfx, shockwave, impact, mesh-vfx]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/TweenService
  - https://create.roblox.com/docs/reference/engine/classes/MeshPart
  - https://create.roblox.com/docs/reference/engine/classes/ParticleEmitter
  - https://devforum.roblox.com/t/modulescript-for-rings-needs-reviewing/4012712
  - https://devforum.roblox.com/t/how-to-replicate-that-effect/1565684
---
# Shockwaves - Expanding Mesh Rings, Dust Walls and Ground Slams

A shockwave (a ring of force expanding from an impact) is the effect that says "that hit was heavy". It sells ground slams, landings from great heights, explosions, boss stomps and charged punches. Most of the look comes from one or two meshes scaled up fast and faded out, with particles for texture. DevForum threads in the sources build rings from tweened meshes and from beams with transparency tweens; this note gives tuned numbers and the layering.

## Layers (in order of importance)

1. **Ground ring:** a flat ring mesh lying on the floor, scaling out.
2. **Vertical wall:** a short open cylinder (the vault's `VFX_Shockwave_Wall`) scaling out and up, fading faster than the ring.
3. **Dust wall:** a ring of particles pushed outward along the ground.
4. **Air ring (optional):** a ring standing vertical, facing the camera or the hit direction, for mid-air punches.
5. **Camera:** a short shake scaled by distance, plus optional field-of-view kick.

## Tween numbers

The motion should be **fast out, slow finish**: `EasingStyle.Quart` or `Expo` with `EasingDirection.Out`.

| Layer | Start size | End size | Time | Transparency |
|---|---|---|---|---|
| Ground ring | 1 stud | 16-30 studs | 0.35-0.5 s | 0 -> 1 (Quad Out) |
| Wall | 2 x 1 | 12 x 4 | 0.25 s | 0.2 -> 1 |
| Air ring | 1 | 10 | 0.2 s | 0 -> 1 |

```lua
local TweenService = game:GetService("TweenService")

local function ring(template: MeshPart, at: CFrame, endSize: Vector3, t: number)
	local r = template:Clone()
	r.CFrame, r.Size, r.Transparency = at, endSize * 0.06, 0
	r.Parent = workspace.FX
	local grow = TweenInfo.new(t, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
	local fade = TweenInfo.new(t, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
	TweenService:Create(r, grow, { Size = endSize }):Play()
	TweenService:Create(r, fade, { Transparency = 1 }):Play()
	task.delay(t + 0.05, r.Destroy, r)
end
```

Fading with `EasingDirection.In` keeps the ring solid early and lets it vanish late, which looks like the energy spreads out rather than blinking off.

Spin the ring a little while it grows (5-20 degrees) so the texture does not look static. Pool rings if you fire more than a few per second.

## Materials

- **Energy shockwave:** `Neon` (glows, reads under bloom) or a white texture with high `LightEmission` if you use a textured mesh.
- **Force / air shockwave:** `ForceField` material gives a distortion-like animated shimmer, and `Glass` with high transparency can bend the scene behind it on higher graphics levels. Neither is true screen distortion; Roblox has no custom refraction post-effect, so this is the closest cheap substitute.
- **Earth shockwave:** no glowing ring; use the dust wall and rocks instead (see the earth element note).

## Dust wall

ParticleEmitter on a flat part at the impact: `Shape = Cylinder` with small height, `ShapeStyle = Surface`, `ShapeInOut = Outward`, `Speed = 20-35`, `Drag = 5` (fast start, quick stop), `Lifetime = 0.6-1`, `Size` 1.5 -> 4, grey-brown, `LightInfluence = 1`. `Emit(24-40)` once. Tint by the floor material for realism.

## Scaling by power

Drive all layers from one `power` value (0-1) so a light stomp and a boss slam share code:

- end size = lerp(8, 30, power)
- shake magnitude = lerp(0.2, 1.2, power), divided by distance to the camera
- dust count = lerp(10, 40, power)

## Honesty and accessibility

- The ring's end radius should match the knockback or damage radius. If the server hits within 20 studs, the ring should stop near 20.
- Respect a "reduce camera shake" setting; keep the rings, drop the shake.
- Avoid full-screen white flashes for frequent slams.

## Related
[[VFX - Hub]] · [[Mesh VFX Recipes with the Top G VFX Mesh Pack]] · [[FX - Earth Element VFX - Rock Spikes, Crater Rings and Flying Debris]] · [[RbxCameraShaker for VFX Impacts (MIT)]] · [[Explosion and Fireball Production — Layered, Fast, Readable]]
