---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
tags: [deep-dive, roblox, vfx, beams, trails, attachments]
cssclasses: [tg-a11]
---

# Beams, Trails and Attachments - Production Setups

> **Why this matters:** Beams and Trails are the cheapest way to draw glowing lines, ribbons and scrolling energy on Roblox, and the only built-in way to get scrolling textures. Most developers only use 10% of them because the attachment-axis rules are not obvious.
> This note covers the properties that matter, the Bézier maths for aiming curves, and six ready setups (sword trail, laser, arc, chain lightning, tether, boost-pad arrows).

---

## 1. Attachments are the whole trick

Both `Beam` and `Trail` draw between two `Attachment`s (`Attachment0`, `Attachment1`). What surprises people:

- **Orientation matters.** A beam's curve leaves `Attachment0` along its **+X axis** and arrives at `Attachment1` along its **-X axis** (the Beams page defines control point P1 as `CurveSize0` studs along Attachment0's +X, and P2 as `CurveSize1` studs along Attachment1's -X).
- **Beam segments rotate with the attachments.** If the two attachments are rotated differently, the ribbon twists. For a flat ribbon, keep them aligned or use `FaceCamera = true`.
- **Attachments can live anywhere.** An attachment parented to `workspace.Terrain` acts as a free world-space point. That is the standard way to aim a beam at a raycast hit.
- **Trails** draw a ribbon between the *paths* the two attachments sweep over time. The distance between the two attachments is the trail width.

## 2. Beam properties that matter

| Property | What it does | Production notes |
|---|---|---|
| `Width0` / `Width1` | Width at each end (studs) | Taper (e.g. 1 → 0.2) reads as energy flowing toward the end |
| `CurveSize0` / `CurveSize1` | Bézier handle lengths | 0 = straight |
| `Segments` | Straight pieces approximating the curve | Default 10. Colour/transparency gradients need at least keypoints-1 segments |
| `Texture` | Image along the beam | White textures tinted by `Color` |
| `TextureMode` | `Wrap`, `Stretch`, `Static` | `Wrap`/`Static`: repeats = length / `TextureLength`; `Stretch`: repeats `TextureLength` times regardless of length |
| `TextureLength` | Repeat length or count | See above |
| `TextureSpeed` | Texture cycles per second | Default 1; negative reverses. Scrolls from Attachment0 to Attachment1 |
| `SetTextureOffset(offset)` | Manually offsets the texture | For syncing several beams |
| `FaceCamera` | Ribbon always faces the camera | On for lasers and lightning; off for flat floor arrows |
| `LightEmission` | 0 to 1 additive blending | 1 = glowy additive look |
| `LightInfluence` | 0 to 1 how much world light affects it | 0 for self-lit energy, 1 for smoke/dust |
| `Brightness` | Multiplier when light influence is low | Pair with bloom |
| `ZOffset` | Render ordering nudge | Fixes beams sorting behind other transparent effects |
| `Transparency` / `Color` | Sequences along the length | Fade both ends to hide hard caps |

## 3. Trail properties that matter

| Property | What it does | Notes |
|---|---|---|
| `Lifetime` | How long each point lives (0.01 to 20 s) | Sword trails 0.12 to 0.25 s; vehicle light streaks 0.3 to 0.6 s |
| `MinLength` | Minimum movement before a new segment | Raise to reduce segment count on slow movement |
| `MaxLength` | Maximum total length | Caps very long streaks |
| `WidthScale` | Width over lifetime (sequence) | Taper to 0 for a sharp tail |
| `FaceCamera` | Face the camera | On for thin projectile trails |
| `TextureMode` / `TextureLength` | Same as beams | `Stretch` fits one texture across the whole trail |
| `Enabled` | Start/stop emitting | Toggle from animation markers |
| `Clear()` | Removes existing segments | Call after teleporting or respawning, or you get a streak across the map |

## 4. Setup: sword trail

1. Two attachments on the blade: `TrailTop` near the tip, `TrailBottom` near the guard.
2. A `Trail` with `Attachment0 = TrailBottom`, `Attachment1 = TrailTop`, `Lifetime = 0.18`, `LightEmission = 1`, `Transparency` sequence `0 → 1`, `WidthScale` `1 → 0.3`, `Enabled = false`.
3. Enable on the `HitStart` marker, disable on `ComboClose` (or a little after `HitEnd`) so the trail shows the whole swing:

```lua
local trail = blade:FindFirstChild("SwingTrail") :: Trail
track:GetMarkerReachedSignal("HitStart"):Connect(function() trail.Enabled = true end)
track:GetMarkerReachedSignal("HitEnd"):Connect(function()
	task.delay(0.05, function() trail.Enabled = false end)
end)
track.Stopped:Connect(function() trail.Enabled = false end)
```

Pair the trail with a mesh slash for heavy swings ([[Mesh VFX Recipes with the Top G VFX Mesh Pack]]): the trail shows the exact blade path, the mesh shows the "power".

## 5. Setup: laser beam to a raycast hit

```lua
--!strict
-- Client: continuous laser from a muzzle attachment to whatever it hits.
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local function makeLaser(muzzle: Attachment, ignore: { Instance })
	local endAtt = Instance.new("Attachment")
	endAtt.Name = "LaserEnd"
	endAtt.Parent = Workspace.Terrain

	local beam = Instance.new("Beam")
	beam.Attachment0 = muzzle
	beam.Attachment1 = endAtt
	beam.FaceCamera = true
	beam.Width0, beam.Width1 = 0.35, 0.25
	beam.LightEmission = 1
	beam.LightInfluence = 0
	beam.Brightness = 3
	beam.Color = ColorSequence.new(Color3.fromRGB(255, 60, 60))
	beam.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0.1),
		NumberSequenceKeypoint.new(0.9, 0.2),
		NumberSequenceKeypoint.new(1, 1),
	})
	beam.Segments = 2              -- straight beam: no need for curve resolution
	beam.TextureMode = Enum.TextureMode.Wrap
	beam.TextureLength = 4
	beam.TextureSpeed = 3          -- requires a Texture asset to be visible; set beam.Texture to your noise strip
	beam.Parent = muzzle

	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.FilterDescendantsInstances = ignore

	local conn = RunService.PreRender:Connect(function()
		local origin = muzzle.WorldPosition
		local dir = muzzle.WorldCFrame.LookVector * 300
		local hit = Workspace:Raycast(origin, dir, params)
		endAtt.WorldPosition = if hit then hit.Position else origin + dir
		-- subtle width flicker sells "energy"
		local w = 0.3 + 0.06 * math.sin(os.clock() * 40)
		beam.Width0 = w
	end)

	return function()
		conn:Disconnect()
		beam:Destroy()
		endAtt:Destroy()
	end
end
```

The noise texture can be the bundled `T_Noise_Smoke` (uploaded as an image asset). With `TextureMode.Wrap` and `TextureLength = 4`, a 40-stud laser shows 10 repeats and the scroll speed stays visually constant as the beam length changes.

## 6. Setup: curved arc through a control point (Bézier fitting)

Designers think in "go from A to B, bulging through C" (a quadratic curve). Beams are cubic Béziers. The exact conversion:

- `P1 = A + (2/3)(C - A)`
- `P2 = B + (2/3)(C - B)`

Then orient `Attachment0` so its +X points from A to P1, `Attachment1` so its -X points from B to P2, and set the curve sizes to those distances.

```lua
--!strict
-- Returns a CFrame at `pos` whose +X axis points along `xDir`.
local function frameWithX(pos: Vector3, xDir: Vector3): CFrame
	local x = xDir.Unit
	local upGuess = if math.abs(x.Y) < 0.99 then Vector3.yAxis else Vector3.zAxis
	local z = x:Cross(upGuess).Unit
	local y = z:Cross(x).Unit
	return CFrame.fromMatrix(pos, x, y, z)
end

-- Aim beam (attachments a0, a1 parented to Terrain) along the quadratic curve A -> C -> B.
local function setArc(beam: Beam, a0: Attachment, a1: Attachment, A: Vector3, C: Vector3, B: Vector3)
	local P1 = A + (C - A) * (2 / 3)
	local P2 = B + (C - B) * (2 / 3)
	a0.WorldCFrame = frameWithX(A, P1 - A)
	a1.WorldCFrame = frameWithX(B, B - P2)   -- -X must point toward P2, so +X points away from it
	beam.CurveSize0 = (P1 - A).Magnitude
	beam.CurveSize1 = (P2 - B).Magnitude
	beam.Segments = 20
end
```

Uses: grenade trajectory preview (C = apex of the throw), magic arcs between allies, healing tethers that sag. For a gravity arc preview the projectile maths is exactly a quadratic, so this conversion is exact ([[Projectile Ballistics Math]]).

## 7. Setup: chain lightning

Lightning between targets looks alive when the path changes 15 to 25 times per second. Use 3 to 4 short beams per link with jittered midpoints:

```lua
local function lightningLink(beams: { Beam }, atts: { Attachment }, from: Vector3, to: Vector3, jitter: number)
	-- atts has #beams + 1 attachments in Terrain; beams[i] connects atts[i] -> atts[i+1]
	local n = #beams
	for i = 0, n do
		local t = i / n
		local p = from:Lerp(to, t)
		if i > 0 and i < n then
			p += Vector3.new(math.random() - 0.5, math.random() - 0.5, math.random() - 0.5) * jitter * 2
		end
		atts[i + 1].WorldPosition = p
	end
	for _, b in beams do
		b.CurveSize0, b.CurveSize1 = 0, 0
		b.FaceCamera = true
		b.LightEmission = 1
	end
end
-- call lightningLink every 0.05 s for 0.3 s, then fade Transparency to 1
```

Add the bundled `VFX_Lightning_Bolt_A`/`B` meshes for the initial strike frame and a `PointLight` flash. Accessibility for flashes: [[Thunder, Lightning and Accessibility]].

## 8. Setup: tether / grapple rope

A `Beam` between the player's hand attachment and a world attachment at the grapple point, `Segments = 12`, `CurveSize0/1` driven by slack: `slack = math.max(0, ropeLength - distance)`; `CurveSize0 = slack * 0.5`, with Attachment0's +X pointed downward-ish so the rope sags. The physics can be a `RopeConstraint`; the beam is just the visual (RopeConstraint's own visual is thin and plain).

## 9. Setup: boost-pad arrows

A flat beam lying on the pad: two attachments at the pad's back and front edge, oriented identically with +X pointing along the pad (so the curve is straight), `FaceCamera = false`, an arrow texture with `TextureMode = Wrap`, `TextureLength = 2`, `TextureSpeed = 2`. Players read direction instantly. Used in [[Kart Racing Systems - Checkpoints, Laps, Boost Pads and Respawn]].

The ribbon's facing follows the attachments' rotation around the beam direction. If it appears edge-on (a thin line) from above, rotate both attachments 90° around their X axis in Studio until it lies flat; check it from a low camera angle too.

## 10. Performance

- A beam is a handful of triangles per segment; cost is mostly **transparent overdraw** (screen area × layers). Thin beams are almost free; full-screen glowing beams are not.
- `Segments`: 2 for straight beams, 10 to 20 for curves. Higher values rarely look better.
- Trails create segments as they move; `MinLength` and short `Lifetime` keep counts low.
- Disable (`Enabled = false`) instead of destroying effects you will reuse.
- Beams and trails parented under parts that stream out disappear with them; parent persistent effects to attachments on persistent models.

## Common mistakes

- Beam curving the wrong way because Attachment1's -X rule was ignored.
- Twisted ribbons from misaligned attachment orientations.
- Setting `TextureSpeed` on a beam with no `Texture` and wondering why nothing scrolls.
- Colour gradients with more keypoints than `Segments + 1` (gradient looks stepped).
- Trails that streak across the map after a teleport (`Clear()` missing).
- Beam end attachments parented to moving parts by accident.
- `LightInfluence = 1` on energy effects, so they look dark at night.

## Checklist

- [ ] Attachment axes set intentionally (+X out of A0, -X into A1).
- [ ] World-space end points as Terrain attachments.
- [ ] Width taper and end fades on every beam.
- [ ] `TextureMode` chosen for length-independent scrolling (`Wrap`) or fit (`Stretch`).
- [ ] Trails toggled by animation markers and cleared on teleport.
- [ ] Bézier fitting helper used for designer-friendly arcs.
- [ ] `Segments` minimal; overdraw checked on mobile.

---

**Related:** [[VFX - Hub]] · [[Energy Orb and Projectile VFX]] · [[Arc Slash, Crescent and Wave VFX]] · [[Fire, Smoke, Lightning and Destruction]] · [[VFX Performance, LOD and Pooling]] · [[Projectile Ballistics Math]]
