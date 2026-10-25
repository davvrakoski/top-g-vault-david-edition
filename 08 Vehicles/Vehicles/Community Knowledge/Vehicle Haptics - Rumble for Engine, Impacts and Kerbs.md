---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Vehicle Haptics - Rumble for Engine, Impacts and Kerbs"
tags: [roblox, community-knowledge, vehicles, haptics, gamepad, mobile, game-feel]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/HapticEffect
  - https://create.roblox.com/docs/reference/engine/classes/HapticService
  - https://create.roblox.com/docs/reference/engine/enums/HapticEffectType
  - https://create.roblox.com/docs/reference/engine/enums/VibrationMotor
---
# Vehicle Haptics - Rumble for Engine, Impacts and Kerbs

Driving is the genre where controller rumble adds the most for the least work: a thud on a crash, a buzz on the rumble strip, a soft pulse at the rev limiter. Roblox now supports haptics on phones (most iPhone, Pixel and Galaxy devices), PlayStation and Xbox pads and Quest Touch controllers through `HapticEffect`, with the older `HapticService:SetMotor` still available for direct motor control.

## Two APIs
| API | Good for | How |
|---|---|---|
| `HapticEffect` (newer) | One-shot events and simple loops on all supported devices | Create an instance, set `Type`, call `Play()` |
| `HapticService:SetMotor(Enum.UserInputType.Gamepad1, motor, value)` | Continuous, speed-linked rumble on gamepads | Set intensity 0..1 every few frames, set 0 to stop |

`HapticEffect.Type` presets include `GameplayCollision` (a big immediate rumble that dies down fast: crashes), `GameplayExplosion` (large-scale events: explosions, huge landings), and UI types (`UIHover`, `UIClick`, `UINotification`) for menus. `Custom` lets you shape your own waveform with `SetWaveformKeys` using `FloatCurveKey`s (time in milliseconds, value 0..1).

`VibrationMotor` values: `Large`, `Small`, `LeftTrigger`, `RightTrigger`, `LeftHand`, `RightHand`. Check `HapticService:IsMotorSupported(Enum.UserInputType.Gamepad1, motor)` before using trigger motors; many pads lack them.

## Crash thud (all devices)
```lua
-- LocalScript, driver only
local crash = Instance.new("HapticEffect")
crash.Type = Enum.HapticEffectType.GameplayCollision
crash.Parent = script -- client-side instance (parenting requirement: unverified, test on device)

local lastVel = Vector3.zero
RunService.Heartbeat:Connect(function()
	local v = chassis.AssemblyLinearVelocity
	local delta = (v - lastVel).Magnitude
	lastVel = v
	if delta > 60 then -- sudden speed change = impact; tune
		crash:Play()
	end
end)
```

## Engine and surface buzz (gamepad)
```lua
local HapticService = game:GetService("HapticService")
local PAD = Enum.UserInputType.Gamepad1
local smallOk = HapticService:IsMotorSupported(PAD, Enum.VibrationMotor.Small)

local function updateRumble(rpm01: number, onKerb: boolean)
	if not smallOk then return end
	local base = rpm01 > 0.95 and 0.25 or 0 -- limiter pulse only near redline
	local kerb = onKerb and 0.5 or 0
	HapticService:SetMotor(PAD, Enum.VibrationMotor.Small, math.max(base, kerb))
end
```
Detect kerbs by raycasting under the wheels and checking a tag or material on the hit part.

## Rules
- **Always stop.** Set motors to 0 when the player exits the car, the car is destroyed, the menu opens or the window loses focus. A stuck rumble is the worst haptic bug.
- **Settings toggle.** Offer "Vibration: On / Off" and respect it everywhere (accessibility and battery).
- **Driver only.** Never rumble for other players' crashes unless they hit you.
- **Do not rumble constantly.** Continuous engine rumble at low levels gets tiring; keep it to limiter, kerbs, boost and impacts.
- **Test on hardware.** Studio's Controller Emulator cannot tell you how it feels; test on a real pad and a real phone.

## Related
[[Vehicles - Hub]] · [[Hitstop, Screen Shake and Camera Impact Feel]] · [[Gamepad and Console Design]] · [[Vehicle Input Actions - Keyboard, Gamepad Triggers and Touch Pedals]]
