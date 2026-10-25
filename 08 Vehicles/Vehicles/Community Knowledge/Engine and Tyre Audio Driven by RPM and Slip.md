---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Engine and Tyre Audio Driven by RPM and Slip"
tags: [roblox, community-knowledge, vehicles, audio, engine-sound]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Sound
  - https://create.roblox.com/docs/reference/engine/classes/AudioPlayer
  - https://create.roblox.com/docs/reference/engine/classes/AudioPitchShifter
  - https://create.roblox.com/docs/reference/engine/classes/SoundService
  - https://devforum.roblox.com/t/math-for-sounds/1275741
  - https://www.construct.net/en/forum/construct-2/how-do-i-18/accelerating-engine-sound-113907
---
# Engine and Tyre Audio Driven by RPM and Slip

Players judge a car's speed by ear long before they read the speedometer. A single looping engine clip whose pitch follows the engine is the minimum; layering a few loops and adding tyre screech from sideways slip is what makes a Roblox car feel expensive. All of this can run locally on every client from two replicated attributes, with no remote traffic.

## Pitch follows RPM, not speed
The DevForum "Math for sounds" thread starts with the simple version: `PlaybackSpeed = k * speed`. It works for go-karts but sounds wrong once you have gears, because real engines drop pitch on every upshift. Drive pitch from RPM instead (see [[Engine RPM, Gearbox and Torque Curve Model]]):

```lua
local MIN_PITCH, MAX_PITCH = 0.6, 1.8
local IDLE, REDLINE = 900, 7000

local function pitchFor(rpm: number): number
	local t = math.clamp((rpm - IDLE) / (REDLINE - IDLE), 0, 1)
	return MIN_PITCH + (MAX_PITCH - MIN_PITCH) * t
end
```

This is the same min/max mapping a Construct forum answer uses for speed, applied to RPM.

## Which API to use
| Old Sound API | New Audio API |
|---|---|
| `Sound` parented to a part, `PlaybackSpeed` changes pitch **and** tempo | `AudioPlayer` -> `AudioEmitter` on the car, wired with `Wire` |
| Simple, works everywhere | `AudioPlayer.PlaybackSpeed` behaves the same; add an `AudioPitchShifter` (`Pitch`) if you want pitch without speeding up the loop |
| Doppler from `SoundService.DopplerScale` | Distance and angle attenuation curves on `AudioEmitter` |

Both are valid; do not mix them on the same car.

## Layered loops (crossfade)
Stretching one clip from idle to redline sounds like a chipmunk at the top. Record or source 3 loops (low, mid, high RPM), each meant for a band, and crossfade:

```lua
local layers = { -- centre rpm for each loop
	{sound = car.Engine.Low, centre = 1500},
	{sound = car.Engine.Mid, centre = 3800},
	{sound = car.Engine.High, centre = 6200},
}
local WIDTH = 2200

RunService.RenderStepped:Connect(function()
	local rpm = car:GetAttribute("RPM") or IDLE
	local throttle = car:GetAttribute("Throttle") or 0
	for _, layer in layers do
		local w = math.clamp(1 - math.abs(rpm - layer.centre) / WIDTH, 0, 1)
		layer.sound.Volume = w * (0.5 + 0.5 * throttle) -- quieter off-throttle
		layer.sound.PlaybackSpeed = rpm / layer.centre -- each loop near 1.0 in its band
	end
end)
```

Keep every layer playing and looping; changing `Volume` is cheap, starting and stopping sounds every frame is not.

## Tyre screech from slip
Slip is the sideways part of the wheel's velocity:

```lua
local v = chassis.AssemblyLinearVelocity
local sideways = math.abs(chassis.CFrame.RightVector:Dot(v))
local slip = math.clamp((sideways - 8) / 30, 0, 1) -- ignore small slides
screech.Volume = slip * 0.8
screech.PlaybackSpeed = 0.9 + slip * 0.2
```

Also fade screech to 0 when no wheel is touching the ground (raycast or suspension compression), otherwise jumps squeal.

## Mix rules
- Put all vehicle sounds in a `SoundGroup` (or a shared `AudioFader`) so the settings menu can turn cars down.
- The driver hears their own engine louder and less filtered than other cars; branch on "am I the occupant".
- Far cars: cap the number of cars playing full layered audio (nearest 6-8) and give the rest one quiet loop.
- Never start a loud sound at full volume on spawn; ramp in over 0.3 s.
- Only use engine recordings you have the rights to (see [[Free Sound Effect Sources - License Table]]).

## Related
[[Vehicles - Hub]] · [[Audio Mixing and Dynamic Music with the Audio API]] · [[Engine RPM, Gearbox and Torque Curve Model]] · [[Vehicle Dust, Mud and Tire Trail VFX]]
