---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
tags: [deep-dive, roblox, vfx, particles, flipbooks, performance]
cssclasses: [tg-a11]
---

# ParticleEmitter Bursts, Flipbooks and Budgets

> **Why this matters:** Most Roblox combat effects are a handful of emitters fired with `:Emit()` at the right frame, not emitters left running. Getting bursts, shapes, flipbooks and limits right is what separates crisp hits from a foggy mess that drops phones to 20 FPS.
> This note is the practical reference: documented limits, a data-driven burst player, five tuned recipes and the budget rules.

---

## 1. Limits from the docs (memorize these)

- **Rate:** one emitter can create up to **400 particles per second (100 per second on mobile)**.
- **Lifetime:** capped at **20 seconds**; larger values are clamped.
- **Flipbook framerate:** maximum **30 frames per second**.
- **Flipbook layouts:** `Grid2x2` (4 frames), `Grid4x4` (16), `Grid8x8` (64), or `Custom` (`FlipbookSizeX` × `FlipbookSizeY`). Leave transparent spacing between frames; mip filtering can bleed neighbours.
- **Flipbook memory:** clients automatically **disable flipbooks when low on memory** (likely on older phones). Reuse textures and keep resolutions small.
- **`Emit(count)`** emits instantly; the default count is 16.
- **`TimeScale`** 0..1 slows or freezes the whole effect (1 normal, 0 frozen).
- **Fill rate:** the docs warn that particle *size on screen* drives GPU cost; more pixels covered = more cost.

## 2. Properties that matter for game VFX

| Property | Use |
|---|---|
| `Shape` (`Box`, `Sphere`, `Cylinder`, `Disc`), `ShapeStyle` (`Volume`, `Surface`), `ShapeInOut` (`Outward`, `Inward`, `InAndOut`), `ShapePartial` | Where particles spawn and which way they fly. A `Disc` + `Surface` + `Outward` on a flat part makes a perfect ground ring burst |
| `EmissionDirection` | Face of the parent part particles emit from (when the shape is the parent's box) |
| `Speed`, `SpreadAngle`, `Acceleration`, `Drag` | Motion. High speed + high drag = explosive start that settles |
| `Size`, `Squash` (NumberSequences) | Growth over life; `Squash > 0` stretches vertically, `< 0` horizontally. Squash makes sparks streak |
| `Orientation` (`FacingCamera`, `FacingCameraWorldUp`, `VelocityParallel`, `VelocityPerpendicular`) | `VelocityParallel` + thin texture = streaking sparks; `FacingCameraWorldUp` for fire that should not roll with the camera |
| `Rotation`, `RotSpeed` | Randomized spin, stops repeated-stamp look |
| `LightEmission` (0..1) | Additive blending. 1 for fire/energy/sparks; 0 for smoke and dust |
| `LightInfluence` (0..1) | 0 = self-lit (energy); 1 = lit by world (dust, smoke, rain) |
| `Brightness` | Boost self-lit particles, pairs with bloom |
| `LockedToPart` | Particles move with the emitter (auras, engine glow). Off for trails of smoke |
| `VelocityInheritance` | Fraction of the parent's velocity added at spawn; nice for exhaust and muzzle smoke |
| `WindAffectsDrag` | Particles follow `Workspace.GlobalWind`, scaled by drag |
| `ZOffset` | Sort order nudge between overlapping transparent effects |
| `FlipbookMode` (`Loop`, `OneShot`, `PingPong`, `Random`), `FlipbookFramerate`, `FlipbookStartRandom` | `OneShot` spreads frames over each particle's lifetime (ignores framerate) - right for explosions |

## 3. Bursts, not running emitters

For hits, explosions and casts, leave `Enabled = false` and `Rate = 0`, and call `Emit()`. A common convention among Roblox VFX artists is to store the burst recipe as **attributes on each emitter** so artists can tune without code:

- `EmitCount` (number): particles per burst
- `EmitDelay` (number, seconds): delay before this emitter fires
- `EmitDuration` (number, seconds, optional): if set, enable for this long instead of a single `Emit`

```lua
--!strict
-- ReplicatedStorage/Shared/BurstPlayer.lua  (client)
-- Plays every ParticleEmitter under an effect template according to its attributes.
local Debris = game:GetService("Debris")
local Workspace = game:GetService("Workspace")

local BurstPlayer = {}

local qualityScale = 1 -- set from your quality tier: 1 high, 0.6 mid, 0.35 low

function BurstPlayer.setQuality(scale: number)
	qualityScale = math.clamp(scale, 0.1, 1)
end

local function fire(emitter: ParticleEmitter)
	local count = emitter:GetAttribute("EmitCount")
	local delay = emitter:GetAttribute("EmitDelay")
	local duration = emitter:GetAttribute("EmitDuration")
	local function go()
		if typeof(duration) == "number" and duration > 0 then
			emitter.Enabled = true
			task.delay(duration, function() emitter.Enabled = false end)
		else
			local n = if typeof(count) == "number" then count else 10
			emitter:Emit(math.max(1, math.floor(n * qualityScale + 0.5)))
		end
	end
	if typeof(delay) == "number" and delay > 0 then
		task.delay(delay, go)
	else
		go()
	end
end

-- template: an Attachment or Part containing emitters (and optionally lights).
-- Clones it at `cf`, plays it, cleans up after the longest particle lifetime.
function BurstPlayer.play(template: Instance, cf: CFrame, parent: Instance?): Instance
	local holder: Instance
	if template:IsA("Attachment") then
		local att = template:Clone()
		att.Parent = Workspace.Terrain
		att.WorldCFrame = cf
		holder = att
	else
		local part = template:Clone() :: BasePart
		part.Anchored = true
		part.CanCollide, part.CanQuery, part.CanTouch = false, false, false
		part.Transparency = 1
		part.CFrame = cf
		part.Parent = parent or Workspace
		holder = part
	end

	local longest = 0
	for _, d in holder:GetDescendants() do
		if d:IsA("ParticleEmitter") then
			d.Enabled = false
			fire(d)
			local delay = d:GetAttribute("EmitDelay")
			local dur = d:GetAttribute("EmitDuration")
			local t = (if typeof(delay) == "number" then delay else 0)
				+ (if typeof(dur) == "number" then dur else 0)
				+ d.Lifetime.Max
			longest = math.max(longest, t)
		end
	end
	Debris:AddItem(holder, longest + 0.1)
	return holder
end

return BurstPlayer
```

`Debris:AddItem` is fine here because the holder lives a known, short time. For very frequent effects (bullet impacts), pool holders instead ([[Object Pooling Without Making a Mess]]).

## 4. Recipes (starting values)

All values are tested-feeling starting points, not engine rules. Units: studs and seconds.

### Hit sparks (melee/bullet impact)

| Property | Value |
|---|---|
| Texture | thin bright streak (white) |
| `Orientation` | `VelocityParallel` |
| `Squash` | 1.5 → 0 |
| `Size` | 0.25 → 0 |
| `Speed` | 25 to 45; `SpreadAngle` (60, 60) |
| `Drag` | 6; `Acceleration` (0, -40, 0) |
| `Lifetime` | 0.15 to 0.3 |
| `LightEmission` | 1; `LightInfluence` 0; `Brightness` 2 |
| `EmitCount` | 10 to 16 |

Pair with the `VFX_Impact_Star` mesh flash ([[Mesh VFX Recipes with the Top G VFX Mesh Pack]]).

### Ground dust ring (landing, slam)

`Shape = Disc`, `ShapeStyle = Surface`, `ShapeInOut = Outward`, emitter part laid flat; `Speed` 12 to 18, `Drag` 4, `Size` 1.5 → 4, `Transparency` 0.4 → 1, `Lifetime` 0.6 to 1.0, `LightEmission` 0, `LightInfluence` 1, colour sampled from the ground material, `EmitCount` 20. The `VFX_Shockwave_Ring_Wide` mesh on top makes it read at a distance.

### Explosion (flipbook core + smoke + embers)

1. **Core:** 8×8 explosion flipbook, `FlipbookMode = OneShot`, `Lifetime` 0.6, `Size` 6 → 10, `LightEmission` 1, `EmitCount` 2 to 3, `Rotation` random.
2. **Smoke:** soft smoke texture (the bundled `T_Noise_Smoke` works as a base), `Lifetime` 2 to 3, `Size` 4 → 12, `Transparency` 0.3 → 1, `Speed` 3 to 6, `Acceleration` (0, 3, 0), `LightEmission` 0, `LightInfluence` 1, `EmitCount` 8, `EmitDelay` 0.05.
3. **Embers:** like sparks but `Lifetime` 1 to 1.5, `Acceleration` (0, -15, 0), `EmitCount` 20, `EmitDelay` 0.02.
4. Brief `PointLight` (range 20 to 30, 0.15 s).

The layered approach and timing are expanded in [[Explosion and Fireball Production — Layered, Fast, Readable]].

### Magic aura (continuous)

`LockedToPart = true`, `Rate` 15 to 30, `Lifetime` 0.8 to 1.2, `Speed` 1 to 2, `Shape = Cylinder`, `ShapeStyle = Surface` around the character, `Acceleration` (0, 4, 0), `Size` 0.6 → 0, `LightEmission` 1. Keep it *low rate*: auras are on screen for a long time and add up across players.

### Muzzle smoke puff

`VelocityInheritance` 0.3, `Speed` 4 to 8 along the barrel, `Drag` 3, `Size` 0.6 → 2.5, `Lifetime` 0.6, `Transparency` 0.5 → 1, `LightInfluence` 1, `EmitCount` 3. Plus a single-frame flash mesh (`VFX_Cone_Burst` or `VFX_Flare_Star3`).

## 5. Flipbooks: when they are worth it

Use a flipbook when the shape must *change* (fire licking, explosion billowing, smoke curling). Use a static texture with size/rotation animation when it only needs to grow and fade.

- 4×4 at 512×512 (128 px frames) is enough for most hit effects on mobile screens.
- Reuse one fire flipbook across all fire effects; tint with `Color`.
- Because flipbooks can be auto-disabled on low memory, the first frame of the sheet should still look acceptable as a static fallback.
- `FlipbookStartRandom = true` for looping fire, so many particles do not animate in sync.

## 6. Freezing and slow motion

`TimeScale` freezes or slows an emitter's particles. Use it with hitstop for an anime freeze-frame (`TimeScale = 0` for 0.08 s, then back to 1) and for "bullet time" moments. See [[Hitstop, Screen Shake and Camera Impact Feel]].

## 7. Budget rules

1. **Screen coverage beats particle count.** Ten huge soft smoke particles covering the screen cost more than 200 tiny sparks.
2. **Cap per-effect counts by quality tier** (the `BurstPlayer.setQuality` hook). Tiers: [[Quality Tier Settings]].
3. **Distance cull** non-essential effects beyond ~150 studs.
4. **Avoid always-on emitters** in the world unless visible and important; disable them when far (`Enabled = false`).
5. **Mobile rate is lower** (100/s per emitter per the docs): an emitter tuned at 300/s on PC will look different on phones. Prefer bursts with fewer, larger, well-designed particles.
6. **Rain and weather** hit particle limits fastest; follow the docs' advice (lower emitters, shorter lifetimes, smaller areas) and [[Weather Performance Budgets]].
7. **Check both quality extremes** in Studio (Editor Quality Level lowest and highest), as the docs recommend.

## Common mistakes

- Running emitters with high `Rate` for one-shot effects instead of `Emit()`.
- `LightEmission = 1` on smoke, making it glow.
- Huge semi-transparent particles filling the screen on every hit.
- Flipbook sheets without frame padding (bleeding edges).
- 2048×2048 unique flipbooks per effect.
- Emitters left under destroyed parts with no cleanup, or cleanup that kills particles mid-life.
- Particle effects spawned by the server for every client.
- Tuning only on a high-end PC.

## Checklist

- [ ] Burst effects use `Enabled = false` + `Emit()` with `EmitCount`/`EmitDelay` attributes.
- [ ] Cleanup after the longest `Lifetime.Max` (or pooled).
- [ ] Additive vs lit decided per layer (`LightEmission`, `LightInfluence`).
- [ ] Flipbooks padded, small, shared, with acceptable first frame.
- [ ] Quality-tier scaling of emit counts.
- [ ] Distance culling of non-essential emitters.
- [ ] Tested at Studio's lowest quality level and on a real phone.

---

**Related:** [[VFX - Hub]] · [[VFX Framework]] · [[VFX looks good but kills FPS]] · [[VFX Budget and Readability]] · [[Fire, Smoke, Lightning and Destruction]] · [[Explosion and Fireball Production — Layered, Fast, Readable]]
