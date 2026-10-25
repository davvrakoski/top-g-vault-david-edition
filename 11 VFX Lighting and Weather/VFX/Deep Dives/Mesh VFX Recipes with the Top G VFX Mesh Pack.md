---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
tags: [deep-dive, roblox, vfx, meshes, combat-vfx]
cssclasses: [tg-a11]
---

# Mesh VFX Recipes with the Top G VFX Mesh Pack

> **Why this matters:** The anime and action look on Roblox comes from **mesh VFX**: swept slash ribbons, expanding rings, lightning strips and glowing shells, timed in fractions of a second. Particles alone look soft and generic.
> This note turns the 22 bundled meshes into a drop-in effect library with exact setup, timings and pooling, so a slash or shockwave is one function call.

---

## 1. What is in the pack (measured)

All 22 meshes are in `20 FBX Asset Library/Top G Originals - VFX Meshes/FBX/`, with five white+alpha textures in `Textures/` (`T_Glow_Radial`, `T_Slash_Fade_U`, `T_Ring_Soft`, `T_Edge_Hard`, `T_Noise_Smoke`). Catalog: [[Top G Originals - VFX Mesh Pack]].

Bounding sizes measured from the FBX files (source units, Blender axes X × Y × Z with Z up; after import, Z becomes Roblox's up axis, and the absolute size depends on your import scale):

| Mesh | Size (X × Y × Z) | Shape notes |
|---|---|---|
| `VFX_Slash_Thin` | 1.66 × 3.91 × 0 | Flat arc, lies in the ground plane |
| `VFX_Slash_Wide` | 2.28 × 4.26 × 0 | Flat wide crescent |
| `VFX_Slash_Spin360` | 4.74 × 4.90 × 0 | Flat full ring sweep |
| `VFX_Slash_Uppercut` | 1.07 × 2.84 × 0 | Short flat arc |
| `VFX_Shockwave_Ring` / `_Wide` | 4 × 4 × 0 | Flat rings |
| `VFX_Shockwave_Wall` | 4.4 × 4.4 × 1 | Short open cylinder |
| `VFX_Cone_Burst` | 3 × 3 × 2 | Cone |
| `VFX_Pillar_Tapered` | 2 × 2 × 6 | Tall tapered column |
| `VFX_Tornado_Twist` | 4 × 4 × 5 | Twisted funnel |
| `VFX_Dome_Half` | 4 × 4 × 2 | Hemisphere |
| `VFX_Sphere_Shell` | 2 × 2 × 2 | Sphere |
| `VFX_Spiral_Ribbon` | 2.65 × 2.5 × 4.4 | Helix ribbon |
| `VFX_Lightning_Bolt_A` / `_B` | ~0.95 × 0.7 × 6 | Tall jagged strip |
| `VFX_Impact_Star` / `_Sharp` | ~3.4 × 3.6 × 0 | Flat star |
| `VFX_Crystal_Shards` | 0.94 × 1.11 × 1.61 | Cluster |
| `VFX_Flare_Crossed` / `_Star3` | 2 × 2 × 2 | Crossed cards, visible from any side |
| `VFX_Trail_Ribbon` | 4 × 0 × 0.4 | Thin vertical ribbon |
| `VFX_Ground_Decal` | 4 × 4 × 0 | Flat quad |

Every mesh has one UV set, with U running along the effect. Flat meshes (slashes, rings, stars, decal) have zero thickness, so they need **`DoubleSided = true`** to be visible from below or behind.

## 2. One-time import and template setup

1. **Import 3D** each FBX (or all at once) into `ReplicatedStorage.VFX`. Each becomes a `MeshPart`.
2. On every template set: `Anchored = true`, `CanCollide = false`, `CanQuery = false`, `CanTouch = false`, `CastShadow = false`, `DoubleSided = true` (flat ones), `Massless = true`.
3. Pick a look:
   - **Neon look (cheapest, anime):** `Material = Neon`, `Color` = effect colour, no texture. Neon glows with a `BloomEffect` in `Lighting`. Best for slashes, rings, lightning.
   - **Textured look (soft edges):** add a `SurfaceAppearance` in Studio with `ColorMap` = one of the pack textures (e.g. `T_Slash_Fade_U` for slashes, `T_Ring_Soft` for rings) and `AlphaMode = Transparency`. At runtime, tint with `SurfaceAppearance.Color` (scriptable); the maps themselves can only be set in Studio or by plugins.
4. **Orientation offset.** Rotate each template once in Studio so its "forward" (the direction the slash travels or the ring faces) matches the model's -Z/LookVector, then store any remaining correction as a `CFrame` attribute named `Offset` (or leave it identity). Recipes below multiply by it, so you never hand-fix rotations in code.
5. Put `ReplicatedStorage.VFX` effects **only on clients**. The server tells clients *what* happened; each client spawns the visuals. See [[VFX Framework]].

## 3. A small pooled effect library

```lua
--!strict
-- ReplicatedStorage/Shared/MeshVFX.lua  (client only)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")

local Templates = ReplicatedStorage:WaitForChild("VFX")
local folder = Workspace:FindFirstChild("ClientVFX") or Instance.new("Folder")
folder.Name = "ClientVFX"
folder.Parent = Workspace

local MeshVFX = {}
local pools: { [string]: { MeshPart } } = {}

local function acquire(name: string): MeshPart
	local pool = pools[name]
	if pool and #pool > 0 then
		return table.remove(pool) :: MeshPart
	end
	local template = Templates:FindFirstChild(name) :: MeshPart
	assert(template, "Missing VFX template " .. name)
	local p = template:Clone()
	p:SetAttribute("BaseSize", template.Size)
	return p
end

local function release(name: string, p: MeshPart)
	p.Parent = nil
	pools[name] = pools[name] or {}
	if #pools[name] < 24 then
		table.insert(pools[name], p)
	else
		p:Destroy()
	end
end

local function offsetOf(p: MeshPart): CFrame
	local o = p:GetAttribute("Offset")
	return if typeof(o) == "CFrame" then o else CFrame.identity
end

-- Generic: place, then tween size/transparency, then return to pool.
local function burst(name: string, cf: CFrame, color: Color3, startScale: number, endScale: number, duration: number, startTransparency: number?)
	local p = acquire(name)
	local base = p:GetAttribute("BaseSize") :: Vector3
	p.CFrame = cf * offsetOf(p)
	p.Size = base * startScale
	p.Color = color
	p.Transparency = startTransparency or 0
	local sa = p:FindFirstChildOfClass("SurfaceAppearance")
	if sa then sa.Color = color end
	p.Parent = folder
	local tween = TweenService:Create(p, TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Size = base * endScale,
		Transparency = 1,
	})
	tween:Play()
	tween.Completed:Once(function()
		release(name, p)
	end)
	return p
end

MeshVFX.burst = burst
MeshVFX.acquire = acquire
MeshVFX.release = release
return MeshVFX
```

`MeshPart.Size` scales the rendered mesh, so tweening `Size` is how rings expand and slashes grow. (`MeshId` cannot be changed at runtime, which is why each effect is its own template.)

## 4. Recipe: sword slash

Goal: a crescent that appears on the swing frame, grows ~20%, and fades in about 0.15 to 0.2 s.

```lua
local MeshVFX = require(game:GetService("ReplicatedStorage").Shared.MeshVFX)

-- angleDeg: tilt of the swing (0 = horizontal, 70 = diagonal downward cut)
local function slash(root: BasePart, angleDeg: number, color: Color3, heavy: boolean)
	local name = if heavy then "VFX_Slash_Wide" else "VFX_Slash_Thin"
	local cf = root.CFrame * CFrame.new(0, 0.5, -3) * CFrame.Angles(0, 0, math.rad(angleDeg))
	MeshVFX.burst(name, cf, color, 1.0, 1.25, if heavy then 0.22 else 0.15)
	-- a second, larger, fainter copy behind it gives a "smear" layer
	MeshVFX.burst(name, cf * CFrame.new(0, 0, 0.4), color:Lerp(Color3.new(1, 1, 1), 0.4), 1.1, 1.4, 0.25, 0.5)
end
```

Trigger it from the `VFX` animation marker on the attack clip so it lands on the exact swing frame ([[Animation Markers for Hit Frames, Footsteps and Sync]]). For spin attacks use `VFX_Slash_Spin360` centred on the root; for launchers use `VFX_Slash_Uppercut` rotated 90 degrees to stand vertical.

## 5. Recipe: ground shockwave (slam, landing)

Three layers, all centred on the impact point, with different speeds:

```lua
local function shockwave(position: Vector3, color: Color3, radiusStuds: number)
	local flat = CFrame.new(position + Vector3.new(0, 0.1, 0)) -- rings lie flat already
	-- scale factor: rings are ~4 source units wide; adjust if your import scale differs
	local s = radiusStuds * 2 / 4
	MeshVFX.burst("VFX_Shockwave_Ring", flat, color, s * 0.2, s, 0.35)                  -- fast bright ring
	MeshVFX.burst("VFX_Shockwave_Ring_Wide", flat, Color3.fromRGB(150, 130, 110), s * 0.3, s * 1.2, 0.6, 0.3) -- dust ring
	MeshVFX.burst("VFX_Shockwave_Wall", flat, color, s * 0.3, s * 0.9, 0.25, 0.2)         -- short rising wall
	MeshVFX.burst("VFX_Ground_Decal", flat, Color3.fromRGB(40, 35, 30), s * 0.8, s * 0.8, 2.5, 0.2) -- crack/scorch (textured)
end
```

The decal layer lingers longest (2 to 3 s) so the impact "stays" in the world after the flash. For a stylized crack, give the `VFX_Ground_Decal` template a `SurfaceAppearance` with a crack texture.

## 6. Recipe: lightning strike between two points

The bolt meshes are tall strips (~6 source units along their up axis). Stretch the up axis to the distance and aim it.

```lua
local function lightning(from: Vector3, to: Vector3, color: Color3)
	local dir = to - from
	local len = dir.Magnitude
	if len < 0.1 then return end
	local up = dir.Unit
	local right = if math.abs(up.Y) < 0.99 then up:Cross(Vector3.yAxis).Unit else Vector3.xAxis
	local mid = from + dir * 0.5
	local cf = CFrame.fromMatrix(mid, right, up) -- Y axis of the part points along the bolt

	for i, name in { "VFX_Lightning_Bolt_A", "VFX_Lightning_Bolt_B" } do
		local p = MeshVFX.acquire(name)
		local base = p:GetAttribute("BaseSize") :: Vector3
		p.Size = Vector3.new(base.X, len, base.Z)
		p.CFrame = cf * CFrame.Angles(0, math.rad(90 * i), 0)
		p.Material = Enum.Material.Neon
		p.Color = color
		p.Parent = workspace.ClientVFX
		-- flicker: alternate visibility for a few frames, then release
		task.spawn(function()
			for f = 1, 6 do
				p.Transparency = if (f + i) % 2 == 0 then 0 else 0.8
				task.wait(0.03)
			end
			MeshVFX.release(name, p)
		end)
	end

	-- a short light flash sells it (PointLight range is clamped to 120 studs by the engine)
	local flashAtt = Instance.new("Attachment")
	flashAtt.Parent = workspace.Terrain   -- parent first, then set the world position
	flashAtt.WorldPosition = to
	local light = Instance.new("PointLight")
	light.Color = color
	light.Range = 30
	light.Brightness = 6
	light.Parent = flashAtt
	game:GetService("Debris"):AddItem(flashAtt, 0.15)
end
```

Combine with an impact star at `to` and a `ParticleEmitter:Emit(12)` of sparks. For long arcs that should curve and crawl, a `Beam` with a jagged texture and `TextureSpeed` is cheaper to animate: [[Beams, Trails and Attachments - Production Setups]]. For storm lightning and flash safety, see [[Thunder, Lightning and Accessibility]].

## 7. Recipe: energy orb (projectile)

Layers attached to one moving anchor:

1. `VFX_Sphere_Shell`, Neon, 0.3 transparency: the core.
2. `VFX_Flare_Crossed`, larger, 0.6 transparency, slowly rotating: the glow halo.
3. A `Trail` between two attachments on the core (width via `WidthScale`, `Lifetime` 0.15 s).
4. A `ParticleEmitter` with `Rate` 20 to 40, short `Lifetime`, `LightEmission = 1`, for sparkle.

Move the whole group with one `CFrame` per frame (or `workspace:BulkMoveTo` for many orbs). On impact: pool the orb, play an impact star + small shockwave ring. The projectile logic itself is in [[Client-Predicted, Server-Validated Projectiles]]; more orb variations in [[Energy Orb and Projectile VFX]].

## 8. Recipe: impact star (hit spark)

Flat stars must face the camera. For a 0.1 s effect, orient once at spawn:

```lua
local function impactStar(position: Vector3, color: Color3, crit: boolean)
	local cam = workspace.CurrentCamera
	local face = CFrame.lookAt(position, cam.CFrame.Position) * CFrame.Angles(-math.pi / 2, math.random() * math.pi * 2, 0)
	-- CFrame.Angles applies Z, then Y, then X: the random Y spins the star around its own normal,
	-- then the -90 deg X tilt turns the flat (ground-plane) star so its face points at the camera
	MeshVFX.burst(if crit then "VFX_Impact_Star_Sharp" else "VFX_Impact_Star", face, color, 0.6, 1.1, if crit then 0.12 else 0.08)
end
```

Random roll per hit stops repeated hits looking stamped. For crits, pair with hitstop ([[Hitstop, Screen Shake and Camera Impact Feel]]).

## 9. Recipe: pillar, tornado, dome, crystals

- **Pillar of light/fire:** `VFX_Pillar_Tapered` scaled from `(1, 0.1, 1)` to `(1, 1, 1)` × size over 0.15 s (rises), hold 0.3 s, fade 0.3 s. Add a `VFX_Shockwave_Ring` at its base.
- **Tornado:** `VFX_Tornado_Twist` plus a `VFX_Spiral_Ribbon`, rotate both continuously around Y at different speeds (`CFrame * CFrame.Angles(0, dt * 6, 0)` per frame). Two counter-rotating layers read as turbulence.
- **Shield bubble:** `VFX_Dome_Half` (ground) or `VFX_Sphere_Shell` (air) with `T_Ring_Soft`-style rim texture via `SurfaceAppearance`; pulse `Transparency` between 0.6 and 0.8 on hit.
- **Ice eruption:** 3 to 5 `VFX_Crystal_Shards` at random yaw and scale around the target, rising from below ground over 0.1 s, lingering 1 s, then sinking.

## 10. Budget rules

- **Pool everything** (the module does). Creating and destroying parts per hit causes frame spikes.
- **Cap concurrent effects** per client (for example 40 mesh VFX). Drop the oldest or skip low-priority ones.
- **Distance cull:** skip slashes and stars beyond ~120 studs; they are unreadable anyway.
- **Transparency overdraw** is the real cost: many large, overlapping, semi-transparent meshes kill mobile fill rate. Prefer short durations and fewer, bolder layers.
- More in [[VFX Budget and Readability]] and [[VFX Performance, LOD and Pooling]].

## Common mistakes

- Spawning VFX on the server (replication cost, delayed on every client).
- Flat meshes without `DoubleSided`, invisible from one side.
- `CanQuery`/`CanTouch` left on, so effects block raycasts and fire touch events.
- `CastShadow` left on (glowing slashes casting shadows look wrong and cost shadow passes).
- Hand-rotating in code for every recipe instead of fixing template orientation once.
- Durations over 0.5 s for hit effects (they muddy fast combat).
- Trying to set `SurfaceAppearance` maps from a game script (Studio/plugin only).
- No pooling, no cap.

## Checklist

- [ ] All 22 templates imported to `ReplicatedStorage.VFX` with collision/query/touch/shadow off.
- [ ] Look chosen per template (Neon or SurfaceAppearance with pack texture).
- [ ] Orientation fixed in template; `Offset` attribute if needed.
- [ ] Pooled spawn library on the client.
- [ ] Slash, shockwave, lightning, orb, impact, pillar recipes wired to markers/events.
- [ ] Bloom configured so Neon reads ([[Post-Processing - Bloom, Color and DOF]]).
- [ ] Concurrent cap and distance culling.
- [ ] Tested on a low-end phone in a 4-player fight.

---

**Related:** [[VFX - Hub]] · [[Top G Originals - VFX Mesh Pack]] · [[Arc Slash, Crescent and Wave VFX]] · [[Elemental Weapon VFX System — Fire, Ice, Arcane, Holy and Dark]] · [[VFX Budget and Readability]] · [[VFX Color Language and Readability]]
