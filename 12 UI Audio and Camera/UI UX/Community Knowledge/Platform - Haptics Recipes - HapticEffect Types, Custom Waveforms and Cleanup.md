---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - Haptics Recipes - HapticEffect Types, Custom Waveforms and Cleanup"
tags: [roblox, community-knowledge, ui, platform, haptics, mobile, gamepad, vr]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/HapticEffect
  - https://create.roblox.com/docs/reference/engine/enums/HapticEffectType
  - https://create.roblox.com/docs/reference/engine/classes/HapticService
  - https://create.roblox.com/docs/input/mobile
  - https://create.roblox.com/docs/production/publishing/console-guidelines
  - https://devforum.roblox.com/t/3606858
  - https://devforum.roblox.com/t/introducing-new-updates-to-the-haptics-system/4067702
---
# Platform - Haptics Recipes - HapticEffect Types, Custom Waveforms and Cleanup

Vibration is the cheapest "juice" on phones and pads: a 40 ms tick on a button press makes UI feel solid, and a heavy rumble sells an explosion better than any particle. Roblox's `HapticEffect` instance works across phones, PlayStation and Xbox pads and Quest Touch controllers with one API. This note gives ready recipes and the cleanup rules. For driving/engine rumble specifically, see [[Vehicle Haptics - Rumble for Engine, Impacts and Kerbs]].

## Where it works
Per the class docs: Android and iOS phones that support haptics (most iPhone, Pixel and Samsung Galaxy models), PlayStation pads, Xbox pads and the Quest Touch controller. Keyboard/mouse players feel nothing, so haptics must only **add** to feedback that also exists as sound or visuals.

## The preset types (`Enum.HapticEffectType`)

| Type | Feel (docs wording paraphrased) | Use for |
|---|---|---|
| `UIHover` | Light, for browsing over something without triggering it | Gamepad focus moves, dragging over a slot |
| `UIClick` | Crisp, immediate, not overwhelming | Button confirm, purchase, equip |
| `UINotification` | Draws attention away from gameplay | Quest complete, friend joined, timer ending |
| `GameplayCollision` | Big immediate rumble that dies quickly | Hits taken, landing hard, melee impact |
| `GameplayExplosion` | High intensity that lingers | Explosions, boss slam |
| `Custom` | Your own waveform via `SetWaveformKeys` | Heartbeats, engine pulses, charge-up |

## Properties and methods
- `Type`, `Looped` (repeat until `Stop()`), `Position` + `Radius` (where the impact is relative to the device, which shifts it between motors; the docs note some pads lack separate small/large motors and "gamepad large left/right" is not supported on PC).
- `Play()`, `Stop()`, `SetWaveformKeys(keys)`.
- `Ended` event: added in the November 13, 2025 haptics update so you can destroy effects once playback finishes.

## Recipe 1: a one-shot helper with cleanup

```lua
-- ReplicatedStorage/Haptics (ModuleScript, client)
local Haptics = { enabled = true }
local lastPlay: {[Enum.HapticEffectType]: number} = {}
local MIN_GAP = 0.05 -- seconds; stops UIHover spam while scrolling fast

function Haptics.play(kind: Enum.HapticEffectType)
	if not Haptics.enabled then return end
	local now = os.clock()
	if (lastPlay[kind] or 0) + MIN_GAP > now then return end
	lastPlay[kind] = now

	local fx = Instance.new("HapticEffect")
	fx.Type = kind
	fx.Parent = workspace
	local done = false
	local function cleanup()
		if done then return end
		done = true
		fx:Destroy()
	end
	fx.Ended:Once(function()
		task.defer(cleanup) -- deferred: see the crash note below
	end)
	task.delay(3, cleanup) -- fallback in case Ended never fires
	fx:Play()
end

return Haptics
```
Why both `Ended` and a timer: replies on the update thread report `Ended` not firing in some setups (one said only with a gamepad connected), and destroying the effect directly inside `Ended` reportedly crashed Studio with `Workspace.SignalBehavior` set to `Immediate` or `AncestryDeferred` (Roblox said it found the cause). Deferring the destroy and keeping a timer avoids both.

## Recipe 2: custom waveform (heartbeat)
`SetWaveformKeys` takes an array of `FloatCurveKey.new(timeMs, intensity0to1, Enum.KeyInterpolationMode)`:

```lua
local fx = Instance.new("HapticEffect")
fx.Type = Enum.HapticEffectType.Custom
fx.Looped = true
fx:SetWaveformKeys({
	FloatCurveKey.new(0, 0.8, Enum.KeyInterpolationMode.Linear),
	FloatCurveKey.new(60, 0, Enum.KeyInterpolationMode.Constant),
	FloatCurveKey.new(160, 0.5, Enum.KeyInterpolationMode.Linear),
	FloatCurveKey.new(220, 0, Enum.KeyInterpolationMode.Constant),
	FloatCurveKey.new(900, 0, Enum.KeyInterpolationMode.Constant),
})
fx.Parent = workspace
fx:Play() -- call fx:Stop() when health recovers
```
The Racing template in Studio builds its collision curve at runtime from impact force, per the update post: a good reference for intensity scaled by gameplay values.

## Older API: HapticService motors
`HapticService:IsVibrationSupported(gamepad)`, `IsMotorSupported(gamepad, Enum.VibrationMotor.Large)`, `SetMotor(gamepad, motor, intensity)` and `GetMotor` still exist for direct motor control (`Large`, `Small`, `LeftTrigger`, `RightTrigger`, `LeftHand`, `RightHand`). They are gamepad/VR oriented; prefer `HapticEffect` for anything that should also work on phones. Always set a motor back to 0.

## Design rules
- Pair every haptic with a sound or visual.
- Short and rare beats long and constant; the console guidelines warn that constant vibration is unpleasant.
- A settings toggle (and respect it for UI ticks and gameplay rumble separately).
- Scale intensity by importance: UI ticks low, damage medium, explosions high.
- Stop looped effects on death, menu open, teleport and when the window loses focus.

## Related
[[UI UX - Hub]] · [[Vehicle Haptics - Rumble for Engine, Impacts and Kerbs]] · [[Hitstop, Screen Shake and Camera Impact Feel]] · [[Platform - Gamepad Menu Recipes - Custom Highlights, Focus Memory and Navigation Sounds]]
