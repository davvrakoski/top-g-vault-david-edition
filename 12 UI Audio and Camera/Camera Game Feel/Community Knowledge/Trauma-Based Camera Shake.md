---
area: "12 UI Audio and Camera"
cluster: "Camera Game Feel"
title: "Trauma-Based Camera Shake"
tags: [roblox, community-knowledge, camera, screen-shake, game-feel, juice]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.gamedeveloper.com/programming/video-sprucing-up-cameras-with-math
  - https://bevy.org/examples/camera/2d-screen-shake/
  - https://kidscancode.org/godot_recipes/3.x/2d/screen_shake/
  - https://create.roblox.com/docs/reference/engine/classes/RunService
  - https://create.roblox.com/docs/reference/engine/classes/GuiService
---
# Trauma-Based Camera Shake

Most Roblox screen shake is `camera.CFrame *= CFrame.new(math.random(), math.random(), 0)` for a few frames. It looks jittery, ignores frame rate, and several explosions at once either cancel out or go crazy. The "trauma" model, popularised by Squirrel Eiserloh's GDC 2016 math-for-cameras talk and since copied into Bevy, Godot and many other engines, fixes all three: events add trauma, trauma decays over time, shake strength is trauma squared, and motion comes from smooth noise instead of random jumps.

## The model in four rules

1. Keep one number `trauma` between 0 and 1.
2. Events **add** to it: a pistol shot +0.1, a nearby explosion +0.5, taking a big hit +0.3. Clamp at 1.
3. Trauma **decays** linearly, for example 1.0 per second (a full-strength shake lasts about a second).
4. Actual shake = `trauma^2` (or `^3`) times maximum offsets. Small trauma barely shows; big trauma is violent. Stacking events feels natural.

Use **smooth noise** (`math.noise`) sampled along time, not `math.random`, so the camera wobbles instead of teleporting. Rotational shake (small angles) reads stronger than positional shake in 3D and doesn't clip the camera into walls.

## Roblox implementation

Apply the shake **after** the default or custom camera has updated, as an offset on top. Binding just after camera priority does that:

```lua
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local camera = workspace.CurrentCamera

local Shake = { trauma = 0 }
local MAX_YAW, MAX_PITCH, MAX_ROLL = math.rad(2.5), math.rad(2.5), math.rad(4)
local MAX_OFFSET = 0.25 -- studs
local DECAY = 1.1 -- trauma per second
local FREQ = 18 -- noise speed
local seed = math.random() * 1000

function Shake.add(amount: number)
	Shake.trauma = math.clamp(Shake.trauma + amount, 0, 1)
end

RunService:BindToRenderStep("TraumaShake", Enum.RenderPriority.Camera.Value + 1, function(dt)
	if Shake.trauma <= 0 then return end
	Shake.trauma = math.max(0, Shake.trauma - DECAY * dt)

	local s = Shake.trauma * Shake.trauma
	if GuiService.ReducedMotionEnabled then
		s *= 0.25
	end
	local t = os.clock() * FREQ
	local yaw = MAX_YAW * s * math.noise(seed, t)
	local pitch = MAX_PITCH * s * math.noise(seed + 1, t)
	local roll = MAX_ROLL * s * math.noise(seed + 2, t)
	local offset = Vector3.new(math.noise(seed + 3, t), math.noise(seed + 4, t), 0) * MAX_OFFSET * s

	camera.CFrame = camera.CFrame * CFrame.new(offset) * CFrame.Angles(pitch, yaw, roll)
end)

return Shake
```

`math.noise` returns values roughly in -1..1 (often smaller in practice), so tune the max values by eye.

## Distance falloff for world events

For explosions, scale the trauma by distance to the camera so far blasts give a light rumble:

```lua
local function addExplosionShake(pos: Vector3, power: number, radius: number)
	local d = (camera.CFrame.Position - pos).Magnitude
	local falloff = math.clamp(1 - d / radius, 0, 1)
	Shake.add(power * falloff * falloff)
end
```

Fire this from a client-side handler of the server's explosion event (each client shakes its own camera).

## Tuning table (starting points)

| Event | Trauma | Notes |
|---|---|---|
| Own gunshot (light weapon) | 0.05-0.1 | Mostly roll and pitch, tiny |
| Shotgun / sniper | 0.2-0.3 | Pair with an FOV punch |
| Melee hit landed | 0.15 | Pair with hitstop |
| Took heavy damage | 0.3-0.4 | Plus a red screen flash |
| Explosion nearby | 0.5-0.8 with falloff | Add low rumble audio |
| Boss slam / earthquake | Hold trauma at 0.4 for the duration | Re-add each frame instead of a single spike |

## Comfort rules

- Respect `GuiService.ReducedMotionEnabled` and give a separate "screen shake" slider (0-100%).
- Keep positional offset small (well under half a stud) in first person; rotation does most of the work.
- Don't shake the camera during aiming down sights for precision weapons, or reduce it heavily.
- Never shake UI and camera together at high strength; motion sickness rises fast.

## Libraries

If you'd rather not write it, the community `RbxCameraShaker` module (MIT) implements preset shakes; see the linked note. The trauma model above is small enough to own.

## Related
[[Camera Game Feel - Hub]] · [[Custom Camera Systems in Luau]] · [[Camera, Feel and Game Juice]] · [[RbxCameraShaker for VFX Impacts (MIT)]] · [[Hitstop and Impact Freeze]]
