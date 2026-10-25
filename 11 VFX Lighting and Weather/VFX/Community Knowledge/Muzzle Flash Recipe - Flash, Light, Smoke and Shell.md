---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
title: "Muzzle Flash Recipe - Flash, Light, Smoke and Shell"
tags: [roblox, community-knowledge, vfx, muzzle-flash, weapons, shooter]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/effects/particle-emitters
  - https://create.roblox.com/docs/reference/engine/classes/ParticleEmitter
  - https://create.roblox.com/docs/effects/light-sources
  - https://create.roblox.com/docs/reference/engine/classes/Attachment
---
# Muzzle Flash Recipe - Flash, Light, Smoke and Shell

A gun without a good muzzle flash feels like a toy, and a gun with a bad one (a big orange square that lingers) feels worse. A convincing flash is four tiny layers that together last under a tenth of a second: a bright star-shaped flash, a one-frame light pulse on nearby walls, a puff of smoke that hangs a moment, and an ejected shell. Everything is client-side and pooled, because automatic weapons fire 10+ times per second.

## Rig

Put two attachments on the weapon model:

- `Muzzle` at the barrel tip, X axis (or LookVector, depending on emitter direction) pointing forward.
- `Ejection` at the ejection port, pointing sideways and up.

Inside `Muzzle`:

| Child | Purpose |
|---|---|
| `FlashCore` ParticleEmitter | The bright star; 1 particle per shot |
| `FlashSide` ParticleEmitter | Side "petals"; 2-3 particles, wider spread |
| `Smoke` ParticleEmitter | Short soft puff |
| `PointLight` | One-frame illumination |

## Starting values

**FlashCore**
- `Rate = 0` (burst only), `Lifetime = 0.04-0.06`, `Speed = 0`
- `Size` sequence: 0.8 -> 1.4 over life (pistol); 1.5 -> 2.5 (rifle)
- `Transparency`: 0 -> 1
- `LightEmission = 1`, `LightInfluence = 0`, `Brightness = 2-4`
- `Rotation` random 0-360 so consecutive shots differ; star or flower texture with several frames if you use a flipbook (`FlipbookLayout` with `FlipbookStartRandom` for variety)
- `LockedToPart = true` so the flash stays on the barrel as it moves

**FlashSide**
- `Lifetime = 0.05`, `Speed = 4-8`, `SpreadAngle = (25, 25)`, small `Size` 0.3-0.6, `Squash` positive to stretch along velocity

**Smoke**
- `Lifetime = 0.4-0.8`, `Speed = 1-2`, `Drag = 3`, `VelocityInheritance = 0.2-0.3` (smoke carries a little of the gun's motion)
- `Size` 0.3 -> 1.2, `Transparency` 0.6 -> 1, grey, `LightEmission = 0`
- Emit 1-2 per shot, and skip it on some shots for very fast weapons

**PointLight**
- Warm colour (255, 200, 120), `Range = 8-12`, `Brightness = 3-6`, `Shadows = false`
- Enable for one frame (about 0.03-0.05 s) per shot

## Firing code (client)

```lua
local muzzle: Attachment = gun.Handle.Muzzle
local light = muzzle.PointLight
light.Enabled = false
local lastFlash = 0

local function onShot()
	muzzle.FlashCore:Emit(1)
	muzzle.FlashSide:Emit(math.random(2, 3))
	if math.random() < 0.6 then
		muzzle.Smoke:Emit(1)
	end
	local now = os.clock()
	lastFlash = now
	light.Enabled = true
	task.delay(0.04, function()
		if lastFlash == now then
			light.Enabled = false -- only the latest shot turns it off
		end
	end)
	ejectShell()
end
```

## Shells

- A small MeshPart from a pool, given an impulse sideways and up from `Ejection` plus spin, `CanCollide = true` against the world only (collision group), and deleted or returned after 2-3 s.
- Or a ParticleEmitter with a shell texture and `Acceleration = (0, -40, 0)` for automatic weapons where physics shells would be too many.
- A tiny clink sound on the first bounce for nearby shells is a strong detail.

## Other players' guns

- Remote players' flashes come from the server's "shot fired" message (see the VFX replication note), played on their third-person weapon's `Muzzle`.
- Skip the PointLight and smoke for distant shooters; keep the core flash (it tells the player where shots come from).

## First-person notes

- In first person, the flash should sit at the viewmodel's muzzle, not the third-person gun.
- Keep it smaller than in third person; a large flash right in front of the camera blinds the aim.
- Suppressed weapons: no core flash, faint smoke only.

## Pitfalls

- `Lifetime` too long (0.2 s+) makes flashes look like fire.
- Using `Enabled = true` with a Rate instead of `Emit()`; it keeps spawning between shots.
- Lights with shadows on every gun: never do this, it is a known shadow-cost trap.
- Forgetting to vary rotation, so every flash looks like the same sticker.

## Related
[[VFX - Hub]] · [[ParticleEmitter Bursts, Flipbooks and Budgets]] · [[Replicating VFX - Server Signals, Client Renders]] · [[Local Light Budgets - PointLight, SpotLight and SurfaceLight]] · [[First-Person Mode, Visible Body and Viewmodels]]
