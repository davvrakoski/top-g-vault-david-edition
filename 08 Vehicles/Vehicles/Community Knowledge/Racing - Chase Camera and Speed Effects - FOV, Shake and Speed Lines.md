---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Racing - Chase Camera and Speed Effects - FOV, Shake and Speed Lines"
tags: [roblox, community-knowledge, vehicles, racing, camera, game-feel]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/fov-based-on-vehicle-speed/1284190
  - https://devforum.roblox.com/t/fov-based-on-characters-speed/1931197
  - https://devforum.roblox.com/t/fov-depending-on-car-speed-script-not-working/1820632
  - https://devforum.roblox.com/t/how-to-make-a-game-feel-like-its-speedy/641035
  - https://create.roblox.com/docs/reference/engine/classes/Camera
  - https://create.roblox.com/docs/reference/engine/classes/RunService
---
# Racing - Chase Camera and Speed Effects - FOV, Shake and Speed Lines

Roblox's default vehicle camera is fine for driving around, but racing needs a camera that **shows speed**: it lags slightly behind on acceleration, swings into drifts and widens its field of view at speed. Speed perception is mostly camera and screen effects, not the number on the speedometer. Generic FOV punches and shake are in [[FOV Punch, Sprint FOV and Zoom]] and [[Trauma-Based Camera Shake]]; this is the car-specific setup.

## 1. A scripted chase cam

Set `Camera.CameraType = Enum.CameraType.Scriptable` while driving and update in `RunService:BindToRenderStep("RaceCam", Enum.RenderPriority.Camera.Value + 1, fn)`.

```lua
local cam = workspace.CurrentCamera
local camPos: Vector3? = nil
local function update(dt: number)
	local cf = chassis.CFrame
	local vel = chassis.AssemblyLinearVelocity
	local speed = vel.Magnitude
	-- aim slightly ahead in the direction of travel, not only where the nose points
	local travel = speed > 5 and vel.Unit or cf.LookVector
	local aimDir = (cf.LookVector * 0.6 + travel * 0.4).Unit
	local back = 14 + math.clamp(speed * 0.03, 0, 4)       -- pull back a little at speed
	local desired = cf.Position - aimDir * back + Vector3.yAxis * 4.5
	local alpha = 1 - math.exp(-8 * dt)                     -- frame-rate independent smoothing
	camPos = camPos and camPos:Lerp(desired, alpha) or desired
	cam.CFrame = CFrame.lookAt(camPos, cf.Position + aimDir * 10 + Vector3.yAxis * 1.5)
end
```

- The `exp` smoothing keeps the same feel at 30 and 240 FPS (see [[Frame-Rate Independent Camera Smoothing]]).
- Blending travel direction into the aim makes drifts read: the camera looks where the car is *going*.
- Raycast from the car to `camPos` and pull the camera in when a wall is in the way.
- Offer 2-3 views (chase near, chase far, bonnet/first-person) on one key; remember the choice.

## 2. Speed FOV

DevForum FOV threads agree on three points: read real velocity (not a text label; one bug was a string speed), smooth it, and set it from a LocalScript only.

```lua
local BASE, MAX = 70, 95
local targetFov = BASE + math.clamp((speed - 40) / 160, 0, 1) * (MAX - BASE)
if boosting then targetFov += 8 end
cam.FieldOfView += (targetFov - cam.FieldOfView) * (1 - math.exp(-4 * dt))
```

Keep the max under ~100: higher distorts the car at the screen edge. Add an accessibility toggle to reduce FOV changes (motion sickness).

## 3. Shake

- Tiny constant high-frequency shake above ~70% top speed (amplitude 0.02-0.05 studs) sells "on the edge".
- Bigger trauma shake on impacts, landing from jumps and kerbs, scaled by impact strength.
- Apply shake as an offset *after* the smoothing step, never inside it, or the camera drifts.

## 4. Speed lines and wind

The speedy-feel thread asks the usual question (beams, trails or particles?). Reliable options:

- **ParticleEmitter** on an attachment ~6 studs in front of the camera, `LockedToPart = true`, thin streak texture, `Rate` and `Speed` driven by vehicle speed, emitting toward the camera. Only visible on the client that owns the camera.
- **ScreenGui** with a radial streak image whose `ImageTransparency` falls from 1 to 0.6 as speed rises; cheapest, works well on mobile.
- Trails on the car's rear lights at high speed (also visible to other players).
- Slight `BlurEffect` (Size 2-4) during boost only; constant blur hurts readability.

## 5. Sound and camera together

Pitch wind noise up with speed and duck music slightly at max speed. Camera and audio changes on the same curve feel like one effect.

## Checklist

- [ ] Scriptable chase cam with exp smoothing and wall pull-in.
- [ ] Speed-scaled FOV, boost kick, accessibility toggle.
- [ ] Shake as a post-offset; impact trauma.
- [ ] Speed lines scaled by speed, client only.

## Related
[[Vehicles - Hub]] · [[Vehicle Enter - Exit, Seats and Camera]] · [[FOV Punch, Sprint FOV and Zoom]] · [[Trauma-Based Camera Shake]]
